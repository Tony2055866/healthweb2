package com.dao;

import java.lang.reflect.Field;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {
	public static void main(String[] args) throws Exception, Exception {
		User u = User.class.newInstance();
		Field f =u.getClass().getDeclaredFields()[1];
		f.setAccessible(true);
		f.set(u, "aaaaa");
		u.setId(3);
		u.setCompany("dddddd");
		UserDAO dao = new UserDAO();
		dao.update(u);
		System.out.println(u.getNameZh());
	}
	// Fields

	private Integer id;
	private String nameZh = "";
	private String nameEn = "";
	private String gender = "";
	private String company = "";
	private String job = "";
	private String education = "";
	private String marriage = "";
	private String address = "";
	private String phone = "";
	private String email = "";
	private String nation = "";
	private String home = "";
	private String password = "";
	private String birth = "";
	
	
	// Constructors

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String nameZh, String nameEn, String gender, String company,
			String job, String education, String marriage, String address,
			String phone, String email, String nation, String home,
			String password) {
		this.nameZh = nameZh;
		this.nameEn = nameEn;
		this.gender = gender;
		this.company = company;
		this.job = job;
		this.education = education;
		this.marriage = marriage;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.nation = nation;
		this.home = home;
		this.password = password;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNameZh() {
		return this.nameZh;
	}

	public void setNameZh(String nameZh) {
		this.nameZh = nameZh;
	}

	public String getNameEn() {
		return this.nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getJob() {
		return this.job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getMarriage() {
		return this.marriage;
	}

	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getHome() {
		return this.home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [address=" + address + ", birth=" + birth + ", company="
				+ company + ", education=" + education + ", email=" + email
				+ ", gender=" + gender + ", home=" + home + ", id=" + id
				+ ", job=" + job + ", marriage=" + marriage + ", nameEn="
				+ nameEn + ", nameZh=" + nameZh + ", nation=" + nation
				+ ", password=" + password + ", phone=" + phone + "]";
	}
	
	
}