package com.sunset.model;

import java.io.Serializable;


 
public class Stronghold implements Serializable{
	/**
	 * 车场，岗亭
	 */
	private static final long serialVersionUID = 1L;
	private String parkId;
	private String code;
	private String type;//0为车场，1为岗亭
	private String region;
	private String parentId;
	private String name;
	public String getParkId() {
		return parkId;
	}
	public void setParkId(String parkId) {
		this.parkId = parkId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	} 
	
}
