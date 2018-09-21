package com.sunset.core.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import com.sunset.model.Department;
import com.sunset.model.Page;
import com.sunset.util.SystemUtil;

public class DepartmentDaoImpl extends HibernateDaoSupport
  
{
  public void addOneDepartment(Department department)
  {
    getHibernateTemplate().save(department);
  }

  public void deleteDepartmentById(String departmentId) {
    Assert.notNull(departmentId, "deleteDepartmentById>sequenceId");
    Department department = new Department();
    department.setDepartmentId(departmentId);
    getHibernateTemplate().delete(department);
  }

  public Department queryDepartmentById(String departmentId) {
    Assert.notNull(departmentId, "queryDepartmentById>departmentId");
    Department department = new Department();
    department = (Department)getHibernateTemplate().get(Department.class, departmentId);
    return department;
  }

  public Page queryDepartmentByPage( Department department, Page page)
  {
    Criteria criteria = mapingParam( department);
    criteria.setFirstResult((page.getCurrentPage() - 1) * page.size);
    criteria.setMaxResults(page.size);
    criteria.addOrder(Order.desc(page.getOrder()));
    page.setDataList(criteria.list());
    return page;
  }
  public List<Department> queryDepartmentList(String parentId)
  {
	    Criteria criteria = getSession().createCriteria(Department.class);
	    criteria.add(Restrictions.eq("parentId", parentId));
	    return criteria.list();
  }
  public void updateDepartment(Department department)
  {
    getHibernateTemplate().update(department);
  }

  public int queryDepartmentAmount( Department department) {
    Criteria criteria = mapingParam( department);
    return Integer.valueOf(criteria.setProjection(Projections.rowCount()).uniqueResult().toString());
  }

  private Criteria mapingParam(Department department)
  {
    Criteria criteria = getSession().createCriteria(Department.class);
    if (!SystemUtil.isEmpty(department.getParentId()))
    {
      criteria.add(Restrictions.eq("parentId", department.getParentId()));
    }
     
    
    return criteria;
  }

 
}