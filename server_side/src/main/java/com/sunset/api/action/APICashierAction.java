package com.sunset.api.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.CashierService;
import com.sunset.core.service.StrongholdService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Cashier;
public class APICashierAction extends SuperAction implements ModelDriven<Cashier>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Cashier cashier = new Cashier();
	
	@Autowired
	private CashierService cashierServiceImpl;
	@Autowired
	private StrongholdService strongholdServiceImpl;
	
	 
	 
	public StrongholdService getStrongholdServiceImpl() {
		return strongholdServiceImpl;
	}


	public void setStrongholdServiceImpl(StrongholdService strongholdServiceImpl) {
		this.strongholdServiceImpl = strongholdServiceImpl;
	}


	public void setCashierServiceImpl(CashierService cashierServiceImpl) {
		this.cashierServiceImpl = cashierServiceImpl;
	}
	 
	 
	 public String manage()
	 {
		 
		 return "manage";
	 }
	 
	  public void queryByAccount() throws IOException
		{
			 
		  
		    String account =  request.getParameter("account");
		    Cashier obj = cashierServiceImpl.queryCashierByAccount(account);
		    response.setContentType("text/json;charset=UTF-8");
			response.getWriter().print(new Gson().toJson(obj));
		}
	  
	  
	  
	  public void modifyPassword() throws IOException
		 {
			
			 try{
				 Cashier u = cashierServiceImpl.queryCashierByAccount(cashier.getAccount());
				 String newPassword = request.getParameter("newPassword");
				 String oldPassword = request.getParameter("oldPassword");
				 if(!oldPassword.equals(u.getPassword()))
				 {
					 response.getWriter().print(1);
					 return ;
				 }
				 u.setPassword(newPassword);
				 cashierServiceImpl.updateCashier(u);
				 response.getWriter().print(0);
			}catch(Exception e)
			{
					 e.printStackTrace();
					 response.getWriter().print(2);
			}
		 }
	  public String edit() throws IOException
		 {
			
				 Cashier u = cashierServiceImpl.queryCashier(cashier.getCashierId());
				 request.setAttribute("cashier",u);
				 
				 return "edit";
			 
		 }
	  
	public Cashier getModel() {
		// TODO Auto-generated method stub
		return cashier;
	}

	public void setCashier(Cashier cashier) {
		this.cashier = cashier;
	}



	public Cashier getCashier() {
		return cashier;
	}
	
}
