package cn.jjvu.xiao;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

public class AppUtilsTest {
	
	public static final String md5Key = "1";
	
	@Test
	public void testPasswordUtils() {
		String passwd = "helloworld";
		String encodeStr = DigestUtils.md5Hex(passwd+md5Key);
		System.out.println("加密后的字符串"+encodeStr);
	}

}
