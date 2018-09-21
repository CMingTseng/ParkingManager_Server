package com.sunset.core.service.impl;

import java.util.HashMap;
import java.util.List;

import com.sunset.core.dao.impl.ConfigDaoImpl;
import com.sunset.core.service.ConfigService;
import com.sunset.model.Config;
import com.sunset.util.SystemUtil;

public class ConfigServiceImpl
  implements ConfigService
{
  private ConfigDaoImpl configDao;


   
  public void setConfigDao(ConfigDaoImpl configDao) {
	this.configDao = configDao;
}


public Config queryConfigById(String sequenceId) {
	    return configDao.queryConfigById(sequenceId);
	  }


	  public void saveConfig(Config config)
	  {
		   config.setSequenceId(SystemUtil.getSequenceId());
		   configDao.saveConfig(config);
	  }

	
	public List<Config>  queryAllConfig() {
		 return configDao.queryAllConfig();
	}
	 
	
	public List<Config>  queryConfigByDomain(String domain) {
		// TODO Auto-generated method stub
		return configDao.queryConfigByDomain(domain);
	}
	public void deleteConfig(String sequenceId) {
		configDao.deleteConfig(sequenceId);
	}
	
	public void update(Config config) {
		configDao.update(config);
	}


	
	public HashMap<String,String> queryDomainList() {
		List<Config> list = configDao.queryAllConfig();
		HashMap<String,String>  map = new HashMap<String,String> ();
		for(Config obj:list)
		{
			map.put(obj.getDomain(), obj.getDomain());
		}
		return map;
	}
}