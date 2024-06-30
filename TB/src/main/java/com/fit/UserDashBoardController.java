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
public class UserDashBoardController {

	@RequestMapping("/enableBooking")
	public String getMovieDtls(HttpServletResponse response, HttpServletRequest request)throws Exception{

		String sendTo = null;
		List <String> movieList = null;
		List <String> locationList = null;
		List <String> theatreList = null;
		System.out.println("changeAdminDashBoardView Controller START");
		DashBoardServiceManager dashBoardServiceManager = null;
		try {
			dashBoardServiceManager = (DashBoardServiceManager) ManagerFactory.getManagerInstance("com.serviceImpl.DashBoardServiceManagerImpl");
			
			movieList = new ArrayList();
			locationList = new ArrayList<String>();
			theatreList = new ArrayList<String>();
			
			movieList = dashBoardServiceManager.getMovie();
			String movieName = request.getParameter("movieName");
			request.setAttribute("mvName", movieName);
			if(null != movieName && !movieName.isEmpty()) {
				locationList = dashBoardServiceManager.getLocation(movieName);
			}
			
			String locationName = request.getParameter("locationName");
			request.setAttribute("locName", locationName);
			if( null != locationName && !locationName.isEmpty()) {
				theatreList = dashBoardServiceManager.getThreatre(locationName);
			}
			request.setAttribute("theName", request.getParameter("theatreName"));
			
			request.setAttribute("mvList", movieList);
			request.setAttribute("locList", locationList);
			request.setAttribute("theaList", theatreList);

			sendTo = "//pages/HomePage.jsp";
			
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("changeAdminDashBoardView Controller END");
		return sendTo;
	}
}
