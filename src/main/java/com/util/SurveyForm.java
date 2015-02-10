package com.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

public class SurveyForm {
	static String commonInfo[][] = {
		{"姓名"},
		{"性别"},
		{"工作单位"},
		{"民族"},
		{"籍贯"},
		{"出生日期"},
		{"职业"},
		{"文化程度"},
		{"婚姻状况"}
	};
	
	public static void main(String[] args) throws IOException {
		Scanner s = new Scanner(new File("C:\\Users\\Gaotong\\Workspaces\\MyEclipse Professional\\healthweb\\src\\com\\util\\tmp.txt"));
		
		System.out.print("{");
		while(s.hasNextLine()){
			String line = s.nextLine();
			
			System.out.print("\"" + line.trim() + "\",");
			if(line.contains("varchar")){
				System.out.println("}");
				System.out.print("{" + "\"" + line.substring(line.indexOf("`")+1,line.lastIndexOf("`")) + "\",");
				while(s.hasNextLine())
				{
					line = s.nextLine();
					System.out.print("\"" + line.substring(line.indexOf("`")+1,line.lastIndexOf("`")) + "\",");
				}
				System.out.println("}");
				
			}
		}
	}
}
		
	
	
	
		
		
		
	
		
	
