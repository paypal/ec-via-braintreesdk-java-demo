package com.paypal;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class BtConfigReader {

	private String environment;

	private String btChannel;
	private String btJavaScriptClient;
	private String btJavaScriptPayPal;
	private String ppJavaScriptCheckout;

	private String ppAccessToken;

	public BtConfigReader() {
		Properties prop = new Properties();
		InputStream input = null;
		try {
			String filename = "config/config.properties";

			input = this.getClass().getClassLoader().getResourceAsStream(filename);

			if (input == null) {
				System.out.println("Sorry, unable to find  " + filename);
				return;
			}

			// load a properties file from class path, inside static method
			prop.load(input);

			// get environment
			String envPrefix = "LIVE_";
			environment = "production";

			if (prop.getProperty("SANDBOX_FLAG").equals("true")) {
				envPrefix = "SANDBOX_";
				environment = "sandbox";
			}
			// general values
			btChannel = prop.getProperty("SBN_CODE");
			btJavaScriptClient = prop.getProperty("BT_JAVASCRIPT_CLIENT");
			btJavaScriptPayPal = prop.getProperty("BT_JAVASCRIPT_PAYPAL");
			ppJavaScriptCheckout = prop.getProperty("PP_CHECKOUT");

			// bases based on environment
			ppAccessToken = prop.getProperty(envPrefix + "ACCESS_TOKEN");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public String getEnvironment() {
		return environment;
	}

	public void setEnvironment(String environment) {
		this.environment = environment;
	}

	public String getBtChannel() {
		return btChannel;
	}

	public String getBtJavaScriptClient() {
		return btJavaScriptClient;
	}

	public String getBtJavaScriptPayPal() {
		return btJavaScriptPayPal;
	}

	public String getPayPalCheckout() {
		return ppJavaScriptCheckout;
	}

	public String getAccessToken() {
		return ppAccessToken;
	}
}
