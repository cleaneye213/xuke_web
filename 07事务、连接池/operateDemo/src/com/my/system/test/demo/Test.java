package com.my.system.test.demo;

import com.my.system.user.utils.JdbcUtils;

public class Test {

	public static void main(String[] args) {
		String sql1="update account set money=money-100 where id=1";
		String sql2="update account set money=money+100 where id=2";
		JdbcUtils.executeUpdate(sql1, null);
		JdbcUtils.executeUpdate(sql2, null);
	}

}
