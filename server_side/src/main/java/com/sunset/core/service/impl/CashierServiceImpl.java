package com.sunset.core.service.impl;

import java.util.List;

import org.apache.log4j.Logger;

import com.sunset.core.dao.impl.CashierDaoImpl;
import com.sunset.core.service.CashierService;
import com.sunset.model.Cashier;
import com.sunset.util.SystemUtil;

public class CashierServiceImpl implements CashierService {

	private static final Logger log=Logger.getLogger(CashierServiceImpl.class);

	private CashierDaoImpl cashierDao;

	//@Transactional(propagation=Propagation.REQUIRED)
	public void addCashier(Cashier Cashier){
		Cashier.setCashierId(SystemUtil.getSequenceId());
		Cashier.setStatus("0");
		Cashier.setPassword("123456");
		cashierDao.addCashier(Cashier);
	}


	 

	//@Transactional(propagation=Propagation.REQUIRED)
	public void deleteCashierById(String cashierId) {
		cashierDao.deleteCashierById(cashierId);

	}

	//@Transactional(readOnly=true)
	public Cashier queryCashier(String cashierId) {
		Cashier Cashier=cashierDao.queryCashier(cashierId);

		return Cashier;
	}

 

	//@Transactional(propagation=Propagation.REQUIRED)
	public void updateCashier(Cashier Cashier) {
		cashierDao.updateCashier(Cashier);
	}
 



	public void setCashierDao(CashierDaoImpl cashierDao) {
		this.cashierDao = cashierDao;
	}



 
	
	public List<Cashier> queryCashierList(Cashier cashier) {
 
		    return this.cashierDao.queryCashierList(cashier);
	}



 



	
	public Cashier queryCashierByAccount(String account) {
		// TODO Auto-generated method stub
		return cashierDao.queryCashierByAccount(account);
	}

 

}
