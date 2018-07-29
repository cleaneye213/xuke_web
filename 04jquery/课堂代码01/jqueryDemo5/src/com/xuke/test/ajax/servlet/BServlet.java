package com.xuke.test.ajax.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BServlet")
public class BServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("22222");
		String userName=req.getParameter("userName");
		
		resp.setContentType("text/html;charset=UTF-8");
		//String jsonStr="{\"userName\":"+userName+"}";
		String jsonStr="{\"userName\":\"admin\",\"sex\":0,\"pwd\":\"2222\"}";
		resp.getWriter().write(jsonStr);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

	
}
