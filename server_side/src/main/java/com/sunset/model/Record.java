package com.sunset.model;

import java.io.Serializable;

public class Record implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String recordId;
	private String parkId;
	private String parkCode;
	private String parkName;
	private String departmentId;
	private String entryImg;
	private String exportImg;
	private String carId;
	private String entry;
	private String entryTime;
	private String export;
	private String exportTime;
	private String shouldAmt;//应收金额  
	private String realAmt;//实际金额    
	private String freeTime;
	private String userId;
	private String name;
	private String type;
	private String description;
	private String status;
	private String starEntryTime;
	private String endEntryTime;
	private String starExportTime;
	private String endExportTime;
	public String getCarId() {
		return carId;
	}
	
	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}
   

	public String getStarEntryTime() {
		return starEntryTime;
	}

	public void setStarEntryTime(String starEntryTime) {
		this.starEntryTime = starEntryTime;
	}

	public String getEndEntryTime() {
		return endEntryTime;
	}

	public void setEndEntryTime(String endEntryTime) {
		this.endEntryTime = endEntryTime;
	}

	public String getStarExportTime() {
		return starExportTime;
	}

	public void setStarExportTime(String starExportTime) {
		this.starExportTime = starExportTime;
	}

	public String getEndExportTime() {
		return endExportTime;
	}

	public void setEndExportTime(String endExportTime) {
		this.endExportTime = endExportTime;
	}

	public String getParkCode() {
		return parkCode;
	}

	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}

	public String getParkName() {
		return parkName;
	}

	public void setParkName(String parkName) {
		this.parkName = parkName;
	}

	public String getStatus() {
		return status;
	}
    
	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getParkId() {
		return parkId;
	}

	public void setParkId(String parkId) {
		this.parkId = parkId;
	}

	 

	public String getEntryImg() {
		return entryImg;
	}

	public void setEntryImg(String entryImg) {
		this.entryImg = entryImg;
	}

	public String getExportImg() {
		return exportImg;
	}

	public void setExportImg(String exportImg) {
		this.exportImg = exportImg;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getEntry() {
		return entry;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setEntry(String entry) {
		this.entry = entry;
	}
	 
	public String getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(String entryTime) {
		this.entryTime = entryTime;
	}

	public String getExport() {
		return export;
	}

	public void setExport(String export) {
		this.export = export;
	}

	public String getExportTime() {
		return exportTime;
	}

	public void setExportTime(String exportTime) {
		this.exportTime = exportTime;
	}

	 
	public String getShouldAmt() {
		return shouldAmt;
	}

	public void setShouldAmt(String shouldAmt) {
		this.shouldAmt = shouldAmt;
	}

	public String getRealAmt() {
		return realAmt;
	}

	public void setRealAmt(String realAmt) {
		this.realAmt = realAmt;
	}

	public String getFreeTime() {
		return freeTime;
	}
	public void setFreeTime(String freeTime) {
		this.freeTime = freeTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
