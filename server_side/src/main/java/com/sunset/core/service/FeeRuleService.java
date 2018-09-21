package com.sunset.core.service;

import java.util.List;

import com.sunset.model.FeeRule;

public abstract interface FeeRuleService
{
  public abstract void addFeeRule(FeeRule obj);

  public List<FeeRule> queryFeeRuleList(String parkId);

  public abstract void deleteFeeRuleById(String id);

  public void updateFeeRule(FeeRule obj);

  public abstract FeeRule queryFeeRuleById(String id);
  
  public abstract FeeRule queryFeeRuleByPark(String parkId);
}