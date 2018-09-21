package com.sunset.admin.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.PortalService;
import com.sunset.core.service.StrongholdService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Portal;
import com.sunset.model.Stronghold;
public class AdminPortalAction extends SuperAction implements ModelDriven<Portal>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Portal portal = new Portal();
	
	@Autowired
	private PortalService portalServiceImpl;
	@Autowired
	private StrongholdService strongholdServiceImpl;
	
	public void setStrongholdServiceImpl(StrongholdService strongholdServiceImpl) {
		this.strongholdServiceImpl = strongholdServiceImpl;
	}



	public void setPortalServiceImpl(PortalService portalServiceImpl) {
		this.portalServiceImpl = portalServiceImpl;
	}
	 
	 
	 
	public String list() throws IOException
	{
		 String parkId = request.getParameter("parkId");
		 
		List list = portalServiceImpl.queryPortalList(parkId);
		Stronghold d = strongholdServiceImpl.queryStrongholdById(parkId);
		request.setAttribute("dataList",list);
		request.setAttribute("parentId",d.getParentId());
		request.setAttribute("parkName",d.getName());
		request.setAttribute("count",list==null?0:list.size());
		return "list";
	}
	  
	  public void delete() throws IOException
		 {
			 String portalId = request.getParameter("portalId");
			 portalServiceImpl.deletePortalById(portalId);
			 response.getWriter().print(1);
		 }
	  
	  
	  
	  public String update() throws IOException  
		 {
			 String portalId = request.getParameter("portalId");
			 portal =  portalServiceImpl.queryPortalById(portalId);
			 portal.setName(request.getParameter("name"));
			 try{
			 portalServiceImpl.updatePortal(portal);
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
			 Portal d = new Portal();
			 d.setParkId(request.getParameter("parkId"));
			 d.setName(request.getParameter("name"));
			 try{
				 portalServiceImpl.addPortal(d);
				 response.getWriter().print(d.getPortalId());
			}catch(Exception e)
				 {
					 e.printStackTrace();
					 response.getWriter().print(0);
				 }
			 return null;
		 }
	public Portal getModel() {
		// TODO Auto-generated method stub
		return portal;
	}

	public void setPortal(Portal portal) {
		this.portal = portal;
	}



	public Portal getPortal() {
		return portal;
	}
    
}
