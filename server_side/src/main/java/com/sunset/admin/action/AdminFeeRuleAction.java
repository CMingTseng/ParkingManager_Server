package com.sunset.admin.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.FeeRuleService;
import com.sunset.core.service.StrongholdService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.FeeRule;
import com.sunset.model.Stronghold;
public class AdminFeeRuleAction extends SuperAction implements ModelDriven<FeeRule>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FeeRule rule = new FeeRule();
	
	@Autowired
	private FeeRuleService ruleServiceImpl;
	@Autowired
	private StrongholdService strongholdServiceImpl;
	
	public void setStrongholdServiceImpl(StrongholdService strongholdServiceImpl) {
		this.strongholdServiceImpl = strongholdServiceImpl;
	}
 
  


	public void setRuleServiceImpl(FeeRuleService ruleServiceImpl) {
		this.ruleServiceImpl = ruleServiceImpl;
	}




	public String list() throws IOException
	{
		 String parkId = request.getParameter("parkId");
		 
		 List list = ruleServiceImpl.queryFeeRuleList(parkId);
		 request.setAttribute("dataList",list);
		 request.setAttribute("count",list==null?0:list.size());
		 Stronghold d= strongholdServiceImpl.queryStrongholdById(parkId);
		 request.setAttribute("parkId",parkId);
		 request.setAttribute("parkName",d.getName());
		 request.setAttribute("departmentId",d.getParentId());
		 return "list"; 
	}
	  
	  public void delete() throws IOException
		 {
			 String ruleId = request.getParameter("ruleId");
			 ruleServiceImpl.deleteFeeRuleById(ruleId);
			 response.getWriter().print(1);
		 }
	  
	  
	  
	  public String update() throws IOException  
		 {
			 String ruleId = request.getParameter("ruleId");
			 rule =  ruleServiceImpl.queryFeeRuleById(ruleId);
			 rule.setCarType(request.getParameter("carType"));
			 rule.setFreeTime(request.getParameter("freeTime"));
			 rule.setMaxFee(request.getParameter("maxFee"));
			 rule.setFirstTime(request.getParameter("firstTime"));
			 rule.setFirstPrice(request.getParameter("firstPrice"));
			 rule.setSpaceTime(request.getParameter("spaceTime"));
			 rule.setSpacePrice(request.getParameter("spacePrice"));
			 try{
			     ruleServiceImpl.updateFeeRule(rule);
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
			 FeeRule d = new FeeRule();
			 d.setParkId(request.getParameter("parkId"));
			 d.setType(request.getParameter("type"));
			 d.setCarType(request.getParameter("carType"));
			 d.setFreeTime(request.getParameter("freeTime"));
			 d.setMaxFee(request.getParameter("maxFee"));
			 d.setFirstTime(request.getParameter("firstTime"));
			 d.setFirstPrice(request.getParameter("firstPrice"));
			 d.setSpaceTime(request.getParameter("spaceTime"));
			 d.setSpacePrice(request.getParameter("spacePrice"));
			 try{
				 ruleServiceImpl.addFeeRule(d);
				 response.getWriter().print(d.getParkId());
			}catch(Exception e)
				 {
					 e.printStackTrace();
					 response.getWriter().print(0);
				 }
			 return null;
		 }
	public FeeRule getModel() {
		// TODO Auto-generated method stub
		return rule;
	}

	public void setFeeRule(FeeRule rule) {
		this.rule = rule;
	}



	public FeeRule getRule() {
		return rule;
	}



	public void setRule(FeeRule rule) {
		this.rule = rule;
	}



	 
}
