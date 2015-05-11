package com.dao;

/**
 * Cure entity. @author MyEclipse Persistence Tools
 */

public class Cure implements java.io.Serializable {

	// Fields

	private Integer uid;
	private String time;
	private String address;
	private String cate;
	private String res;
	private String other;
	private String doc;

	// Constructors

	/** default constructor */
	public Cure() {
	}

	/** minimal constructor */
	public Cure(Integer uid) {
		this.uid = uid;
	}

	/** full constructor */
	public Cure(Integer uid, String time, String address, String cate,
			String res, String other, String doc) {
		this.uid = uid;
		this.time = time;
		this.address = address;
		this.cate = cate;
		this.res = res;
		this.other = other;
		this.doc = doc;
	}

	// Property accessors

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCate() {
		return this.cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getRes() {
		return this.res;
	}

	public void setRes(String res) {
		this.res = res;
	}

	public String getOther() {
		return this.other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getDoc() {
		return this.doc;
	}

	public void setDoc(String doc) {
		this.doc = doc;
	}

}