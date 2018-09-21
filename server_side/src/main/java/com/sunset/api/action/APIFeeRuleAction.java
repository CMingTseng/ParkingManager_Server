package com.sunset.api.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.FeeRuleService;
import com.sunset.core.service.StrongholdService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.FeeRule;
import com.sunset.model.Stronghold;
public class APIFeeRuleAction extends SuperAction implements ModelDriven<FeeRule>{

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




	public void query() throws IOException
	{
		 Stronghold s = strongholdServiceImpl.queryStrongholdById(rule.getParkId());
		 rule = ruleServiceImpl.queryFeeRuleByPark(s.getParentId());
		 response.setContentType("text/json;charset=UTF-8");
		 response.getWriter().print(new Gson().toJson(rule));
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
