package com.sunset.admin.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.CashierService;
import com.sunset.core.service.StrongholdService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Cashier;
import com.sunset.model.Stronghold;
import com.sunset.model.User;
public class AdminCashierAction extends SuperAction implements ModelDriven<Cashier>{

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
	 
	  public String list() throws IOException
		{
			 
		    if(cashier.getParkId()==null){
		    String parkId = request.getParameter("parkId");
		        cashier.setParkId(parkId);
		    }
		    Stronghold d= strongholdServiceImpl.queryStrongholdById(cashier.getParkId());
			 
			List<Cashier> dataList = cashierServiceImpl.queryCashierList(cashier);
			request.setAttribute("dataList",dataList);
			request.setAttribute("parkName",d.getName());
			request.setAttribute("cashier",cashier);
			request.setAttribute("parentId",d.getParentId());
			request.setAttribute("count",dataList==null?0:dataList.size());
			return "list";
		}
	  
	  public String add() throws IOException  
		 {
			 
			 cashier.setParkId(request.getParameter("parkId"));
			 cashier.setName(request.getParameter("name"));
			 cashier.setAccount(request.getParameter("account"));
			 cashier.setTelephone(request.getParameter("telephone"));
			 Cashier c = cashierServiceImpl.queryCashierByAccount(cashier.getAccount());
			 if(c != null)
			 {
				 response.getWriter().print(2);
				 return null;
			 }
			 try{
				 cashierServiceImpl.addCashier(cashier);
				 response.getWriter().print(1);
				 }catch(Exception e)
				 {
					 e.printStackTrace();
					 response.getWriter().print(0);
				 }
			 return null;
		 }
	  
	  public String update() throws IOException  
		 {
			 
		     Cashier u = cashierServiceImpl.queryCashier(cashier.getCashierId());
			 u.setName(cashier.getName());
			 u.setTelephone(cashier.getTelephone());
			 try{
				 cashierServiceImpl.updateCashier(u);
				 response.getWriter().print(1);
				 }catch(Exception e)
				 {
					 e.printStackTrace();
					 response.getWriter().print(0);
				 }
			 return null;
		 }
	  public void changeStatus() throws IOException
		 {
			
			 try{
				 String cashierId = request.getParameter("cashierId");
				 Cashier u = cashierServiceImpl.queryCashier(cashierId);
				 u.setStatus(request.getParameter("status"));
				 cashierServiceImpl.updateCashier(u);
			}catch(Exception e)
			{
					 e.printStackTrace();
					 response.getWriter().print(0);
			}
		 }
	  
	  public void modifyPassword() throws IOException
		 {
			
			 try{
				 Cashier u = (Cashier) session.getAttribute("cashier");
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
	  
	  
	  public void delete() throws IOException
		 {
		     String cashierId = request.getParameter("cashierId");
			 cashierServiceImpl.deleteCashierById(cashierId);
			 response.getWriter().print(1);
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
