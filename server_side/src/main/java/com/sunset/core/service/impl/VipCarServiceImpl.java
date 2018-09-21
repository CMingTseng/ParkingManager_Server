package com.sunset.core.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sunset.core.dao.impl.VipCarDaoImpl;
import com.sunset.core.service.VipCarService;
import com.sunset.model.Page;
import com.sunset.model.VipCar;
import com.sunset.util.SystemUtil;

public class VipCarServiceImpl implements VipCarService {

  private 	VipCarDaoImpl vipDao;
      
  

	 
	public void setVipDao(VipCarDaoImpl vipDao) {
	this.vipDao = vipDao;
}

	public void updateVipCar(VipCar obj) {
		vipDao.updateVipCar(obj);
	}

	public int queryVipCarAmount(byte paramByte) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public void addVipCar(VipCar obj) {
		// TODO Auto-generated method stub
		obj.setVipId(SystemUtil.getSequenceId());
		vipDao.addVipCar(obj);
	}

	
	public void deleteVipCarById(String id) {
		vipDao.deleteVipCarById(id);
	}

	
	public Page queryVipCarList(VipCar car,Page page) {
		 int count = this.vipDao.queryVipCarAmount(car);
		    page.setCount(Integer.valueOf(count));
		    if(page.getCount()==0)
		    {
		    	return page;
		    }
		return vipDao.queryVipCarList(car,page);
	}



	
	public VipCar queryVipCarById(String vipId) {
		// TODO Auto-generated method stub
		return vipDao.queryVipCarById(vipId);
	}

	
	public int checkVip(String parkId, String carCode) {
		VipCar vip = vipDao.queryVipCarByCode(parkId,carCode);
		if(vip==null)
		{
			return 0;
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(df.parse(vip.getExpireTime()).getTime() < new Date().getTime())
			{
				return 2;
			}
		} catch (ParseException e) {
			 
			e.printStackTrace();
			return 2;
		}
		return 1;
	}

}
