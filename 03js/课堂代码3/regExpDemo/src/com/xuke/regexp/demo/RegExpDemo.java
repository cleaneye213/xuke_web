package com.xuke.regexp.demo;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegExpDemo {

	public static void main(String[] args) {
		//
		String regStr="b{2,}";
		String str="sdsdddbbddddew44";
		Pattern p=Pattern.compile(regStr,Pattern.CASE_INSENSITIVE);
		Matcher mth = p.matcher(str);
		
		String str2="bbb";
		//必须完全匹配才true
		Matcher mth2 = p.matcher(str2);
		
		System.out.println(mth2.matches());
		//只要包含有符合的字符串就true
		System.out.println(mth.find());
		System.out.println(mth2.matches());
	}

}
