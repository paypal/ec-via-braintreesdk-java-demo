<h3>Readme</h3>

<br />

<h4>Getting Started</h4>

<br />
<br />
 This code sample demonstrates two different payment experiences using <strong>Express Checkout via Braintree SDK</strong>. 
<br />
<br />
 A Braintree account is not required because the server-side Braintree SDK is initialized with a PayPal Access Token. 
<br />
<br />
For more information on accepting Express Checkout via Braintree SDK, please refer to the 
<a href="https://developer.paypal.com/docs/accept-payments/express-checkout/ec-braintree-sdk/get-started/" target="_blank">Get Started Guide</a>.
<br />
<br />
In "config.properties", set up the ACCESS_TOKEN for the merchant account that will be used and set ENVIRONMENT to sandbox or production. This merchant account needs to be set up with currencies that will be accepted. 
<br />
<br />
For currencies' support please refer to <a href="https://developer.paypal.com/docs/accept-payments/express-checkout/ec-braintree-sdk/countries/" target="_blank">Braintree SDK Country Support</a>.


<br />
<br />
<br />

<h4>Sandbox Buyer Accounts</h4>

The following Sandbox Buyer Accounts are provided for convenience.

<br />
<br />

<div style="padding-left: 40px;"> 
	<table class="table table-striped" style="width: 260px;">
		<tr>
			<th>Email</th>
			<th>Password</th>
		</tr>
		<tr>
			<td>jack_potter@buyer.com</td>
			<td>123456789</td>
		</tr>
		<tr>
			<td>jen_jones@buyer.com</td>
			<td>qwer1234</td>
		</tr>
	   	<tr>
			<td>jack_chase@buyer.com</td>
			<td>qwer1234</td>
		</tr>							
	</table>
</div>

<br />

<h4>Code Sample Demonstration</h4>

Mouse-over the buttons in the Shopping Cart to review the Payment Flow diagrams.

<br/>
<br/>
<strong><u>Payment Flow 1</u></strong>: The Buyer selects Shipping Address and Wallet inside the PayPal mini-browser and completes the payment on the Seller's website. Select the currency that you wish to try the code sample for. (In LIVE, the currency will need to be hard-coded to the merchant's presentment currency)

<br/>
<br/>

<ol>
	<li>In the "Shopping Cart" section click on the <b>PayPal Check out</b> button to open the PayPal mini-browser.
		<ul>
			<li>Login with a Sandbox Buyer Account.</li>
			<li>Optionally change the <b>Ship to</b> information.</li>
			<li>Optionally change the <b>Pay with</b> information.</li>
			<li>Optionally click the <b>Cancel and return...</b> link to exit the PayPal mini-browser.</li>
			<li>Click the <b>Continue</b> button.</li>
			<li>The PayPal mini-browser closes.</li>
		</ul>
	</li>
	<li>In the "Shopping Cart" section use the <b>Select shipping rate</b> field to update shipping rate.</li>
	<li>Click the <b>Pay Now</b> button to execute the payment.</li>
	<li>You will land on the "Order Complete" page.</li>
</ol>	

<strong><u>Payment Flow 2</u></strong>: The Buyer provides Shipping Address on the Seller's website then completes the payment inside the PayPal mini-browser. 
<br/>
<br/>
<ol>
	<li>In the "Shopping Cart" section click on the <b>Proceed to Checkout</b> button.</li>
	<li>Update the fields under <strong>Ship to</strong> (optional).</li>
	<li>Click on the <b>PayPal Check out</b> button to open the PayPal mini-browser.
		<ul>
			<li>Login with a Sandbox Buyer Account.</li>
			<li>Optionally change the <b>Pay with</b> information.</li>
			<li>Optionally click the <b>Cancel and return...</b> link to exit the PayPal mini-browser.</li>
			<li>Click the <b>Pay Now</b> button to execute the payment.</li>
			<li>The PayPal mini-browser closes.</li>
		</ul>
	</li>
	<li>You will land on the "Order Complete" page.</li>
</ol>	

<br />

<h4>JavaScript client-side SDKs</h4>

Include the following Javascript SDKs on your checkout page so you can accept payments from PayPal.
<br />
<br />
<pre><code>&lt;script src=&quot;https://js.braintreegateway.com/web/3.31.0/js/client.min.js&gt;&lt;/script&gt;
&lt;script src=&quot;https://js.braintreegateway.com/web/3.31.0/js/paypal-checkout.min.js&gt;&lt;/script&gt;
&lt;script src=&quot;https://www.paypalobjects.com/api/checkout.js&gt;&lt;/script&gt;
</code></pre>

<br />

<h4>Java server-side SDK</h4>

Braintree provides an open source jar file to integrate with the Braintree Gateway on your server.  Refer to the 
<a href="https://developers.braintreepayments.com/start/hello-server/java" target="_blank">Set Up Your Server</a> page 
for the Java library download.

<br /><br />

