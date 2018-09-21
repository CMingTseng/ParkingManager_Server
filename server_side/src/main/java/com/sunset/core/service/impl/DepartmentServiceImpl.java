package com.sunset.core.service.impl;


import java.util.List;

import com.sunset.core.dao.impl.DepartmentDaoImpl;
import com.sunset.core.service.DepartmentService;
import com.sunset.model.Department;
import com.sunset.model.Page;
import com.sunset.util.SystemUtil;

public class DepartmentServiceImpl
  implements DepartmentService
{
  private DepartmentDaoImpl departmentDao;
  

  public void setDepartmentDao(DepartmentDaoImpl departmentDao) {
	this.departmentDao = departmentDao;
}
 

public void addDepartment(Department department)
  {

        department.setDepartmentId(SystemUtil.getSequenceId());
        this.departmentDao.addOneDepartment(department);
     
  }

  public Page queryDepartmentByPage(Department department, Page page)
  {
    int count = this.departmentDao.queryDepartmentAmount(department);
    page.setCount(Integer.valueOf(count));
    if(page.getCount()==0)
    {
    	return page;
    }
    return this.departmentDao.queryDepartmentByPage(department, page);
  }

  public void deleteDepartmentById(String departmentId)
  {
    this.departmentDao.deleteDepartmentById(departmentId);
  }

  public Department queryDepartmentById(String departmentId)
  {
    Department department = this.departmentDao.queryDepartmentById(departmentId);

    return department;
  }
   /**
    * 
    */
  public void updateDepartment(Department department)
  {
    this.departmentDao.updateDepartment(department);
  }


	
	public int queryDepartmentAmount(Department department) {
		// TODO Auto-generated method stub
		return 0;
	}

 
	
	public List<Department> queryDepartmentList(String parentId) {
		// TODO Auto-generated method stub
		return departmentDao.queryDepartmentList(parentId);
	}
}