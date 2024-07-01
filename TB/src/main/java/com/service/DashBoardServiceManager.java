package com.service;

import java.util.List;

import com.model.Bookings;
import com.model.Show;

public interface DashBoardServiceManager {
	public boolean saveLocation(String location)throws Exception;
	public boolean saveTheathre(String theatre, String location)throws Exception;
	
	public boolean saveMovie(Show show)throws Exception;
	
	public List<String> getLocation()throws Exception;
	public List<String> getLocation(String movieName)throws Exception;
	public List<String> getThreatre(String location)throws Exception;
	public List<String> getMovie()throws Exception;
	
	public boolean saveBookingDtls(Bookings bookings) throws Exception;
	public List<Object> getBookingList() throws Exception;
}
