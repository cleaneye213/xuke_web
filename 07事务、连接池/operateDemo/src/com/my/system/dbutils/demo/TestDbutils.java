package com.my.system.dbutils.demo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import com.my.system.c3p0.demo.C3p0Utils;

public class TestDbutils {
	
	@Test
	public void updateAcount2() throws SQLException{
		//必须是在同一个的Connection下才能控制事务
		Connection conn=C3p0Utils.getConnection();
		QueryRunner qRunner=new QueryRunner();
		try {
			//关闭自动提交
			conn.setAutoCommit(false);
			
			String sql1="update account set money=money-100 where id=1";
			qRunner.update(conn,sql1);
			int i=100/0;
			String sql2="update account set money=money+100 where id=2";
			qRunner.update(conn,sql2);
			
			//提交操作
			conn.commit();
		} catch (Exception e) {
			//出现异常回滚
			conn.rollback();
		}finally {
			conn.close();
		}
	}
	
	
	@Test
	public void queryAccount(){
		String sql="select * from account";
		QueryRunner qRunner=new QueryRunner(C3p0Utils.getDataSource());
		BeanListHandler beanListHandler=new BeanListHandler(Account.class);
		try {
			List<Account> list=(List<Account>) qRunner.query(sql, beanListHandler);
			for(Account temp:list){
				System.out.println(temp.toString());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void updateAccount(){
		QueryRunner qRunner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="update account set money=money+100 where id=2";
		try {
			int flag = qRunner.update(sql);
			System.out.println(flag);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
