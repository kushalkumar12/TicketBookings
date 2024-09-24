package com.fit;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.StaticBookingSeats;
import com.model.Bookings;
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
			String bookMode = request.getParameter("modeName");
			
			if(null == bookMode || "".equals(bookMode) || "BT".equals(bookMode)) {
				//Added Generics
				movieList = new ArrayList<>();
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
				
				String theatreName = request.getParameter("theatreName");
				
				request.setAttribute("mvList", movieList);
				request.setAttribute("locList", locationList);
				request.setAttribute("theaList", theatreList);
				String openSeats = request.getParameter("openSeats");
				if("YES".equals(openSeats)) {
					List <String[]> seatsList = new ArrayList<>();
					String seats = dashBoardServiceManager.getBookedSeats(locationName, theatreName, movieName);
					
					if(null != seats && !seats.isBlank() && !seats.isEmpty()) {
						
						String bookedSeats[] =  seats.split(", ");
						System.out.println(bookedSeats.toString() + "These are the seats already been booked");
						request.setAttribute("bookedSeats",bookedSeats);
					}
					
					seatsList = StaticBookingSeats.getSeats();
					request.setAttribute("allSeats",seatsList);
					request.setAttribute("enableSeats", true);
				}
				request.setAttribute("bookMode", true);
			}
			if("SB".equals(bookMode)) {
				List <Object> bookinglist = new ArrayList<>();
				bookinglist = dashBoardServiceManager.getBookingList();
				request.setAttribute("bookinglist", bookinglist);
				request.setAttribute("bookMode", false);
			}
			sendTo = "//pages/HomePage.jsp";
			
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		System.out.println("changeAdminDashBoardView Controller END");
		return sendTo;
	}
	
	@RequestMapping("/saveShowDtls")
	public String saveShowDtls(HttpServletResponse response, HttpServletRequest request)throws Exception{
		String sendTo = null;
		DashBoardServiceManager dashBoardServiceManager = null;
		boolean saveflag = false;
		List <String> movieList = null;
		try {
			dashBoardServiceManager = (DashBoardServiceManager) ManagerFactory.getManagerInstance("com.serviceImpl.DashBoardServiceManagerImpl");
			String movieName = request.getParameter("movieName");
			String locationName = request.getParameter("locationName");
			String theatreName = request.getParameter("theatreName");
			String seats = request.getParameter("seats");
			String cost = request.getParameter("cost");
			String bookingStatus = "Booked";
			Bookings bookings = new Bookings();
			if (movieName != null && !movieName.isEmpty() &&
				    locationName != null && !locationName.isEmpty() &&
				    theatreName != null && !theatreName.isEmpty() &&
				    seats != null && !seats.isEmpty() &&
				    cost != null && !cost.isEmpty() &&
				    bookingStatus != null && !bookingStatus.isEmpty()) {
				
				bookings.setShowName(movieName);
				bookings.setLocationName(locationName);
				bookings.setTheatreName(theatreName);
				bookings.setSeatNo(seats);
				bookings.setTicketRate(Double.parseDouble(cost));
				bookings.setStatus(bookingStatus);
				bookings.setCreatedBy("admin");
				bookings.setCreatedOn(new java.sql.Date(System.currentTimeMillis()));
				bookings.setBookedDate(new java.sql.Date(System.currentTimeMillis()));
				bookings.setModifiedBy("admin");
				bookings.setModifiedOn(new java.sql.Date(System.currentTimeMillis()));
				saveflag = dashBoardServiceManager.saveBookingDtls(bookings);
			}
			if(saveflag) {
				movieList = new ArrayList<>();
				movieList = dashBoardServiceManager.getMovie();
				request.setAttribute("mvList", movieList);
				request.setAttribute("success", saveflag);
				request.setAttribute("bookMode", true);
			}

			sendTo = "//pages/HomePage.jsp";
			
		}catch(Exception ex) {
			ex.printStackTrace();
			System.err.println(" Failed ");
		}
		return sendTo;
	}
	
	
}
