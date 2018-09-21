package com.sunset.core.service.impl;

import java.util.List;

import com.sunset.core.dao.impl.FeeRuleDaoImpl;
import com.sunset.core.service.FeeRuleService;
import com.sunset.model.FeeRule;
import com.sunset.util.SystemUtil;

public class FeeRuleServiceImpl implements FeeRuleService {

  private 	FeeRuleDaoImpl feeRuleDao;
	 
	public void setFeeRuleDao(FeeRuleDaoImpl feeRuleDao) {
	this.feeRuleDao = feeRuleDao;
}

	public void updateFeeRule(FeeRule obj) {
		feeRuleDao.updateFeeRule(obj);
	}

	public int queryFeeRuleAmount(byte paramByte) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public void addFeeRule(FeeRule obj) {
		// TODO Auto-generated method stub
		obj.setRuleId(SystemUtil.getSequenceId());
		feeRuleDao.addFeeRule(obj);
	}

	
	public void deleteFeeRuleById(String id) {
		feeRuleDao.deleteFeeRuleById(id);
	}

	
	public List<FeeRule> queryFeeRuleList(String parkId) {
		// TODO Auto-generated method stub
		return feeRuleDao.queryFeeRuleList(parkId);
	}



	
	public FeeRule queryFeeRuleById(String portalId) {
		// TODO Auto-generated method stub
		return feeRuleDao.queryFeeRuleById(portalId);
	}

	
	public FeeRule queryFeeRuleByPark(String parkId) {
		// TODO Auto-generated method stub
		return feeRuleDao.queryFeeRuleByPark(parkId);
	}

}
