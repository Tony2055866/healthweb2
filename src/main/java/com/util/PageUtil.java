package com.util;

public class PageUtil {
	public static String getOptions(String options[],String value){
		String res = "";
		for(String option:options){
			if(option.equals(value))
				res += "<option selected=\"selected\">"+option+"</option>";
			else
				res += "<option>"+option+"</option>";
		}
		return res;
	}
}
