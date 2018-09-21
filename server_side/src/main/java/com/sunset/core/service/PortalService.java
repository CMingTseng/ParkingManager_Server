package com.sunset.core.service;

import java.util.List;

import com.sunset.model.Portal;

public abstract interface PortalService
{
  public abstract void addPortal(Portal obj);

  public List<Portal> queryPortalList(String parkId);

  public abstract void deletePortalById(String id);

  public void updatePortal(Portal obj);

 public abstract Portal queryPortalById(String portalId);
}