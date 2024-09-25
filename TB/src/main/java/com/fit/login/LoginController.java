package com.fit.login;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.ParameterConstants;
import com.service.LoginServiceManager;
import com.work.ManagerFactory;

@Controller
public class LoginController {
	@RequestMapping("/checkEntry")
	public String checkMail(@RequestParam(ParameterConstants.USERNAME) String userName ,HttpServletResponse response, HttpServletRequest request)throws Exception{

		String sendTo = null;
		System.out.println("Login Controller START");
		try {
			request.setAttribute("warning", true);
			sendTo = "/index.jsp";
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("Login Controller END");
		return sendTo;

	}

	@RequestMapping("/signUp")
	public String createNewUser(HttpServletResponse response, HttpServletRequest request)throws Exception{

		String sendTo = null;
		System.out.println("Login Controller START..!");
		try {
			String name = request.getParameter(ParameterConstants.USERNAME);
			String firstName = request.getParameter(ParameterConstants.FIRST_NAME);
			String secondName = request.getParameter(ParameterConstants.SECOND_NAME);
			String password = request.getParameter(ParameterConstants.PASSWORD);
			request.setAttribute("clear", true);
			sendTo = "//pages/AddUser.jsp";
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("Login Controller END");
		return sendTo;

	}

	@RequestMapping("/checkUser")
	public void checkUser(HttpServletResponse response, HttpServletRequest request)throws Exception{
		System.out.println("Username checking ajax method started. (C)LoginController -> (M)checkUser()");
		LoginServiceManager loginServiceManager = null;
		try {
			String userName = request.getParameter("userName");
			System.out.println("username : " + userName);
			loginServiceManager = (LoginServiceManager) ManagerFactory.getManagerInstance("com.serviceImpl.LoginServiceManagerImpl");
			int count = loginServiceManager.checkUser(userName);
			System.out.println("Out from service layer");
			String htmlResponse = String.valueOf(	count);
	        response.setContentType("text/html");
	        response.getWriter().write(htmlResponse);

		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Username checking ajax method failed. (C)LoginController -> (M)checkUser() ");
			throw ex;
		}
		System.out.println("Username checking ajax method ended. (C)LoginController -> (M)checkUser()");
	}
	
	@RequestMapping("/loginToUser")
	public String LoginToUser(HttpServletResponse response, HttpServletRequest request)throws Exception{
		LoginServiceManager loginServiceManager = null;
		String sendTo = null;
		System.out.println("Login Controller START..!");
		List <Object> loginResult = null;
		try {
			loginResult = new ArrayList<Object>();
			loginServiceManager = (LoginServiceManager) ManagerFactory.getManagerInstance("com.serviceImpl.LoginServiceManagerImpl");
			String phone = request.getParameter(ParameterConstants.PHONE);
			String password = request.getParameter(ParameterConstants.PASSWORD);
			loginResult = loginServiceManager.login(phone, password);
			
			
			if(null != loginResult && !loginResult.isEmpty()) {
				Object [] userObj = (Object[]) loginResult.get(0);
				String firstName =  (String) userObj[0];
				String secondName = (String) userObj[1];
				String DP = firstName.charAt(0) + "" + secondName.charAt(0);
				BigDecimal userObjB = (BigDecimal) userObj[2]; // Assuming userObj is an array or list holding BigDecimal at index 2
				int roleId = userObjB.intValue(); // Convert BigDecimal to int
				request.setAttribute("fName", firstName);
				request.setAttribute("sName", secondName);
				request.setAttribute("DP", DP);
				if(roleId == 2) {
					request.setAttribute("enableBooking", true);
				}
				sendTo = (roleId == 1) ? "//pages/AdminHome.jsp" : "//pages/HomePage.jsp";
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("Login Controller END");
		return sendTo;

	}
	
	@RequestMapping("/logout")
	public String logOut(HttpServletResponse response, HttpServletRequest request)throws Exception{

		String sendTo = null;
		System.out.println("Login Controller START");
		try {
			sendTo = "/index.jsp";
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("Login Controller END");
		return sendTo;

	}
}
