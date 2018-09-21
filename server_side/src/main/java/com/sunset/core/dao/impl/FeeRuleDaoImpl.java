package com.sunset.core.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import com.sunset.model.FeeRule;

public class FeeRuleDaoImpl extends HibernateDaoSupport
  
{
  public void addFeeRule(FeeRule obj)
  {
    getHibernateTemplate().save(obj);
  }

  public void deleteFeeRuleById(String ruleId) {
    Assert.notNull(ruleId, "deleteFeeRuleById>ruleId");
    FeeRule obj = new FeeRule();
    obj.setRuleId(ruleId);
    getHibernateTemplate().delete(obj);
  }

   

  public List<FeeRule> queryFeeRuleList(String deptId)
  {
    Criteria criteria = getSession().createCriteria(FeeRule.class);
    criteria.add(Restrictions.eq("parkId", deptId));
    return criteria.list();
  }

  

  public void updateFeeRule(FeeRule obj)
  {
    getHibernateTemplate().update(obj);
  }

public FeeRule queryFeeRuleById(String ruleId) {
     
    return (FeeRule)getHibernateTemplate().get(FeeRule.class, ruleId);
}

public FeeRule queryFeeRuleByPark(String parkId) {
	Criteria criteria = getSession().createCriteria(FeeRule.class);
    criteria.add(Restrictions.eq("parkId", parkId));
    List<FeeRule> list = criteria.list();
    if(list!=null&&list.size()>0)
    {
    	return list.get(0);
    }
    return null;
}
 
 
}