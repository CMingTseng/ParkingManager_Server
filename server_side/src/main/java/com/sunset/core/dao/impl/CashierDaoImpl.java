package com.sunset.core.dao.impl;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import com.sunset.model.Cashier;
import com.sunset.util.SystemUtil;


public class CashierDaoImpl extends HibernateDaoSupport{

	public void addCashier(Cashier Cashier) {
		getHibernateTemplate().save(Cashier);
	}

	public void deleteCashierById(String cashierId) {
		Assert.notNull(cashierId, "deleteCashierById>sequenceId");
		Cashier cashier = new Cashier();
		cashier.setCashierId(cashierId);
		getHibernateTemplate().delete(cashier);
	}

	 

	public Cashier queryCashier(String cashierId) {
		Assert.notNull(cashierId, "queryCashier>CashierKey");
		Criteria c = getSession().createCriteria(Cashier.class);
		c.add(Restrictions.eq("cashierId", cashierId));
		return (Cashier) c.uniqueResult();
	}

	 
	public void updateCashier(Cashier cashier) {

		getHibernateTemplate().merge(cashier);
	}

 

	public List<Cashier> queryCashierList(Cashier cashier) {
		 
		Criteria criteria = mapingParam( cashier);
	    
	    return criteria.list();
	}
	 
	private Criteria mapingParam(Cashier cashier)
	  {
	    Criteria criteria = getSession().createCriteria(Cashier.class);
	    if (!SystemUtil.isEmpty(cashier.getParkId()))
	    {
	      criteria.add(Restrictions.eq("parkId", cashier.getParkId()));
	    }
	   /* if (!SystemUtil.isEmpty(cashier.getAccount()))
	    {
	      criteria.add(Restrictions.eq("account",cashier.getAccount()));
	    }
	    if (!SystemUtil.isEmpty(cashier.getName()))
	    {
	      criteria.add(Restrictions.eq("name",cashier.getName()));
	    }*/
	    return criteria;
	  }

	public Cashier queryCashierByAccount(String account) {
		Assert.notNull(account, "queryCashier>account");
		Criteria c = getSession().createCriteria(Cashier.class);
		c.add(Restrictions.eq("account", account));
		return (Cashier) c.uniqueResult();
	}



}
