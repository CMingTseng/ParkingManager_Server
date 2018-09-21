package com.sunset.core.dao.impl;


import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import com.sunset.model.Page;
import com.sunset.model.User;
import com.sunset.util.SystemUtil;


public class UserDaoImpl extends HibernateDaoSupport{

	public void addUser(User User) {
		getHibernateTemplate().save(User);
	}

	public void deleteUserById(String userId) {
		Assert.notNull(userId, "deleteUserById>sequenceId");
		User user = new User();
		user.setUserId(userId);
		getHibernateTemplate().delete(user);
	}

	 

	public User queryUser(String userId) {
		Assert.notNull(userId, "queryUser>UserKey");
		Criteria c = getSession().createCriteria(User.class);
		c.add(Restrictions.eq("userId", userId));
		return (User) c.uniqueResult();
	}

	 
	public void updateUser(User user) {

		getHibernateTemplate().merge(user);
	}

 

	public Page queryUserList(User user, Page page) {
		 
		Criteria criteria = mapingParam( user);
	    criteria.setFirstResult((page.getCurrentPage() - 1) * page.size);
	    criteria.setMaxResults(page.size);
	    try{
	      page.setDataList(criteria.list());
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    return page;
	}
	public int queryUserAmount(User user) {
		 Criteria criteria = mapingParam( user);
		 return Integer.valueOf(criteria.setProjection(Projections.rowCount()).uniqueResult().toString());
	}
	private Criteria mapingParam(User user)
	  {
	    Criteria criteria = getSession().createCriteria(User.class);
	    if (!SystemUtil.isEmpty(user.getDepartmentId()))
	    {
	      criteria.add(Restrictions.eq("departmentId", user.getDepartmentId()));
	    }
	    if (!SystemUtil.isEmpty(user.getAccount()))
	    {
	      criteria.add(Restrictions.eq("account",user.getAccount()));
	    }
	    if (!SystemUtil.isEmpty(user.getName()))
	    {
	      criteria.add(Restrictions.eq("name",user.getName()));
	    }
	    return criteria;
	  }

	public User queryUserByAccount(String account) {
		Assert.notNull(account, "queryUser>account");
		Criteria c = getSession().createCriteria(User.class);
		c.add(Restrictions.eq("account", account));
		return (User) c.uniqueResult();
	}



}
