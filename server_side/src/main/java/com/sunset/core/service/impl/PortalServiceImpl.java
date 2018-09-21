package com.sunset.core.service.impl;

import java.util.List;

import com.sunset.core.dao.impl.PortalDaoImpl;
import com.sunset.core.service.PortalService;
import com.sunset.model.Portal;
import com.sunset.model.Page;
import com.sunset.util.SystemUtil;

public class PortalServiceImpl implements PortalService {

  private 	PortalDaoImpl portalDao;
      
 

	public void setPortalDao(PortalDaoImpl portalDao) {
		this.portalDao = portalDao;
}


	 
	public void updatePortal(Portal obj) {
		portalDao.updatePortal(obj);
	}

	public int queryPortalAmount(byte paramByte) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public void addPortal(Portal obj) {
		// TODO Auto-generated method stub
		obj.setPortalId(SystemUtil.getSequenceId());
		portalDao.addPortal(obj);
	}

	
	public void deletePortalById(String id) {
		portalDao.deletePortalById(id);
	}

	
	public List<Portal> queryPortalList(String deptId) {
		// TODO Auto-generated method stub
		return portalDao.queryPortalList(deptId);
	}



	
	public Portal queryPortalById(String portalId) {
		// TODO Auto-generated method stub
		return portalDao.queryPortalById(portalId);
	}

}
