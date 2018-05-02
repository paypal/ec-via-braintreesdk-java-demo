package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Properties;

import org.junit.Before;
import org.junit.Test;

import com.paypal.BtParameterVo;

/**
 * @author eswaran
 */

public class BTConfigTest {

	Properties prop = new Properties();

	@Before
	public void loadProperites() throws IOException {
		try {
			String filename = "./config/config.properties";
			InputStream input = this.getClass().getClassLoader().getResourceAsStream(filename);
			assertNotNull(input);
			prop.load(input);
		} catch (IOException e) {
			throw e;
		}
	}

	/**
	 * check for empty values
	 */
	@Test
	public void checkConfigEmpty() {
		assertNotNull(prop.getProperty("SBN_CODE"));
		assertNotNull(prop.getProperty("SANDBOX_ENV"));
		assertNotNull(prop.getProperty("LIVE_ENV"));
		assertNotNull(prop.getProperty("BT_JAVASCRIPT_CLIENT"));
		assertNotNull(prop.getProperty("BT_JAVASCRIPT_PAYPAL"));
		assertNotNull(prop.getProperty("PP_CHECKOUT"));
		assertNotNull(prop.getProperty("SANDBOX_ACCESS_TOKEN"));
		assertNotNull(prop.getProperty("LIVE_ACCESS_TOKEN"));
		assertNotNull(prop.getProperty("SBN_CODE"));
	}

	/**
	 * check for predefined values
	 */
	@Test
	public void checkConfigValue() {
		assertEquals(Boolean.valueOf(prop.getProperty("SANDBOX_FLAG")), true);
		assertEquals("PP-DemoPortal-EC_BT-java", prop.getProperty("SBN_CODE"));
		assertEquals("sandbox", prop.getProperty("SANDBOX_ENV"));
		assertEquals("production", prop.getProperty("LIVE_ENV"));
		assertEquals("https://www.paypalobjects.com/api/checkout.js", prop.getProperty("PP_CHECKOUT"));
	}

	/**
	 * Verify braintree request parameter values
	 */
	@Test
	public void checkBtRequestParam() {
		List<String> list = null;
		list = replicateBtParameterVo(list);
		assertEquals("checkout", list.get(0));
		assertEquals("payment-method-nonce", list.get(1));
		assertEquals("total-amount", list.get(2));
		assertEquals("currency", list.get(3));
		assertEquals("item-description", list.get(4));
	}

	/**
	 * @param list
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private List<String> replicateBtParameterVo(List<String> list) {
		try {
			BtParameterVo vo = new BtParameterVo();
			Field field = BtParameterVo.class.getDeclaredField("list");
			field.setAccessible(true);
			list = (List<String>) field.get(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
