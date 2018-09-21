package com.sunset.model;

import java.io.Serializable;


 
public class VipCar implements Serializable{
	/**
	 * VIP车牌
	 */
	private static final long serialVersionUID = 1L;
	private String vipId;
	private String parkId;
	private String carCode;
	private String expireTime;
	private String description;
	public String getVipId() {
		return vipId;
	}
	public void setVipId(String vipId) {
		this.vipId = vipId;
	}
	public String getCarCode() {
		return carCode;
	}
	public void setCarCode(String carCode) {
		this.carCode = carCode;
	}
	public String getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(String expireTime) {
		this.expireTime = expireTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getParkId() {
		return parkId;
	}
	public void setParkId(String parkId) {
		this.parkId = parkId;
	} 
	
}
