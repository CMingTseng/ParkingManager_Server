package com.sunset.core.service;


import com.sunset.model.Page;
import com.sunset.model.VipCar;

public abstract interface VipCarService
{
  public abstract void addVipCar(VipCar obj);

  public Page queryVipCarList(VipCar car ,Page page);

  public abstract void deleteVipCarById(String id);

  public void updateVipCar(VipCar obj);

 public abstract VipCar queryVipCarById(String portalId);

 public abstract int checkVip(String parkId, String carCode);
}