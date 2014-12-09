package org.tarena.note.util;

import javax.servlet.http.HttpServletRequest;

import sun.misc.BASE64Decoder;

public class Base64Util {

	public static String[] getMessage(HttpServletRequest request)throws Exception
	{
		//Basic name:pwd
		String author = request.getHeader("Authorization");
		String[] author_arr = author.split(" ");
		//对author_arr[1]进行base64解码
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] bbs = decoder.decodeBuffer(author_arr[1]);
		String author_dec = new String(bbs);
		//将解码后的author_dec进行:切割
		String[] author_arr1 = author_dec.split(":");
		return author_arr1;
	}
}
