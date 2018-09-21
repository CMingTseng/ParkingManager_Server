package com.sunset.core.service.impl;

import org.apache.log4j.Logger;

import com.sunset.core.dao.impl.UserDaoImpl;
import com.sunset.core.service.UserService;
import com.sunset.model.Page;
import com.sunset.model.User;
import com.sunset.util.SystemUtil;

public class UserServiceImpl implements UserService {

	private static final Logger log=Logger.getLogger(UserServiceImpl.class);

	private UserDaoImpl userDao;

	//@Transactional(propagation=Propagation.REQUIRED)
	public void addUser(User User){
		User.setUserId(SystemUtil.getSequenceId());
		User.setStatus("0");
		User.setPassword("123456");
		User.setPower("00000000000000000000000000000000");
		userDao.addUser(User);
	}


	 

	//@Transactional(propagation=Propagation.REQUIRED)
	public void deleteUserById(String userId) {
		userDao.deleteUserById(userId);

	}

	//@Transactional(readOnly=true)
	public User queryUser(String userId) {
		User User=userDao.queryUser(userId);

		return User;
	}

 

	//@Transactional(propagation=Propagation.REQUIRED)
	public void updateUser(User User) {
		userDao.updateUser(User);
	}
 



	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}



 
	
	public Page queryUserList(User user, Page page) {
		    int count = this.userDao.queryUserAmount(user);
		    page.setCount(Integer.valueOf(count));
		    if(page.getCount()==0)
		    {
		    	return page;
		    }
		    return this.userDao.queryUserList(user, page);
	}



	//@Transactional(readOnly=true)
	public int queryUserAmount() {
		// TODO Auto-generated method stub
		return 0;
	}




	
	public User queryUserByAccount(String account) {
		// TODO Auto-generated method stub
		return userDao.queryUserByAccount(account);
	}

 

}
