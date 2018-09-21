package com.sunset.api.action;

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

public class APIVipCarAction extends SuperAction implements ModelDriven<VipCar>{

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

  
     public  void checkVip() throws IOException{
    	 String parkId = request.getParameter("parkId");
    	 String carCode = request.getParameter("carCode");
    	 Stronghold s = strongholdServiceImpl.queryStrongholdById(parkId);
    	 int r = vipServiceImpl.checkVip(s.getParentId(),carCode);
    	 response.getWriter().print(r);
     }
    
	public VipCar getModel() {
		// TODO Auto-generated method stub
		return vip;
	}

 
}
