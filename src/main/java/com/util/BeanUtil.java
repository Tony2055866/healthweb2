package com.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.Observable;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import com.dao.SurveyEat;
import com.dao.User;
import com.mysql.jdbc.StringUtils;

public class BeanUtil {
	static Logger logger = LoggerFactory.getLogger(BeanUtil.class);
	static String namePage2[] = 
		{"hasZhiQiGuan","hasXiaoChuan","hasFeiQiZhong",
		"hasFeiJieHe","hasFeiBing","hasFeiXinBing","hasGaoXieYa","hasGuanXinBing",
		"hasXinLiShuaiJie","hasZhongFeng","hasTangNiaoBing","hasWeiYan","hasChangDao",
		"hasZhiChuang","hasGanYan","hasGanYingHua","hasPinXue","hasShenShuaiJie","hasGuShuSong",
		"hasTongFeng","hasFeiAi","hasWeiAi","hasGanAi","hasDaChangAi","hasOther",
		"isJueJing", "isHasChild", "fuyongCiJs"};
		
	static Map<String,Boolean> map2 = new HashMap<String, Boolean>();
	static{
		for(String str:namePage2) map2.put(str, true);
	}

	public static <T> T  getBean(HttpServletRequest req, Class<T> c, T t){
		try {
			if(t == null)
				t = c.newInstance();
			Field[] fields = c.getDeclaredFields();
			for(int i=0; i<fields.length; i++){
				String name = fields[i].getName();
				fields[i].setAccessible(true);
				String val = req.getParameter(name);
				//System.out.println("BeanUtil set val : " + val);
				if(val != null)
					fields[i].set(t, val);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}

	public static  String getField(Class c,String field,Object o){
		try {
			Field f = c.getDeclaredField(field);
			f.setAccessible(true);
			return f.get(o).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public static <T> T  getBeanForRadioPage2(HttpServletRequest req, Class<T> c, T t){
		try {
			if(t == null)
				t = c.newInstance();
			Field[] fields = c.getDeclaredFields();
			for(int i=0; i<fields.length; i++){
				String name = fields[i].getName();
				fields[i].setAccessible(true);
				String val = req.getParameter(name);
				
				if( (fields[i].getType()==String.class) &&  fields[i].get(t) == null){
					fields[i].set(t, "");
				}
				if(map2.get(name) != null){
					String val2 = req.getParameter(name+"0");
					logger.debug("check radio yes name:" + name + ",value: " + val + "  val2:" + val2);
					if(!StringUtils.isNullOrEmpty(val2)){
						if(val != null)
							fields[i].set(t, val + ";" + val2);
					}else{
						if(val != null)
							fields[i].set(t, val);
					}
				}else{
					if(val != null)
						fields[i].set(t, val);
				}
				
				if(val == null){
					logger.warn("the parameter is null : " + name);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	
	
	public static <T> T getBeanNoNullStringFromRequest(HttpServletRequest req, Class<T> c, T t){
		try {
			if(t == null)
				t = c.newInstance();
			Field[] fields = c.getDeclaredFields();
			for(int i=0; i<fields.length; i++){
				String name = fields[i].getName();
				fields[i].setAccessible(true);
				String val = req.getParameter(name);
				if(val != null)
					fields[i].set(t, val);
				if( (fields[i].getType()==String.class) &&  fields[i].get(t) == null){
					fields[i].set(t, "");
				}
				
				if(val == null){
					logger.warn("the parameter is null : " + name);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public static <T> T getBeanNoNullString(HttpServletRequest req, Class<T> c, T t){
		try {
			if(t == null)
				t = c.newInstance();
			Field[] fields = c.getDeclaredFields();
			for(int i=0; i<fields.length; i++){
				String name = fields[i].getName();
				fields[i].setAccessible(true);
				if( (fields[i].getType()==String.class) &&  fields[i].get(t) == null){
					fields[i].set(t, "");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public static void main(String[] args) {
//		getBean(null, User.class,null);
	}



	public static SurveyEat getBeanForRadioPage3(HttpServletRequest req,
			Class<SurveyEat> class1, Object object) {
		
		return null;
	}
}
