package com.my.system.c3p0.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.my.system.user.utils.MyDataSource;

public class TestC3p0DataSource {
	public static void addUser() throws SQLException{
		String sql2="update account set money=money+100 where id=2";
		Connection con=C3p0Utils.getConnection();
		PreparedStatement pst=null;
		try {
			pst = con.prepareStatement(sql2);
			pst.executeUpdate();
			
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

	public static void main(String[] args) throws SQLException {
		for(int i=0;i<12;i++){
			addUser();
		}
	}
}
