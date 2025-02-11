package com.fit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Show;
import com.service.DashBoardServiceManager;
import com.service.LoginServiceManager;
import com.work.ManagerFactory;

@Controller
public class AddController {
	@RequestMapping("/addTheatre")
	public String addTheatre(HttpServletResponse response, HttpServletRequest request)throws Exception{

		String sendTo = null;
		boolean saveFlag = false;
		System.out.println("changeAdminDashBoardView Controller START");
		DashBoardServiceManager dashBoardServiceManager = null;
		try {
			
			dashBoardServiceManager = (DashBoardServiceManager) ManagerFactory.getManagerInstance("com.serviceImpl.DashBoardServiceManagerImpl");
			String theatreName = request.getParameter("theatreName");
			String locationName = request.getParameter("locationName");
			
			if(null != locationName && !locationName.isBlank() && !locationName.isEmpty() && null != theatreName && !theatreName.isEmpty()) {
				saveFlag = dashBoardServiceManager.saveTheathre(theatreName, locationName);
				request.setAttribute("saveFlag", saveFlag ? true : false);
				request.setAttribute("changeView", "L");
				sendTo = "//pages/AdminHome.jsp";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("changeAdminDashBoardView Controller END");
		return sendTo;
	}
	
	@RequestMapping("/addLocation")
	public String addLocation(HttpServletResponse response, HttpServletRequest request)throws Exception{

		String sendTo = null;
		boolean saveFlag = false;
		System.out.println("changeAdminDashBoardView Controller START");
		DashBoardServiceManager dashBoardServiceManager = null;
		try {
			
			dashBoardServiceManager = (DashBoardServiceManager) ManagerFactory.getManagerInstance("com.serviceImpl.DashBoardServiceManagerImpl");
			String locationName = request.getParameter("locationName");
			
			if(null != locationName && !locationName.isBlank() && !locationName.isEmpty()) {
				saveFlag = dashBoardServiceManager.saveLocation(locationName);
				request.setAttribute("saveFlag", saveFlag ? true : false);
				request.setAttribute("changeView", "L");
				sendTo = "//pages/AdminHome.jsp";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("changeAdminDashBoardView Controller END");
		return sendTo;

	}
	
	@RequestMapping("/addMovie")
	public String addMovie(HttpServletResponse response, HttpServletRequest request)throws Exception{

		String sendTo = null;
		System.out.println("changeAdminDashBoardView Controller START");
		Show show = null;
		DashBoardServiceManager dashBoardServiceManager = null;
		try {
			show = new Show();
			dashBoardServiceManager = (DashBoardServiceManager) ManagerFactory.getManagerInstance("com.serviceImpl.DashBoardServiceManagerImpl");
			String theatreName = request.getParameter("theatreName");
			String locationName = request.getParameter("locationName");
			String movieName = request.getParameter("movieName");
			String duration = request.getParameter("duration");
			duration = null != duration && duration.isEmpty() ? duration : "0";
			int duraMIn = Integer.parseInt(duration);
			
			show.setTheatreName(theatreName);
			show.setLocationName(locationName);
			show.setMovieName(movieName);
			show.setMovieDuration(duraMIn);
			
			boolean flag = dashBoardServiceManager.saveMovie(show);
			if(flag) {
				request.setAttribute("saved", true);
			}
			sendTo = "//pages/AdminHome.jsp";
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("changeAdminDashBoardView Controller END");
		return sendTo;

	}
}
