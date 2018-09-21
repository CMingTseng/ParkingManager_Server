package com.sunset.admin.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.DepartmentService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Department;
import com.sunset.model.Page;
import com.sunset.model.User;
import com.sunset.util.SystemUtil;

public class AdminDepartmentAction extends SuperAction implements ModelDriven<Department>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Autowired
	private DepartmentService departmentServiceImpl;
	 
	private Department department = new Department();

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public void setDepartmentServiceImpl(DepartmentService departmentServiceImpl) {
		this.departmentServiceImpl = departmentServiceImpl;
	}
	
	 
	
	 
	  public String manage() throws Exception
	  {
		  
		/* String pageIndex = request.getParameter("currentPage");
		 int currentPage = 1;
		 if(!SystemUtil.isEmpty(pageIndex))
		 {
			 currentPage = Integer.parseInt(pageIndex);
		 }
		if(department==null)
			department = new Department();
	    Page page = new Page();
	    page.setOrder("timestamp");
	    page.setCurrentPage(Integer.valueOf(currentPage));
	    departmentServiceImpl.queryDepartmentByPage(department, page);
		request.setAttribute("page",page);
		request.setAttribute("department",department);*/
	    return "manage";
	  }
	
	
	  public String search() throws IOException
		{
			 
			Page page =  new Page();
			page.setOrder("timestamp");
			if(department==null)
				department = new Department();
			 
			departmentServiceImpl.queryDepartmentByPage(department, page);
			request.setAttribute("page",page);
			request.setAttribute("department",department);
			return "manage";
		}
 
	  public String jsonList() throws IOException
		{
			 
		    String parentId = request.getParameter("id");
		    response.setContentType("text/json;charset=UTF-8");
		    if(SystemUtil.isEmpty(parentId))
		    {
		    	parentId = ((User)session.getAttribute("user")).getDepartmentId();
		    	Department t = departmentServiceImpl.queryDepartmentById(parentId);
		    	response.getWriter().print("{id:"+t.getDepartmentId()+", pId:"+t.getParentId()+", name:'"+t.getName()+"', open:true,isParent:true}");
		    	return null;
		    }
		    try{
		    List<Department> list = departmentServiceImpl.queryDepartmentList(parentId);
		    StringBuffer buffer = new StringBuffer("[");
		    int i = 0;
			for(Department d : list)
			{
				i ++ ;
				buffer.append("{id:"+d.getDepartmentId()+", pId:"+d.getParentId()+", name:'"+d.getName()+"', open:false,isParent:true}");
				if(i<list.size())
				{
					buffer.append(",");
					buffer.append("\r\n");
				}
			}
			buffer.append("]");
			
			response.getWriter().print(buffer.toString());
			System.out.println(buffer.toString());
		    }catch(Exception e)
		    {
		    e.printStackTrace();	
		    }
		    
			return null;
		}

	 public void delete() throws IOException
	 {
		 String departmentId = request.getParameter("departmentId");
		 
		 try{
			 departmentServiceImpl.deleteDepartmentById(departmentId) ;
			 response.getWriter().print(1);
			 }catch(Exception e)
			 {
				 response.getWriter().print(0);
				 e.printStackTrace();
			 }
			
	 }
	 
	 public String view()  
	 {
		 String departmentId = request.getParameter("departmentId");
		 department =  departmentServiceImpl.queryDepartmentById(departmentId);
		 String parent ="";
		 if(!department.getParentId().equals("0"))
		 {
		    Department d =departmentServiceImpl.queryDepartmentById(department.getParentId());
		    parent = d.getName();
		 }
		 request.setAttribute("department", department);
		 request.setAttribute("parent",parent);
		 return "view";
	 }
	 

	 public String update() throws IOException  
	 {
		 String departmentId = request.getParameter("departmentId");
		 department =  departmentServiceImpl.queryDepartmentById(departmentId);
		 department.setTelephone(request.getParameter("telephone"));
		 department.setName(request.getParameter("name"));
		 department.setFax(request.getParameter("fax"));
		 department.setZip(request.getParameter("zip"));
		 department.setAddress(request.getParameter("address"));
		 department.setDescription(request.getParameter("description"));
		 try{
		 departmentServiceImpl.updateDepartment(department);
		 response.getWriter().print(1);
		 }catch(Exception e)
		 {
			 e.printStackTrace();
			 response.getWriter().print(0);
		 }
		 
		 return null;
	 }
	 public String add() throws IOException  
	 {
		 Department d = new Department();
		 d.setParentId(request.getParameter("parentId"));
		 d.setTelephone(request.getParameter("telephone"));
		 d.setName(request.getParameter("name"));
		 d.setFax(request.getParameter("fax"));
		 d.setZip(request.getParameter("zip"));
		 d.setAddress(request.getParameter("address"));
		 d.setDescription(request.getParameter("description"));
		 try{
			 departmentServiceImpl.addDepartment(d);
			 response.getWriter().print(d.getDepartmentId());
			 }catch(Exception e)
			 {
				 e.printStackTrace();
				 response.getWriter().print(0);
			 }
		 return null;
	 }
	public Department getModel() {
		// TODO Auto-generated method stub
		return department;
	}
  
	 
    
}
