package com.sunset.core.service.impl;

import com.sunset.core.dao.impl.StrongholdDaoImpl;
import com.sunset.core.service.StrongholdService;
import com.sunset.model.Page;
import com.sunset.model.Stronghold;
import com.sunset.util.SystemUtil;

public class StrongholdServiceImpl implements StrongholdService {

  private 	StrongholdDaoImpl strongholdDao;
      
  

	 
	public void setStrongholdDao(StrongholdDaoImpl strongholdDao) {
	this.strongholdDao = strongholdDao;
}

	public void updateStronghold(Stronghold obj) {
		strongholdDao.updateStronghold(obj);
	}

	public int queryStrongholdAmount(byte paramByte) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public void addStronghold(Stronghold obj) {
		// TODO Auto-generated method stub
		obj.setParkId(SystemUtil.getSequenceId());
		strongholdDao.addStronghold(obj);
	}

	
	public void deleteStrongholdById(String id) {
		strongholdDao.deleteStrongholdById(id);
	}

	
	public Page queryStrongholdList(String deptId,String type,Page page) {
		// TODO Auto-generated method stub
		 int count = this.strongholdDao.queryAmount(deptId,type);
		    page.setCount(Integer.valueOf(count));
		    if(page.getCount()==0)
		    {
		    	return page;
		    }
		return strongholdDao.queryStrongholdList(deptId,type,page);
	}



	
	public Stronghold queryStrongholdById(String portalId) {
		// TODO Auto-generated method stub
		return strongholdDao.queryStrongholdById(portalId);
	}

}
