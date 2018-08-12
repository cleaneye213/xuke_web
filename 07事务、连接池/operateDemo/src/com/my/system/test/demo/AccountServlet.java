package com.my.system.test.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.my.system.user.utils.JdbcUtils;

public class AccountServlet {

	public static void main(String[] args){
		String sql1="update account set money=money-100 where id=1";
		String sql2="update account set money=money+100 where id=2";
		Connection con=JdbcUtils.getConnection();
		PreparedStatement pst=null;
		try {
			con.setAutoCommit(false);//关闭自动提交
			pst = con.prepareStatement(sql1);
			pst.executeUpdate();
			
			int i=10/0;
			
			pst= con.prepareStatement(sql2);
			pst.executeUpdate();
			
			con.commit();//手动提交
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pst!=null){
				try {
					pst.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null){
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		}
		
		
		
	}
}
