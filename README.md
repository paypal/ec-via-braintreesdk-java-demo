# Express Checkout via Braintree SDK


This project is a Java Web Application that demonstrates the [Express Checkout via Braintree SDK](https://developer.paypal.com/docs/accept-payments/express-checkout/ec-braintree-sdk/get-started/) payment experience using the Braintree Client JavaScript SDKs and the server-side Java SDK.  

[Express Checkout via Braintree SDK](https://developer.paypal.com/docs/accept-payments/express-checkout/ec-braintree-sdk/get-started/)  allows you to integrate Express Checkout using the Braintree SDK without a Braintree account.  There are two Payment Flows in the demonstration.  Mouse-over the buttons in the Shopping Cart to review the Payment Flow diagrams.

1. Payment Flow 1: The Buyer selects Shipping Address and Wallet inside the PayPal mini-browser and completes the payment on the Seller's website. 

2. Payment Flow 2: The Buyer provides Shipping Address on the Seller's website then completes the payment inside the PayPal mini-browser. 


## Prerequisites

1. *TLS v1.2 protocol*. (Java 8+ supports *TLS v1.2 protocol* by default)
2. Apache Tomcat  version is `7.0.57`. For more information about *Apache Tomcat*, please visit their [site](http://tomcat.apache.org/).  

3. In [`config.properties`](ECBraintreeSDK/src/config/config.properties), set up the [**ACCESS_TOKEN**](https://www.paypal.com/us/selfhelp/article/how-do-i-test-express-checkout---braintree-direct-ts1938) for the merchant account that will be used and set **`ENVIRONMENT`** to **sandbox** or **production**. This merchant account needs to be set up with currencies that will be accepted.


## Quick Start Demo Deployment


1. Stop Apache Tomcat if running.
2. Copy `ECBraintreeSDK.war` (`/ECBraintreeSDK/dist/ECBraintreeSDK.war`) to Tomcat's `webapps` folder.
3. Restart Apache Tomcat  
4. Navigate to `http://localhost:port/ECBraintreeSDK`. The default port for Tomcat is *8080*.


## How the code works


The starting point is [`index.jsp`](ECBraintreeSDK/WebContent/index.jsp). Click the PayPal Check out" button (Payment flow 1) or "Proceed to Checkout" button (Payment flow 2) to start a payment flow.  

In the PayPal mini-browser, depending on the flow configuration, you'll see a Continue button (Payment flow 1) or a Pay Now button (Payment flow 2) . If the flow is cancelled, you'll be redirected to "cancel.jsp".  

[`index.jsp`](ECBraintreeSDK/WebContent/index.jsp) (Payment Flow 1) and [`checkoutpage.jsp`](ECBraintreeSDK/WebContent/checkoutpage.jsp) (Payment Flow 2) do the following:

* When a page is loaded containing client-side code (i.e. [`index.jsp`](ECBraintreeSDK/WebContent/index.jsp) and [`checkoutpage.jsp`](ECBraintreeSDK/WebContent/checkoutpage.jsp) ), an authorization token is returned by *getToken()* in [`BtTransactionHelper.java`](ECBraintreeSDK/src/com/paypal/BtTransactionHelper.java).

* When the payment is submitted, the request parameters are posted to [`BtCheckoutServlet.java`]
(ECBraintreeSDK/src/com/paypal/BtCheckoutServlet.java).


Review the forms and JavaScript in [`index.jsp`](ECBraintreeSDK/WebContent/index.jsp) (Payment flow 1) and [`checkoutpage.jsp`](ECBraintreeSDK/WebContent/checkoutpage.jsp) (Payment flow 2) to better understand the configurations.


## Development

To begin your own development, either import `ECBraintreeSDK.war` into a new project, or import the `ECBraintreeSDK` folder. 


## Initial Loading of the Project in Eclipse EE
1. Open Eclipse EE
2. Open your Workspace
3. File > Import...
4. Web > WAR file > Next
5. WAR File:
    a. Browse to `dist/ECBraintreeSDK.war`
6. Web project: ECBraintreeSDK
7. Target runtime: 
    a. Select New...
    b. Select Apache Tomcat v7.0
    c. Click Next
    d. Tomcat installation directory:
        i. Select Browse...
        ii. Navigate to the Tomcat installation directory and click OK
    e. JRE: Workbench Default JRE
    f. Click Finish
8. Click Finish


Initial Running of the Project in Eclipse EE
--------------------------------------------

1. Right-mouse click on `ECBraintreeSDK` in Project Explorer
2. Select Run As > Run on Server
    a. Server runtime environment: Apache Tomcat v7.0
3. Select Finish
 
 
Project Folder Structure
------------------------

Refer to the project's folder structure below. 
 
* `dist`: contains the project's web archive (WAR) file.
* `src`: contains the server-side Java code.
* `test`: contains the test case files.
* `build`: place for compiled classes.
* `doc`:  Javadoc code documentation from source code
* `WebContent`: this is where the JSP pages, css, js and images are located.

Note: To import required jar files, make sure that `/ECBraintreeSDK/WebContent/WEB-INF/lib/` is part of the build path. 

Note: [`config.properties`](ECBraintreeSDK/src/config/config.properties) contains the Braintree JavScript Client SDK URLs and the PayPal Access Token.  
 
 
