package com.sunset.model;

import java.io.Serializable;


 
public class Portal implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String portalId;
	private String name;
	private String parkId;
	 
	public String getPortalId() {
		return portalId;
	}
	public void setPortalId(String portalId) {
		this.portalId = portalId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParkId() {
		return parkId;
	}
	public void setParkId(String parkId) {
		this.parkId = parkId;
	}
	
}
