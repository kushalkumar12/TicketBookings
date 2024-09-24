package com.daoImpl;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.dao.DashBoardDao;
import com.model.Bookings;
import com.model.Location;
import com.model.Show;
import com.model.Theatre;
import com.model.User;

public class DashBoardDaoImpl implements DashBoardDao{
	private Session session = null;

	public DashBoardDaoImpl(Session session) {
		this.session = session;
	}

	@Override
	public boolean saveLocation(String location) throws Exception {
		boolean saveFlag = false;
		Transaction transaction = null;
		try{
			transaction = session.beginTransaction();
			 String sqlmax = "SELECT COALESCE(MAX(LOC_SEQ_ID), 0) FROM TB_LOCATION";
			 Query<BigDecimal> query = session.createSQLQuery(sqlmax);
			 BigDecimal maxSeqId = query.uniqueResult();
			 int seqId = maxSeqId.intValue() + 1;
			 long now = System.currentTimeMillis();
		        java.sql.Date currentDate = new java.sql.Date(now);
			 
			 Location newLocation = new Location();
	         newLocation.setLocSeqId(seqId);
	            newLocation.setLocationName(location);
	            newLocation.setCreatedBy("admin");
	            newLocation.setCreatedOn(new java.sql.Date(System.currentTimeMillis()));
	            newLocation.setModifiedBy("admin");
	            newLocation.setModifiedOn(new java.sql.Date(System.currentTimeMillis()));
	            session.save(newLocation);
	            transaction.commit();
	            saveFlag = true;
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return true;
	}

	@Override
	public boolean saveTheathre(String theatre, String location) throws Exception {
		boolean saveFlag = false;
		Transaction transaction = null;
		try{
			transaction = session.beginTransaction();
			 String sqlmax = "SELECT COALESCE(MAX(THEATRE_ID), 0) FROM THEATRE";
			 Query<BigDecimal> query = session.createSQLQuery(sqlmax);
			 BigDecimal maxSeqId = query.uniqueResult();
			 int seqId = maxSeqId.intValue() + 1;
			 long now = System.currentTimeMillis();
		        java.sql.Date currentDate = new java.sql.Date(now);
			 
			 Theatre theatres = new Theatre();
			 theatres.setTheatreId(seqId);
			 theatres.setTheatreName(theatre);
			 theatres.setLocationName(location);
			 theatres.setCreatedBy("admin");
			 theatres.setCreatedOn(new java.sql.Date(System.currentTimeMillis()));
			 theatres.setModifiedOn(new java.sql.Date(System.currentTimeMillis()));
			 theatres.setModifiedBy("admin");
	            session.save(theatres);
	            transaction.commit();
	            saveFlag = true;
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return true;
	}

	@Override
	public List<String> getLocation() throws Exception {
		List<String> location = null;
		Query query = null;
		try{
			location = new ArrayList<String>();
			 String sqlmax = "SELECT LOCATION_NAME FROM TB_LOCATION ORDER BY LOCATION_NAME ASC";
			 query = session.createSQLQuery(sqlmax);
			 location = query.list();
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return location;
	}

	@Override
	public List<String> getTheatre(String location) throws Exception {
		List<String> locations = null;
		Query query = null;
		try{
			locations = new ArrayList<String>();
			 String sqlmax = "SELECT THEATRE_NAME FROM THEATRE WHERE LOCATION_NAME=:loc ORDER BY THEATRE_NAME ASC";
			 query = session.createSQLQuery(sqlmax);
			 query.setString("loc", location);
			 locations = query.list();
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return locations;
	}

	@Override
	public boolean saveMovie(Show show) throws Exception {
		boolean saveFlag = false;
		Transaction transaction = null;
		try{
			transaction = session.beginTransaction();
			BigDecimal nextVal = (BigDecimal) session.createNativeQuery("SELECT show_id_seq.NEXTVAL FROM dual").uniqueResult();
			Long nextId = nextVal.longValue();
			 show.setCreatedBy("admin");
			 show.setCreatedOn(new java.sql.Date(System.currentTimeMillis()));
			 show.setModifiedOn(new java.sql.Date(System.currentTimeMillis()));
			 show.setModifiedBy("admin");
	         session.save(show);
	         transaction.commit();
	         saveFlag = true;
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return saveFlag;
	}

	@Override
	public List<String> getMovie() throws Exception {
		List<String> movies = null;
		Query query = null;
		try{
			movies = new ArrayList<String>();
			 String sqlmax = "SELECT MOVIE_NAME FROM TB_SHOWS ORDER BY SHOW_ID DESC";
			 query = session.createSQLQuery(sqlmax);
			 movies = query.list();
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return movies;
	}

	@Override
	public List<String> getLocation(String movieName) throws Exception {
		List<String> location = null;
		Query query = null;
		try{
			location = new ArrayList<String>();
			 String sqlmax = "SELECT TL.LOCATION_NAME FROM TB_SHOWS TS, TB_LOCATION TL WHERE TS.LOCATION_NAME = TL.LOCATION_NAME AND TS.MOVIE_NAME =:mvName ORDER BY LOCATION_NAME ASC";
			 query = session.createSQLQuery(sqlmax);
			 query.setString("mvName", movieName);
			 location = query.list();
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return location;
	}

	@Override
	public boolean saveBookings(Bookings bookings) throws Exception {
		boolean saveFlag = false;
		Transaction transaction = null;
		try{
			transaction = session.beginTransaction();
	        session.save(bookings);
	            transaction.commit();
	            saveFlag = true;
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return true;
	}

	@Override
	public List<Object> getBookingList() throws Exception {
		List<Object> bookingList = null;
		Query query = null;
		try{
			bookingList = new ArrayList();
			 String sqlmax = "SELECT BOOKING_ID,SHOW_NAME,THEATRE_NAME,LOCATION_NAME,STATUS,BOOKED_DATE,TICKET_RATE,SEAT_NO FROM BOOKINGS ORDER BY BOOKING_ID DESC";
			 query = session.createSQLQuery(sqlmax);
			 bookingList = query.list();
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return bookingList;
	}

	@Override
	public List<String> getBookedSeats(String location, String theatre, String movie) {
		List<String> bookedTickets = null;
		Query query = null;
		try{
			bookedTickets = new ArrayList();
			 String sqlmax = "SELECT SEAT_NO FROM BOOKINGS WHERE THEATRE_NAME =:theatre AND SHOW_NAME =:showName AND LOCATION_NAME =:location ";
			 query = session.createSQLQuery(sqlmax);
			 query.setString("location", location);
			 query.setString("theatre", theatre);
			 query.setString("showName", movie);
			 bookedTickets = query.list();
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return bookedTickets;
	}

}
