package org.tarena.note.test;

import org.tarena.note.util.MD5MessageDigest;

public class md5Test {
	public static void main(String[] args)
	{
		String string="123789";
		System.out.println(MD5MessageDigest.md5(string));
	}

}
