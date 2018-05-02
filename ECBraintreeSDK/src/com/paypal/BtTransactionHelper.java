package com.paypal;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.braintreegateway.BraintreeGateway;
import com.braintreegateway.Result;
import com.braintreegateway.Transaction;
import com.braintreegateway.TransactionRequest;
import com.braintreegateway.ValidationError;

public class BtTransactionHelper {

	private boolean success;
	private Transaction transaction;
	private Result<Transaction> result;

	// see 'config.properties'
	public BtConfigReader conf = new BtConfigReader();

	// Braintree Gateway via PayPal Access Token
	protected BraintreeGateway gateway = new BraintreeGateway(conf.getAccessToken());

	public String getToken() {
		return gateway.clientToken().generate();
	}

	// "Classic" EC flow
	public void doTransactionEc(BtParameterVo vo) {

		String paymentNonce = vo.getd("payment-method-nonce");
		String amount = vo.getd("total-amount");
		String itemDescription = vo.getd("item-description");
		String orderId = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));

		String merchantAccountId = vo.getd("currency");

		System.out.println("doTransactionEc:");
		System.out.println("  paymentNonce: " + paymentNonce);
		System.out.println("  amount: " + amount);
		System.out.println("  Currency: " + merchantAccountId);

		try {
			// transaction
			TransactionRequest transactionRequest = new TransactionRequest().channel(conf.getBtChannel())
					.amount(new BigDecimal(amount)).paymentMethodNonce(paymentNonce)
					.merchantAccountId(merchantAccountId).orderId(orderId).options().paypal()
					.customField("Custom field message").description(itemDescription).done().submitForSettlement(true)
					.done();

			result = gateway.transaction().sale(transactionRequest);

		} catch (NullPointerException ex) {
			System.err.println("ERROR: The transaction contained invalid data.");
			return;
		}

		setSuccess(result.isSuccess());

		// true/false
		System.out.println("result.isSuccess(): " + result.isSuccess());

		if (result.isSuccess() == false) {

			setTransaction(result.getTransaction());
		} else {
			setTransaction(result.getTarget());

			// show PayPal details
			logPayPalDetails(result);
		}
	}

	private void logPayPalDetails(Result<Transaction> result) {
		System.out.println(
				"result.getTarget().getPaymentInstrumentType(): " + result.getTarget().getPaymentInstrumentType());
		System.out.println("result.getTarget().getPayPalDetails().getCaptureId(): "
				+ result.getTarget().getPayPalDetails().getCaptureId());
		System.out.println("result.getTarget().getPayPalDetails().getPaymentId(): "
				+ result.getTarget().getPayPalDetails().getPaymentId());
		System.out.println("result.getTarget().getPayPalDetails().getPayerFirstName(): "
				+ result.getTarget().getPayPalDetails().getPayerFirstName());
		System.out.println("result.getTarget().getPayPalDetails().getPayerLastName(): "
				+ result.getTarget().getPayPalDetails().getPayerLastName());
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean result) {
		this.success = result;
	}

	public Transaction getTransaction() {
		return transaction;
	}

	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}

	public Result<Transaction> getResult() {
		return result;
	}

	public void addSuccessParameters(BtParameterVo vo) {
		// use PayPal transaction id if available
		String transId = (transaction.getPaymentInstrumentType().equals("paypal_account"))
				? transaction.getPayPalDetails().getCaptureId()
				: // PayPal transaction ID
				transaction.getId(); // Braintree transaction ID

		vo.add("email", transaction.getStatusHistory().get(0).getUser());
		vo.add("status", "Approved");
		vo.add("transactionid", transId);
	}

	public void failurTransactionMessage() {
		System.out.println("Error processing transaction:");
		System.out.println("  Status: " + transaction.getStatus());
		System.out.println("  Code: " + transaction.getProcessorResponseCode());
		System.out.println("  Text: " + transaction.getProcessorResponseText());
	}

	public String getFailureTransactionMessage() {
		return ("<b>Status:</b> " + transaction.getStatus() + "<br /><br />" + "<b>Code: </b>"
				+ transaction.getProcessorResponseCode() + "<br /><br />" + "<b>Text: </b>"
				+ transaction.getProcessorResponseText());
	}

	public void addFailueLog() {
		for (ValidationError error : result.getErrors().getAllDeepValidationErrors()) {
			System.out.println("Attribute: " + error.getAttribute());
			System.out.println("  Code: " + error.getCode());
			System.out.println("  Message: " + error.getMessage());
		}
	}

	public String getErrorMessage() {
		String message = null;

		for (ValidationError error : result.getErrors().getAllDeepValidationErrors()) {
			message = error.getMessage();
		}
		return message;
	}
}
