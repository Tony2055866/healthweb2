package com.util;

import java.net.URLDecoder;

public class PageUtil {
	public static String getOptions(String options[],String value){
		String res = "";
		value = URLDecoder.decode(value);
		for(String option:options){
			if(option.equals(value))
				res += "<option selected=\"selected\" >"+option+"</option>";
			else
				res += "<option>"+option+"</option>";
		}
		return res;
	}
}
