package com.my.system.user.service;

import com.my.system.user.dao.UserDao;

public class UserService {
	private UserDao userDao=new UserDao();

	public boolean addUser(){
		//调用数据操作类(dao层)
		userDao.addUser();
		return true;
	}

	public void queryUser() {
		userDao.queryUser();
	}
}
