<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="incl.header.jsp" %>

	<!-- Load the required client components -->
	<script src="<%= new com.paypal.BtConfigReader().getBtJavaScriptClient() %>"></script>
	<script src="<%= new com.paypal.BtConfigReader().getBtJavaScriptPayPal() %>"></script>
	<script src="<%= new com.paypal.BtConfigReader().getPayPalCheckout() %>"></script>

		<div class="container-fluid">
            <div class="row">
            
	            <div class="col-sm-5">
	            
	            	<div class="divBorder" style="min-height: 450px;">
					
						<h3>Checkout</h3>
					
						<div style="text-align: center;">
							<h4>Ship to</h4>
						</div>
						
						<form class="form-horizontal" id="bt-payPalButton-form" action="BtCheckoutServlet" method="post">
						
							<input type="hidden" name="checkout" value="pay-now" />
							<input type="hidden" name="payment-method-nonce" class="payment-method-nonce" />
							<input type="hidden" name="item-description" value="DSLR Camera, Auto-focus, A0123" />
							<input type="hidden" id="currency" name="currency" value="<%= request.getParameter("currency")%>" />
							<input type="hidden" id="item-price-original" name="item-price-original" value="<%= request.getParameter("item-price")%>" />							
							<input type="hidden" id="total-amount" name="total-amount" value="<%= request.getParameter("item-price")%>" />
							<input type="hidden" id="recipient" name="recipient" value="" />  
							
							<div class="form-group form-group-sm" style="margin-bottom: 4px;">
						    	<label class="col-sm-3 control-label">First&nbsp;Name</label>
						    	<div class="col-sm-9">
						      		<input class="form-control" type="text" id="first-name" name="first-name" value="Jane">
						    	</div>
						  	</div>
							<div class="form-group form-group-sm" style="margin-bottom: 4px;">
						    	<label class="col-sm-3 control-label">Last&nbsp;Name</label>
						    	<div class="col-sm-9">
						      		<input class="form-control" type="text" id="last-name" name="last-name" value="Doe">
						    	</div>
						  	</div>						
							<div class="form-group form-group-sm" style="margin-bottom: 4px;">
						    	<label class="col-sm-3 control-label">Address&nbsp;1</label>
						    	<div class="col-sm-9">
						      		<input class="form-control" type="text" id="line1" name="line1" value="55 East 52nd Street">
						    	</div>
						  	</div>
							<div class="form-group form-group-sm" style="margin-bottom: 4px;">
						    	<label class="col-sm-3 control-label">Address&nbsp;2</label>
						    	<div class="col-sm-9">
						      		<input class="form-control" type="text" id="line2" name="line2" value="21st Floor">
						    	</div>
						  	</div>							
							<div class="form-group form-group-sm" style="margin-bottom: 4px;">
						    	<label class="col-sm-3 control-label">City</label>
						    	<div class="col-sm-9">
						      		<input class="form-control" type="text" id="city" name="city" value="New York">
						    	</div>
						  	</div>	
							<div class="form-group form-group-sm" style="margin-bottom: 4px;">
						    	<label class="col-sm-3 control-label">State</label>
						    	<div class="col-sm-9">
						      		<input class="form-control" type="text" id="state" name="state" value="NY">
						    	</div>
						  	</div>	
							<div class="form-group form-group-sm" style="margin-bottom: 4px;">
						    	<label class="col-sm-3 control-label">Postal&nbsp;Code</label>
						    	<div class="col-sm-9">
						      		<input class="form-control" type="text" id="postal-code" name="postal-code" value="10022">
						    	</div>
						  	</div>						  	
							<div class="form-group form-group-sm" style="margin-bottom: 4px;">
						    	<label class="col-sm-3 control-label">Country</label>
						    	<div class="col-sm-9">
						      		<select class="form-control input-sm" id="country-code" name="country-code">
										<option value="AU">Australia</option>
										<option value="BR">Brazil</option>
										<option value="CA">Canada</option>
										<option value="CZ">Czech Republic</option>
										<option value="DK">Denmark</option>
										<option value="HK">Hong Kong</option>
										<option value="HU">Hungary</option>
										<option value="IL">Israel</option>
										<option value="JP">Japan</option>
										<option value="MY">Malaysia</option>
										<option value="MX">Mexico</option>
										<option value="NO">Norway</option>
										<option value="NZ">New Zealand</option>
										<option value="PH">Philippines</option>
										<option value="PL">Poland</option>
										<option value="GB">United Kingdom</option>
										<option value="RU">Russia</option>
										<option value="SG">Singapore</option>
										<option value="SE">Sweden</option>
										<option value="CH">Switzerland</option>
										<option value="TH">Thailand</option>
										<option value="TW">Taiwan</option>
										<option selected value="US">United States</option>
									</select>
						    	</div>
						  	</div>
							<div class="form-group form-group-sm" style="margin-bottom: 4px;">
						    	<label class="col-sm-3 control-label">Shipping&nbsp;Type</label>
						    	<div class="col-sm-9">
						      		<select class="form-control input-sm" id="shipping-method" name="shipping-method" onChange="updateTotalAmount(this)">
											<optgroup label="United Parcel Service" style="font-style: normal;">
												<option value="15.00">Worldwide Expedited - 15.00</option>
												<option value="10.00">Worldwide Express Saver - 10.00</option>
											</optgroup>
											<optgroup label="Ground" style="font-style: normal;">
												<option selected="selected" value="5.00">Ground - 5.00</option>
											</optgroup>
									</select>
						    	</div>
						  	</div>
						
						</form>			
												
						<hr />
									
						
						<div>
							<h4 style="text-align: center;">Payment methods</h4>
							
							<div style="text-align: center;">
						
								<span style="font-size: 12pt;">Total amount: </span>
								<span id="total-amount-display" style="font-size: 12pt;"></span>
								<span style="font-size: 12pt;"><%= request.getParameter("currency")%></span>
								<br />
								<br />
							</div>
											
							<div id="payment-methods" style="width: 280px; margin: 0 auto;">
								
								<!-- Render the radio fields and button containers -->
								<label>
								    <input name="payment-option" type="radio" onclick="toggle('continue-div', 'papbutton-div');" checked value="paypal">
								    <img class="mark" alt="Pay with Paypal" src="img/paypal-mark.jpg">
								</label>
								<br />
								<label>
								    <input name="payment-option" type="radio" onclick="toggle('papbutton-div', 'continue-div');" value="card">
								    <img class="mark" alt="Accepting Visa, Mastercard, Discover and American Express" src="img/card-mark.png">
								</label>
								
								<script>
									// radio button toggle 
									function toggle (hide, show) {
										$('.' + hide).css('display', 'none');
										$('.' + show).css('display', 'inline-block');
									}
								</script>
								
								<br />
								<br />
								
								<!-- 	----------------------- 
										PayPal Checkout button 
								 -->
								<div class="papbutton-div">							 																					
									<div id="papbutton" style="padding-left: 10px;"></div>
								</div>
								
								<div class="continue-div" id="card-button-container" style="display: none;">
									<button>Continue</button> <i>Please select the PayPal Mark.</i>
								</div>
													
							</div>
							
							<!-- loader icon while server is processing transaction  -->
							<div style="width: 100%; text-align: center;">
								<div class="loader" style="display: none;"></div>
							</div>
							
						</div>
						
					</div>

				</div>
				
                <!-- ---------  Payment flow diagram section --------- -->
                
                <div class="col-sm-7">
                    <div class="divBorder" style="min-height: 450px;">
                    	<h3>Payment Flow</h3>
                     	<img class="img-responsive" id="flow-step" src="img/pay-now-flow-2.png">
					</div>
                </div>  				
				
				<div class="col-xs-12">
                	<div style="text-align:center;">
                   		<h3>Return to <a href='index.jsp'>Home Page</a></h3>
                	</div>
                </div>
				
			</div>
		</div>
		
		
		<script>
		
			// authorization from server
			var authorization = '<%= new com.paypal.BtTransactionHelper().getToken() %>';
			
			// Checkout with PayPal
			var ppForm = document.getElementById('bt-payPalButton-form');
			var btPayPalButton = document.getElementById('papbutton');

			
			braintree.client.create({
				authorization: authorization
			}, function(clientErr, clientInstance) {

				// Handle error in client creation
				if (clientErr) { 
					console.log('Error creating client instance: ' + clientErr);
					return;
				}

				/* 
					Braintree - PayPal button component 
				*/
				braintree.paypalCheckout.create({
					client: clientInstance
				}, function (createErr, paypalCheckoutInstance) {
					if (createErr) {
						if (createErr.code === 'PAYPAL_BROWSER_NOT_SUPPORTED') {
							console.error('This browser is not supported.');
						} 
						else {
							console.error('Error!', createErr);
						}
						return;
					}
					
					paypal.Button.render({
						// sandbox or production
						env: '<%= new com.paypal.BtConfigReader().getEnvironment() %>', 

						locale: 'en_US',
						
				        style: {
				            size: 'medium',
				            color: 'gold',
				            shape: 'pill',
				            label: 'checkout'
				        },

						payment: function () {
							
							// paypal min-browser opens
							$("#flow-step").attr("src","img/pay-now-flow-3.png");
							
							return paypalCheckoutInstance.createPayment({
								flow: 'checkout',
								intent: 'sale',
								amount: getAmount(),
								currency: getCurrency(),
								locale: 'en_US',
								displayName: 'Demo Portal Test Store',
								enableShippingAddress: true,
								shippingAddressEditable: false,
								shippingAddressOverride: {
									recipientName: getRecipientName(),
									line1: getLine1(),
									line2: getLine2(),
									city: getCity(),
									countryCode: getCountryCode(),
									postalCode: getPostalCode(),
									state: getState()
								}
							});
						},
											
						commit: true, // Show a 'Pay Now' button in the checkout flow

						onAuthorize: function (data, actions) {
							return paypalCheckoutInstance.tokenizePayment(data, function (err1, payload) {
								
								// Pay Now clicked in PayPal mini-browser
								
								if (err1) {
									console.error('onAuthorize: ', err1);
								}
								else {
									console.log('Paypal nonce: ', payload.nonce );
									
									// hide payment methods
									$('#payment-methods').css('display', 'none');
									
									// show spinner
									$('.loader').css('display', 'inline-block');
									
									// 	Put `payload.nonce` into the 'payment-method-nonce' input, then submit the form 
									$('.payment-method-nonce').val(payload.nonce);
									ppForm.submit();
								}
							});
						},

						onCancel: function (data) {
							console.log('onCancel: ', JSON.stringify(data, 0, 2));
							var currentUrl = window.location.protocol + '//' + window.location.host + window.location.pathname;
							var cancelUrl = currentUrl.substring(0, currentUrl.lastIndexOf('/')) + '/cancel.jsp';
							window.location.href = cancelUrl;
						},
						
						onError: function (err) {
							console.log('onError: ', JSON.stringify(err, 0, 2));
							var currentUrl = window.location.href = window.location.protocol + '//' + window.location.host + window.location.pathname;
							var errorUrl = currentUrl.substring(0, currentUrl.lastIndexOf('/')) + '/error.jsp?message=' + encodeURIComponent(err.toString());
							window.location.href = errorUrl;
						}
					}, '#papbutton'); // the PayPal button will be rendered in an html element with the id `papbutton`
				});				

			});

		</script>
		
		<script>
			updateTotalAmount(document.getElementById("shipping-method"));
		
			// adjust total amount based on shipping
			function updateTotalAmount(that) {
				
				var totalAmount = (Number(document.getElementById("item-price-original").value) + Number(that.value)).toFixed(2);
				
				document.getElementById("total-amount").value = totalAmount;
				document.getElementById("total-amount-display").innerHTML = totalAmount;
			}
			
			
			// update "paypalCheckoutInstance.createPayment" with current "Ship to" data prior to payment		
			function getRecipientName() {
				document.getElementById("recipient").value =  document.getElementById("first-name").value + ' ' + document.getElementById("last-name").value;
				return (document.getElementById("first-name").value + ' ' + document.getElementById("last-name").value);
			}
			function getLine1() {
				return (document.getElementById("line1").value);
			}			
			function getLine2() {
				return (document.getElementById("line2").value);
			}
			function getCity() {
				return (document.getElementById("city").value);
			}
			function getState() {
				return (document.getElementById("state").value);
			}
			function getPostalCode() {
				return (document.getElementById("postal-code").value);
			}
			function getCountryCode() {
				return (document.getElementById("country-code").value);
			}			
			function getAmount() {
				return (document.getElementById("total-amount").value);
			}			
			function getCurrency() {
				return (document.getElementById("currency").value);
			}	
		</script>		


<%@ include file="incl.footer.jsp" %>