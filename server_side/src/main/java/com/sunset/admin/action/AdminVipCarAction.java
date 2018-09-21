package com.sunset.admin.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.StrongholdService;
import com.sunset.core.service.VipCarService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Page;
import com.sunset.model.Stronghold;
import com.sunset.model.VipCar;
import com.sunset.util.SystemUtil;

public class AdminVipCarAction extends SuperAction implements ModelDriven<VipCar>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Autowired
	private VipCarService vipServiceImpl;
	@Autowired
	private StrongholdService strongholdServiceImpl;
	
	public void setStrongholdServiceImpl(StrongholdService strongholdServiceImpl) {
		this.strongholdServiceImpl = strongholdServiceImpl;
	}
	
	private VipCar vip = new VipCar();
    
	public VipCar getVipCar() {
		return vip;
	}

	public void setVipCar(VipCar vip) {
		this.vip = vip;
	}
    
	
	public void setVipServiceImpl(VipCarService vipServiceImpl) {
		this.vipServiceImpl = vipServiceImpl;
	}

	public String list() throws IOException
	{
		 
		 Page page =  new Page();
		 String pageIndex = request.getParameter("currentPage");
		 String parkId = request.getParameter("parkId");
		 Stronghold sh = strongholdServiceImpl.queryStrongholdById(parkId);
		 int currentPage = 1;
		 if(!SystemUtil.isEmpty(pageIndex))
		 {
			 currentPage = Integer.parseInt(pageIndex);
		 }
		 page.setCurrentPage(currentPage);
		if(vip==null)
			vip = new VipCar();
		vipServiceImpl.queryVipCarList(vip,page);
		request.setAttribute("page",page);
		request.setAttribute("vip",vip);
		request.setAttribute("prakName",sh.getName());
		request.setAttribute("parkId",parkId);
		request.setAttribute("departmentId",sh.getParentId());
		return "list";
	}
	 
	 public void delete() throws IOException
	 {
		 String vipId = request.getParameter("vipId");
		 vipServiceImpl.deleteVipCarById(vipId);
		 response.getWriter().print(1);
	 }
  
  
  
  public String update() throws IOException  
	 {
		 String vipId = request.getParameter("vipId");
		 vip =  vipServiceImpl.queryVipCarById(vipId);
		 vip.setExpireTime(request.getParameter("expireTime"));
		 vip.setCarCode(request.getParameter("carCode"));
		 try{
			 vipServiceImpl.updateVipCar(vip);
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
		 VipCar v = new VipCar();
		 v.setExpireTime(request.getParameter("expireTime"));
		 v.setParkId(request.getParameter("parkId"));
		 v.setCarCode(request.getParameter("carCode"));
		 try{
			 vipServiceImpl.addVipCar(v);
			 response.getWriter().print(v.getVipId());
		}catch(Exception e)
			 {
				 e.printStackTrace();
				 response.getWriter().print(0);
			 }
		 return null;
	 }
	public VipCar getModel() {
		// TODO Auto-generated method stub
		return vip;
	}

 
}
