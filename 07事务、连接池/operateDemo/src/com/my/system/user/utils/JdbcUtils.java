package com.my.system.user.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JdbcUtils {
	
	private static String url="jdbc:mysql://127.0.0.1:3306/xunke?useUnicode=true&characterEncoding=utf-8";
	private static String userName="root";
	private static String pwd="123456";
	private static PreparedStatement preStat=null;
	private static Connection conn=null;
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public static Connection getConnection(){
		try {
			if(conn==null){
				conn=DriverManager.getConnection(url, userName, pwd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 查询
	 * @param sql
	 * @param params
	 * @return
	 */
	public static List<Map<String,Object>> executeQuery(String sql,Object... params){
		 List<Map<String,Object>> resList=new ArrayList<Map<String,Object>>();
		 Map<String,Object> clun=null;
		try {
			preStat=getConnection().prepareStatement(sql);
			if(params!=null){
				for(int i=0;i<params.length;i++){
					preStat.setObject(i+1, params[i]);
				}
			}
			
			ResultSet res = preStat.executeQuery();
			//元数据（含有列的名称及个数等信息）
			ResultSetMetaData metaData = res.getMetaData();
			int columnCount = metaData.getColumnCount();
			while(res.next()){
				clun=new HashMap<String,Object>();
				for(int i=0;i<columnCount;i++){
					//System.out.println(metaData.getColumnName(i+1));
					//System.out.println(res.getObject(i+1));
					clun.put(metaData.getColumnName(i+1), res.getObject(i+1));
				}
				resList.add(clun);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resList;
	}
	
	/**
	 * 执行insert update delete语句
	 * @param sql
	 * @param params
	 * @return
	 */
	public static int executeUpdate(String sql,Object... params){
		int flag=0;
		try {
			preStat=getConnection().prepareStatement(sql);
			if(params!=null){
				for(int i=0;i<params.length;i++){
					preStat.setObject(i+1, params[i]);
				}
			}
			flag=preStat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public static void close(){
		if(preStat!=null){
			try {
				preStat.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}
}
