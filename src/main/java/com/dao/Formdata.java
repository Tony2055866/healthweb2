package com.dao;

/**
 * Formdata entity. @author MyEclipse Persistence Tools
 */

public class Formdata implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String label;
	private String type;
	private String maxvalue;
	private String minvalue;
	private String unit;
	private String normalValues;
	private String other1;
	private String other2;
	private String other3;

	// Constructors

	/** default constructor */
	public Formdata() {
	}

	/** full constructor */
	public Formdata(String name, String label, String type, String maxvalue,
			String minvalue, String unit, String normalValues, String other1,
			String other2, String other3) {
		this.name = name;
		this.label = label;
		this.type = type;
		this.maxvalue = maxvalue;
		this.minvalue = minvalue;
		this.unit = unit;
		this.normalValues = normalValues;
		this.other1 = other1;
		this.other2 = other2;
		this.other3 = other3;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMaxvalue() {
		return this.maxvalue;
	}

	public void setMaxvalue(String maxvalue) {
		this.maxvalue = maxvalue;
	}

	public String getMinvalue() {
		return this.minvalue;
	}

	public void setMinvalue(String minvalue) {
		this.minvalue = minvalue;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getNormalValues() {
		return this.normalValues;
	}

	public void setNormalValues(String normalValues) {
		this.normalValues = normalValues;
	}

	public String getOther1() {
		return this.other1;
	}

	public void setOther1(String other1) {
		this.other1 = other1;
	}

	public String getOther2() {
		return this.other2;
	}

	public void setOther2(String other2) {
		this.other2 = other2;
	}

	public String getOther3() {
		return this.other3;
	}

	public void setOther3(String other3) {
		this.other3 = other3;
	}

}