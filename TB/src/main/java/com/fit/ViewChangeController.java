package com.fit;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.DashBoardServiceManager;
import com.work.ManagerFactory;

@Controller
public class ViewChangeController {
	
	@RequestMapping("/changeAdminView")
	public String changeAdminDashBoardView(HttpServletResponse response, HttpServletRequest request)throws Exception{

		String sendTo = null;
		System.out.println("changeAdminDashBoardView Controller START");
		List <String> locations = new ArrayList();
		List <String> theatres = new ArrayList();
		DashBoardServiceManager dashBoardServiceManager = null;
		try {
			
			dashBoardServiceManager = (DashBoardServiceManager) ManagerFactory.getManagerInstance("com.serviceImpl.DashBoardServiceManagerImpl");
			String reqView = request.getParameter("viewValue");
			String locationName = request.getParameter("locationName");
			if(null != reqView && !reqView.isBlank() && !reqView.isEmpty()) {
				
				if("T".equals(reqView) || "M".equals(reqView)) {
					locations = dashBoardServiceManager.getLocation();
					if( null != locationName && !locationName.isEmpty()) {
						request.setAttribute("loc", locationName);
						request.setAttribute("movie", request.getParameter("movieName"));
						request.setAttribute("dur", request.getParameter("duration"));
						theatres = dashBoardServiceManager.getThreatre(locationName);
					}
					request.setAttribute("thetreList", theatres);
					request.setAttribute("locList", locations);
				}
				request.setAttribute("changeView", reqView);
				sendTo = "//pages/AdminHome.jsp";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("changeAdminDashBoardView Controller END");
		return sendTo;

	}
}