<h4>Construct your gateway object</h4>

In your code, you must first construct a gateway object with the environment-specific (sandbox or production) access token 
provided in your PayPal dashboard:

<br/><br/>

<pre><code>BraintreeGateway gateway = new BraintreeGateway(useYourAccessToken);
</code></pre>

Generate your own Access Token for testing.

<br/><br/>

<ol>
	<li>Navigate to https://developer.paypal.com/</li>
	<li>Click Login</li>
	<li>Click Dashboard (top right)</li>
	<li>Click on My Apps & Credentials</li>
	<li>Go to Express Checkout via Braintree SDK</li>
	<li>Click Generate Test Access Token
		<ul>
 			<li>Select the Sandbox account from the Drop down</li>
			<li>Click Generate Credential</li>
		</ul>
	</li>
	<li>Copy the text in the field labeled "AccessToken"</li>
</ol>
 
<br />

<h4 id="expresscheckout">Express Checkout via Braintree SDK integration steps: </h4>

Review the following steps and sample JavaScript code below to better understand the integration.

<br />
<br />

<ol>
	<li>Download the server-side SDK.</li>
	<li>Load the Braintree JavaScript components.</li>
	<li>Generate a PayPal Checkout button in the HTML: see <span style="font-family: monospace;">paypal.Button.render</span> and <span style="font-family: monospace;">'#paypal-button'</span> below.</li>
	<li>Initialize the JavaScript client.
		<ul>
			<li>Your server needs to return an authorization token: see <span style="font-family: monospace;">getToken()</span> in <span style="font-family: monospace;">BtTransactionHelper.java</span>.</li>
		</ul>
	</li>
	<li>When the PayPal Checkout button is clicked, the PayPal mini-browser automatically opens. 
		When the PayPal mini-browser closes, the following information is returned to the client-side Script. See <span style="font-family: monospace;">onAuthorize</span> below.
		<ul>
			<li>Payment Nonce</li>
			<li>Shipping Address data (with the following client-side configuration)
				<ul>
					<li style="font-family: monospace;">commit: false</li>
					<li style="font-family: monospace;">enableShippingAddress: true</li>
				</ul>
			
			</li>
		</ul>
	</li>
	
	<li>
		Post the Payment Nonce and form data to server (<span style="font-family: monospace;">BtCheckoutServlet</span>).  See
		<span style="font-family: monospace;">BtCheckoutServlet.java</span>.
	</li>
	<li>
		Submit the <span style="font-family: monospace;">TransactionRequest()</span>. See
		<span style="font-family: monospace;">BtTransactionHelper.java</span>.
	</li>
</ol>


<strong>Basic client-side script with comments</strong>

<pre><code>/* 
    Braintree - Initialize the JavaScript client
*/		
braintree.client.create({
			
    // authorization from server
    authorization: "iwidmVu...bW8iOiJvZmYifQ==" 
				
}, function(clientErr, clientInstance) {

    // Handle error in client creation
    if (clientErr) { 
        console.log('Error creating client instance: ' + clientErr);
        return;
    }

    /* 
        Braintree - PayPal Checkout button component 
    */
    braintree.paypalCheckout.create({
        client: clientInstance
        }, function (createErr, paypalCheckoutInstance) {
            if (createErr) {
                if (createErr.code === 'PAYPAL_BROWSER_NOT_SUPPORTED') {
                    console.error('This browser is not supported.');
                } else {
                    console.error('Error!', createErr);
                }
                return;
            }

            paypal.Button.render({
                env: 'sandbox', // or 'production'

                locale: 'en_US',

                style: {
                    size: 'medium',   // tiny | small | medium
                    color: 'blue',    // gold | blue | silver
                    shape: 'rect',    // pill | rect
                    label: 'checkout' // checkout | credit
                },            

                payment: function () {
                    return paypalCheckoutInstance.createPayment({
                        flow: 'checkout', // 'checkout' is one-time payment flow
                        intent: 'sale',  // sale is immediately submitted for settlement 
                        amount: '300.00', // required for 'checkout' flow
                        currency: 'USD', // update for non-USD merchant
                        locale: 'en_US', // update for non-USD merchant
                        displayName: 'Test Store', // company name
                        enableShippingAddress: true, // Returns a shipping address object in tokenizePayment
                        shippingAddressEditable: true
                });
            },
        
            commit: false, // PayPal mini-browser button: true (Pay Now button) | false (Continue button)

            onAuthorize: function (data, actions) {
                return paypalCheckoutInstance.tokenizePayment(data).then(function (payload) {
                // Submit payload.nonce to your server
                });
            },

            onCancel: function (data) {
                console.log('onCancel: ', JSON.stringify(data, 0, 2));
            },

            onError: function (err) {
                console.error('onError: ', err);
            }
        }, '#paypal-button'); // the PayPal Checkout button is rendered in an html element with the id `paypal-button`
      
    });   
});</code></pre>
