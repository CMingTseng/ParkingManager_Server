package com.sunset.admin.action;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.DepartmentService;
import com.sunset.core.service.StrongholdService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Department;
import com.sunset.model.Page;
import com.sunset.model.Stronghold;
import com.sunset.util.SystemUtil;
public class AdminStrongholdAction extends SuperAction implements ModelDriven<Stronghold>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Stronghold hlod = new Stronghold();
	
	@Autowired
	private StrongholdService hlodServiceImpl;
	@Autowired
	private DepartmentService departmentServiceImpl;
	
	public void setDepartmentServiceImpl(DepartmentService departmentServiceImpl) {
		this.departmentServiceImpl = departmentServiceImpl;
	}



	public void setStrongholdServiceImpl(StrongholdService hlodServiceImpl) {
		this.hlodServiceImpl = hlodServiceImpl;
	}
	 
	 
	 
	public String manage() throws IOException
	{
		 
		return "manage";
	}
	 
	public String list() throws IOException
	{
		 String parentId = request.getParameter("parentId");
		 String type = request.getParameter("type");
		 Page page =  new Page();
		 String pageIndex = request.getParameter("currentPage");
		 int currentPage = 1;
		 if(!SystemUtil.isEmpty(pageIndex))
		 {
			 currentPage = Integer.parseInt(pageIndex);
		 }
		 page.setCurrentPage(currentPage);
		 hlodServiceImpl.queryStrongholdList(parentId,type,page);
		 request.setAttribute("page",page);
		 if(type.equals("0"))
		 {
			 Department d= departmentServiceImpl.queryDepartmentById(parentId);
			 request.setAttribute("departmentId",parentId);
			 request.setAttribute("department",d.getName());
			 return "parkList"; 
			 
		 }else
		 {
			 hlod =  hlodServiceImpl.queryStrongholdById(parentId);
			 request.setAttribute("parkId",parentId);
			 request.setAttribute("parkName",hlod.getName());
			 request.setAttribute("departmentId",hlod.getParentId());
			 return "sentryList";
		 }
		 
	}
	  
	  public void delete() throws IOException
		 {
			 String parkId = request.getParameter("parkId");
			 hlodServiceImpl.deleteStrongholdById(parkId);
			 response.getWriter().print(1);
		 }
	  
	  
	  
	  public String update() throws IOException  
		 {
			 String parkId = request.getParameter("parkId");
			 String type = request.getParameter("type");
			 hlod =  hlodServiceImpl.queryStrongholdById(parkId);
			 hlod.setName(request.getParameter("name"));
			 if(type!=null && type.endsWith("1"))
			 {
				 hlod.setCode(request.getParameter("code"));
			 }else
			 {
				 hlod.setRegion(request.getParameter("region"));
			 }
			 try{
			 hlodServiceImpl.updateStronghold(hlod);
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
			 Stronghold d = new Stronghold();
			 d.setParentId(request.getParameter("parentId"));
			 d.setType(request.getParameter("type"));
			 d.setRegion(request.getParameter("region"));
			 d.setCode(request.getParameter("code"));
			 d.setName(request.getParameter("name"));
			 try{
				 hlodServiceImpl.addStronghold(d);
				 response.getWriter().print(d.getParkId());
			}catch(Exception e)
				 {
					 e.printStackTrace();
					 response.getWriter().print(0);
				 }
			 return null;
		 }
	public Stronghold getModel() {
		// TODO Auto-generated method stub
		return hlod;
	}

	public void setStronghold(Stronghold hlod) {
		this.hlod = hlod;
	}



	public Stronghold getStronghold() {
		return hlod;
	}
    
}
