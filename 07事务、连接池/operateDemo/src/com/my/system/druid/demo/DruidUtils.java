package com.my.system.druid.demo;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;

public class DruidUtils {
	
	private static DataSource dSource=null;
	
	static{
		Properties pt=new Properties();
		InputStream rStream = DruidUtils.class.getClassLoader().getResourceAsStream("druid.properties");
		try {
			pt.load(rStream);
			dSource = DruidDataSourceFactory.createDataSource(pt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConnection(){
		Connection conn=null;
		try {
			conn=dSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
}
