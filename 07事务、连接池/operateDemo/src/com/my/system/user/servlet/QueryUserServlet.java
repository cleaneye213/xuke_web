package com.my.system.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.system.user.service.UserService;

@WebServlet("/queryUserServlet")
public class QueryUserServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1509845944899607437L;

	private UserService userService=new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		//控制层
		//接收参数，处理数据，输出数据
		userService.queryUser();
		
		
	}

	
	
}
