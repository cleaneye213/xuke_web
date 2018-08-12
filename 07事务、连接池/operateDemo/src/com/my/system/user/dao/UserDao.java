package com.my.system.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.my.system.user.utils.JdbcUtils;

public class UserDao {
	
	public void queryUser(){
		String sql="select * from user";
		List<Map<String, Object>> resList = JdbcUtils.executeQuery(sql, null);
		for(Map<String, Object> map:resList){
			System.out.println(map.get("id"));
			System.out.println(map.get("user_name"));
			System.out.println(map.get("login_name"));
		}
		JdbcUtils.close();
	}

	public void addUser(){
		try {
			//3获取prestatement
			String sql="insert into user(id,user_name,login_name) values(?,?,?)";
			//4执行sql
			int flag = JdbcUtils.executeUpdate(sql,1,"admin","admin");
			//5处理返回数据
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils.close();
		}
		
		
		
		//
		//6释放资源
	}
	
	public void modifyUser(){
			
	}
	
	public void deleteUser(){
		
	}
}
