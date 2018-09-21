package com.sunset.core.service;

import java.util.List;

import com.sunset.model.Department;
import com.sunset.model.Page;

public abstract interface DepartmentService
{
	  public abstract void addDepartment(Department department);

	  public abstract void deleteDepartmentById(String departmentId);

	  public abstract Department queryDepartmentById(String departmentId);

	  public abstract void updateDepartment(Department department);

	  public abstract int queryDepartmentAmount( Department department);
	  public abstract List<Department> queryDepartmentList(String parentId);
	  public abstract Page queryDepartmentByPage(Department department,Page page);
}