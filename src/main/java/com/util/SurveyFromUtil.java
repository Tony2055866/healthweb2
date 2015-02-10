package com.util;

import com.dao.SurveyHealth;
import com.dao.SurveyHealthDAO;

public class SurveyFromUtil {
	static String names[] = 
	{"hasQiGuanYan","hasFeiJieHe","hasTangNiaoBing","hasAllTangNiao","hasGaoXueYa",
		"hasAllGaoXueYa","hasGuanXinBing","hasZhongFeng","hasGanYan",
		"hasFeiAi","hasGanAi","hasWeiAi","hasDaChangAi",
		//
		"isJueJing","isHasChild","FuyongCiJS"}
	;
	
	public static void main(String[] args) {
		SurveyHealthDAO dao = new SurveyHealthDAO();
		//SurveyHealth health = dao.findById(user.getId());
		SurveyHealth health = new SurveyHealth();
		health.setUid(1);
		health.setFirstYj("no");
		dao.saveOrUpdate(health);
	}
}
