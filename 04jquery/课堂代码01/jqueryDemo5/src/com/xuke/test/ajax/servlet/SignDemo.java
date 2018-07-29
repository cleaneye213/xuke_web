package com.xuke.test.ajax.servlet;

public class SignDemo {
	
	private static SignDemo dSignDemo;
	
	private SignDemo() {
	}
	
	public static SignDemo getIntance() {
		if(dSignDemo==null) {
			dSignDemo=new SignDemo();
		}
		return dSignDemo;
	}
}
