package com.sunset.core.service;

import java.util.List;

import com.sunset.model.Record;
import com.sunset.model.Page;

public abstract interface RecordService
{
	  public abstract void addRecord(Record record);

	  public abstract void deleteRecordById(String recordId);

	  public abstract Record queryRecordById(String recordId);

	  public abstract void updateRecord(Record record);

	  public abstract int queryRecordAmount( Record record);

	  public abstract Page queryRecordByPage(Record record, Page paramPage);

	  public abstract Record queryByCarId(String parkId,String carId);

	 public abstract List<Record> queryRecordList(Record record);

}