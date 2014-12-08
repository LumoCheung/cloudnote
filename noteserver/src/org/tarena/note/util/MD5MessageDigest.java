package org.tarena.note.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5MessageDigest {

	private static char [] hexDigits={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
	public static final String md5(String  plainText)
	{
		char[] ciphertext=null;
		try {
			MessageDigest md5=MessageDigest.getInstance("MD5");
			byte[] ps=plainText.getBytes("utf-8");
			byte[] cs=md5.digest(ps);
			ciphertext=new char[cs.length*2];
			int i=0;
			for(int b:cs)
			{
				ciphertext[i++]=hexDigits[(b>>>4&0xf)];
				ciphertext[i++]=hexDigits[(b&0xf)];
			}
			return new String(ciphertext);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
