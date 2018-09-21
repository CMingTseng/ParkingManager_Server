package com.sunset.core.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import com.sunset.model.Page;
import com.sunset.model.Record;
import com.sunset.util.SystemUtil;

public class RecordDaoImpl extends HibernateDaoSupport
  
{
  public void addRecord(Record record)
  {
    getHibernateTemplate().save(record);
  }

  public void deleteRecordById(String recordId) {
    Assert.notNull(recordId, "deleteRecordById>sequenceId");
    Record record = new Record();
    record.setRecordId(recordId);
    getHibernateTemplate().delete(record);
  }

  public Record queryRecordById(String recordId) {
    Assert.notNull(recordId, "queryRecordById>recordId");
    Record record = new Record();
    record = (Record)getHibernateTemplate().get(Record.class, recordId);
     
    return record;
  }

  public Page queryRecordByPage( Record record, Page page)
  {
    Criteria criteria = mapingParam( record);
    criteria.setFirstResult((page.getCurrentPage() - 1) * page.size);
    criteria.setMaxResults(page.size);
    if(record.getStatus().equals("0"))
	{
		criteria.addOrder(Order.desc("entryTime"));
	}else
	{
		criteria.addOrder(Order.desc("exportTime"));
	}
    page.setDataList(criteria.list());
     
    return page;
  }
  
 
  public int queryRecordAmount( Record record) {
    Criteria criteria = mapingParam( record);
    return Integer.valueOf(criteria.setProjection(Projections.rowCount()).uniqueResult().toString());
  }

  private Criteria mapingParam(Record record)
  {
    Criteria criteria = getSession().createCriteria(Record.class);
    if (!SystemUtil.isEmpty(record.getCarId()))
    {
      criteria.add(Restrictions.eq("carId", record.getCarId()));
    }
    if (!SystemUtil.isEmpty(record.getStatus()))
    {
      criteria.add(Restrictions.eq("status", record.getStatus()));
    }
    if (!SystemUtil.isEmpty(record.getParkId()))
    {
      criteria.add(Restrictions.eq("parkId", record.getParkId()));
    }
    if (!SystemUtil.isEmpty(record.getParkCode()))
    {
      criteria.add(Restrictions.eq("parkCode", record.getParkCode()));
    }
    if (!SystemUtil.isEmpty(record.getDepartmentId()))
    {
      criteria.add(Restrictions.eq("departmentId", record.getDepartmentId()));
    }
    if (!SystemUtil.isEmpty(record.getUserId()))
    {
      criteria.add(Restrictions.eq("userId",record.getUserId()));
    }
    if (!SystemUtil.isEmpty(record.getStarEntryTime()))
    {
      criteria.add(Restrictions.ge("entryTime",record.getStarEntryTime().replace("-", "")+"000000"));
    }
    if (!SystemUtil.isEmpty(record.getEndEntryTime()))
    {
      criteria.add(Restrictions.le("entryTime",record.getEndEntryTime().replace("-", "")+"235959"));
    }
    if (!SystemUtil.isEmpty(record.getStarExportTime()))
    {
      criteria.add(Restrictions.ge("exportTime",record.getStarExportTime().replace("-", "")+"000000"));
    }
    if (!SystemUtil.isEmpty(record.getEndExportTime()))
    {
      criteria.add(Restrictions.le("exportTime",record.getEndExportTime().replace("-", "")+"235959"));
    }
    return criteria;
  }

public void updateRecord(Record record) {
	getHibernateTemplate().update(record);
	
}

public Record queryByCarId(String parkId,String carId) {
	Criteria criteria = getSession().createCriteria(Record.class);
	criteria.add(Restrictions.eq("carId", carId));
	criteria.add(Restrictions.eq("parkId", parkId));
	criteria.add(Restrictions.eq("status", "0"));
	
	criteria.addOrder(Order.desc("entryTime"));
	List<Record> list = criteria.list();
	if(list != null && list.size()>0)
	{
		return list.get(0);
	}
	return null;
}

public List<Record> queryRecordList(Record record) {
	Criteria criteria = getSession().createCriteria(Record.class);
	criteria.add(Restrictions.eq("parkId", record.getParkId()));
	criteria.add(Restrictions.eq("status", record.getStatus()));
	if(record.getStatus().equals("0"))
	{
		//criteria.add(Restrictions.ge("entryTime",record.getStarEntryTime()));
		//criteria.add(Restrictions.le("entryTime",record.getEndEntryTime()));
		criteria.addOrder(Order.desc("entryTime"));
	}else
	{
		//criteria.add(Restrictions.ge("exportTime",record.getStarExportTime()));
		//criteria.add(Restrictions.le("exportTime",record.getEndExportTime()));
		criteria.addOrder(Order.desc("exportTime"));
	}
	
	List<Record> list = criteria.list();
	return list;
}
 
 
}