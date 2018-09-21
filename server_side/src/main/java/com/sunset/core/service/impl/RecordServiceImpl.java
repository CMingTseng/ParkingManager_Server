package com.sunset.core.service.impl;

import java.util.List;

import com.sunset.core.dao.impl.RecordDaoImpl;
import com.sunset.core.service.RecordService;
import com.sunset.model.Record;
import com.sunset.model.Page;
import com.sunset.util.SystemUtil;

public class RecordServiceImpl implements RecordService
{
  private RecordDaoImpl recordDao;

  

  public void setRecordDao(RecordDaoImpl recordDao) {
	this.recordDao = recordDao;
}

public void addRecord(Record record)
  {

	if(record.getRecordId() == null)
    {
		record.setRecordId(SystemUtil.getSequenceId());
    }
    if(record.getStatus() == null)
    {
    	record.setStatus("0");
    }
    
    if(record.getEntryTime() == null)
    {
    	record.setEntryTime(SystemUtil.getCurrentlyDateTime());
    }
    this.recordDao.addRecord(record);
  }

  public Page queryRecordByPage(Record record, Page page)
  {
    int count = this.recordDao.queryRecordAmount(record);
    page.setCount(Integer.valueOf(count));
    if(page.getCount()==0)
    {
    	return page;
    }
    return this.recordDao.queryRecordByPage(record, page);
  }

  public void deleteRecordById(String recordId)
  {
    this.recordDao.deleteRecordById(recordId);
  }

  public Record queryRecordById(String recordId)
  {
    Record record = this.recordDao.queryRecordById(recordId);

    return record;
  }

  public void updateRecord(Record record)
  {
    this.recordDao.updateRecord(record);
  }


	
	public int queryRecordAmount(Record record) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public Record queryByCarId(String parkId,String carId) {
		return this.recordDao.queryByCarId(parkId,carId);
		
	}

	
	public List<Record> queryRecordList(Record record) {
		
		/*String time = SystemUtil.getCurrentlyDate();
		record.setStarEntryTime(time+"000000");
		record.setEndEntryTime(time+"235959");
		record.setStarExportTime(time+"000000");
		record.setEndExportTime(time+"235959");*/
		return this.recordDao.queryRecordList( record);
	}

	 
}