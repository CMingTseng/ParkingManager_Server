package com.sunset.core.service;

import com.sunset.model.Page;
import com.sunset.model.User;

public abstract interface UserService
{
	public void addUser(User User);

	public void deleteUserById(String userId);

	public User queryUser(String userId);

	public   Page queryUserList(User user, Page page);

	public void updateUser(User User);

	public int queryUserAmount();
	

	public User queryUserByAccount(String account);


}