package com.sunset.api.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.PortalService;
import com.sunset.core.service.StrongholdService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Portal;
public class APIPortalAction extends SuperAction implements ModelDriven<Portal>{

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
	 
	 
	 
	public void list() throws IOException
	{
		 String parkId = request.getParameter("parkId");
		 
		List<Portal> list = portalServiceImpl.queryPortalList(parkId);
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().print(new Gson().toJson(list));
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
