package com.sunset.core.service;


import com.sunset.model.Page;
import com.sunset.model.Stronghold;

public abstract interface StrongholdService
{
  public abstract void addStronghold(Stronghold obj);

  public Page queryStrongholdList(String deptId,String type,Page page);

  public abstract void deleteStrongholdById(String id);

  public void updateStronghold(Stronghold obj);

 public abstract Stronghold queryStrongholdById(String portalId);
}