package com.sunset.core.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import com.sunset.model.Page;
import com.sunset.model.Stronghold;
import com.sunset.model.User;

public class StrongholdDaoImpl extends HibernateDaoSupport
  
{
  public void addStronghold(Stronghold obj)
  {
    getHibernateTemplate().save(obj);
  }

  public void deleteStrongholdById(String objId) {
    Assert.notNull(objId, "deleteStrongholdById>sequenceId");
    Stronghold obj = new Stronghold();
    obj.setParkId(objId);
    getHibernateTemplate().delete(obj);
  }

   

  public Page queryStrongholdList(String deptId,String type,Page page)
  {
    Criteria criteria = getSession().createCriteria(Stronghold.class);
    criteria.setFirstResult((page.getCurrentPage() - 1) * page.size);
    criteria.setMaxResults(page.size);
    criteria.add(Restrictions.eq("parentId", deptId));
    criteria.add(Restrictions.eq("type", type));
    page.setDataList(criteria.list());
    return page;
  }

  

  public void updateStronghold(Stronghold obj)
  {
    getHibernateTemplate().update(obj);
  }

public Stronghold queryStrongholdById(String hlodId) {
     
    return (Stronghold)getHibernateTemplate().get(Stronghold.class, hlodId);
}

public int queryAmount(String deptId, String type) {
	    Criteria criteria = getSession().createCriteria(Stronghold.class);
	    criteria.add(Restrictions.eq("parentId", deptId));
	    criteria.add(Restrictions.eq("type", type));
		return Integer.valueOf(criteria.setProjection(Projections.rowCount()).uniqueResult().toString());
}
 
 
}