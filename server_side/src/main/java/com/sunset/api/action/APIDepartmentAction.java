/*package com.sunset.api.action;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.DepartmentService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Department;
import com.sunset.model.Page;
import com.sunset.model.Response;
import com.sunset.util.SystemUtil;

public class APIDepartmentAction extends SuperAction implements
		ModelDriven<Department> {

	*//**
	 * 
	 *//*
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(APIRecordAction.class);

	@Autowired
	private DepartmentService departmentServiceImpl;

	private Department department = new Department();

	public Department getRecord() {
		return department;
	}

	public void setRecord(Department department) {
		this.department = department;
	}

	public void setRecordServiceImpl(DepartmentService departmentServiceImpl) {
		this.departmentServiceImpl = departmentServiceImpl;
	}

	public String publish() throws IOException {
		Response rsp = new Response();
		try {
			departmentServiceImpl.addOneRecord(department);
		} catch (Exception e) {
			rsp.setKey(9);
			log.error(e.getMessage(), e);
			rsp.setMessage(e.getMessage());
		}
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().print(new Gson().toJson(rsp));
		return null;
	}

	public void queryJsonList() throws Exception {
		Response rsp = new Response();
		String pageIndex = request.getParameter("currentPage");
		int currentPage = 1;
		if (!SystemUtil.isEmpty(pageIndex)) {
			currentPage = Integer.parseInt(pageIndex);
		}
		if (department == null)
			department = new Department();
		Page page = new Page();
		page.setCurrentPage(Integer.valueOf(currentPage));
		page.setOrder("timestamp");
		try {
			page = this.departmentServiceImpl.queryRecordByPage(
					this.department, page);
		} catch (Exception e) {
			rsp.setKey(9);
			log.error(e.getMessage(), e);
			rsp.setMessage(e.getMessage());
		}
		rsp.setPage(page);
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(rsp));
	}

	public void delete() throws IOException {
		String departmentId = request.getParameter("departmentId");
		department = departmentServiceImpl.queryRecordById(departmentId);
		{
			departmentServiceImpl.deleteRecordById(department.getRecordId());
		}
		response.getWriter().print(1);
	}

	public Department getModel() {
		// TODO Auto-generated method stub
		return department;
	}

}
*/