package com.sunset.core.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import com.sunset.model.Department;
import com.sunset.model.Portal;

public class PortalDaoImpl extends HibernateDaoSupport
  
{
  public void addPortal(Portal obj)
  {
    getHibernateTemplate().save(obj);
  }

  public void deletePortalById(String objId) {
    Assert.notNull(objId, "deletePortalById>sequenceId");
    Portal obj = new Portal();
    obj.setPortalId(objId);
    getHibernateTemplate().delete(obj);
  }

   

  public List<Portal> queryPortalList(String parkId)
  {
    Criteria criteria = getSession().createCriteria(Portal.class);
    criteria.add(Restrictions.eq("parkId", parkId));
    return criteria.list();
  }

  

  public void updatePortal(Portal obj)
  {
    getHibernateTemplate().update(obj);
  }

public Portal queryPortalById(String portalId) {
     
    return (Portal)getHibernateTemplate().get(Portal.class, portalId);
}
 
 
}