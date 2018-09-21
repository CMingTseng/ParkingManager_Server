package com.sunset.core.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import com.sunset.model.Page;
import com.sunset.model.VipCar;
import com.sunset.util.SystemUtil;

public class VipCarDaoImpl extends HibernateDaoSupport
  
{
  public void addVipCar(VipCar obj)
  {
    getHibernateTemplate().save(obj);
  }

  public void deleteVipCarById(String objId) {
    Assert.notNull(objId, "deleteVipCarById>sequenceId");
    VipCar obj = new VipCar();
    obj.setVipId(objId);
    getHibernateTemplate().delete(obj);
  }

   

  public Page queryVipCarList(VipCar car,Page page)
  {
    Criteria criteria = getSession().createCriteria(VipCar.class);
    criteria.setFirstResult((page.getCurrentPage() - 1) * page.size);
    criteria.setMaxResults(page.size);
    if(!SystemUtil.isEmpty(car.getCarCode()))
    {
    	 criteria.add(Restrictions.eq("carCode", car.getCarCode()));
    }
    criteria.add(Restrictions.eq("parkId", car.getParkId()));
    page.setDataList(criteria.list());
    
    return page;
  }

  

  public void updateVipCar(VipCar obj)
  {
    getHibernateTemplate().update(obj);
  }

public VipCar queryVipCarById(String vipId) {
     
    return (VipCar)getHibernateTemplate().get(VipCar.class, vipId);
}

public int queryVipCarAmount(VipCar car) {
	 // TODO Auto-generated method stub
	     Criteria criteria = getSession().createCriteria(VipCar.class);
	     criteria.add(Restrictions.eq("parkId", car.getParkId()));
	    return Integer.valueOf(criteria.setProjection(Projections.rowCount()).uniqueResult().toString());
}

public VipCar queryVipCarByCode(String parkId, String carCode) {
	Criteria criteria = getSession().createCriteria(VipCar.class);
    criteria.add(Restrictions.eq("parkId", parkId));
    criteria.add(Restrictions.eq("carCode", carCode));
    return (VipCar) criteria.uniqueResult();
}
 
 
}