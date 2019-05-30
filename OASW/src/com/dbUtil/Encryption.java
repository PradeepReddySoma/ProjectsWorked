package com.dbUtil;

import sun.misc.BASE64Encoder;

public class Encryption {
	
	private String encode(String str) {
	    BASE64Encoder encoder = new BASE64Encoder();
	    str = new String(encoder.encodeBuffer(str.getBytes()));
	    System.out.println("password value------------"+str);
	    return str;
	}

}
