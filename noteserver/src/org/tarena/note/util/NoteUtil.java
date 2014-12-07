package org.tarena.note.util;

import java.util.UUID;
/**
 * 获取UUID的字符串
 * @author Administrator
 *
 */
public class NoteUtil {
	public static String createUUID(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
	
	public static void main(String[] args){
		for(int i=0;i<10;i++){
			System.out.println(createUUID());
		}
	}
	
}
