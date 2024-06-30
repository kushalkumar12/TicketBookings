package com.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.dao.DashBoardDao;
import com.dao.LoginDao;
import com.model.Show;
import com.service.DashBoardServiceManager;
import com.work.DaoFactory;
import com.work.HibernateUtil;

public class DashBoardServiceManagerImpl implements DashBoardServiceManager{

	@Override
	public boolean saveLocation(String location) throws Exception {
		Session session = null;
		DashBoardDao dashBoardDao = null;
		boolean saveFlag = false;
		try{
			System.out.println("Entered service layer...............Entered......................&&%%");
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			System.out.println("Entered service layer..........session..............&&%%");
			session = sessionFactory.openSession();
			dashBoardDao = DaoFactory.getDashBoardDao(session);
			saveFlag = dashBoardDao.saveLocation(location);
			System.out.println("Entered service layer..............loginDao.............&&%%");
			System.out.println("Entered service layer...............Count.............&&%%");
		}catch(Exception ex) {
			ex.printStackTrace();
			throw ex;
		} finally {
            if (session != null) {
                session.close();
            }
        }
		System.out.println("return from here .............****&*&*&");
		return saveFlag;
	}

	@Override
	public boolean saveTheathre(String theatre, String location) throws Exception {
		Session session = null;
		DashBoardDao dashBoardDao = null;
		boolean saveFlag = false;
		try{
			System.out.println("Entered service layer...............Entered......................&&%%");
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			System.out.println("Entered service layer..........session..............&&%%");
			session = sessionFactory.openSession();
			dashBoardDao = DaoFactory.getDashBoardDao(session);
			saveFlag = dashBoardDao.saveTheathre(theatre,location);
			System.out.println("Entered service layer..............loginDao.............&&%%");
			System.out.println("Entered service layer...............Count.............&&%%");
		}catch(Exception ex) {
			ex.printStackTrace();
			throw ex;
		} finally {
            if (session != null) {
                session.close();
            }
        }
		System.out.println("return from here .............****&*&*&");
		return saveFlag;
	}

	@Override
	public List<String> getLocation() throws Exception {
		Session session = null;
		DashBoardDao dashBoardDao = null;
		List<String> locList = null;
		try{
			System.out.println("Entered service layer...............Entered......................&&%%");
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			System.out.println("Entered service layer..........session..............&&%%");
			session = sessionFactory.openSession();
			dashBoardDao = DaoFactory.getDashBoardDao(session);
			locList = new ArrayList();
			locList = dashBoardDao.getLocation();
			System.out.println("Entered service layer..............loginDao.............&&%%");
			System.out.println("Entered service layer...............Count.............&&%%");
		}catch(Exception ex) {
			ex.printStackTrace();
			throw ex;
		} finally {
            if (session != null) {
                session.close();
            }
        }
		System.out.println("return from here .............****&*&*&");
		return locList;
	}

	@Override
	public List<String> getThreatre(String location) throws Exception {
		Session session = null;
		DashBoardDao dashBoardDao = null;
		List<String> locList = null;
		try{
			System.out.println("Entered service layer...............Entered......................&&%%");
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			System.out.println("Entered service layer..........session..............&&%%");
			session = sessionFactory.openSession();
			dashBoardDao = DaoFactory.getDashBoardDao(session);
			locList = new ArrayList();
			locList = dashBoardDao.getTheatre(location);
			System.out.println("Entered service layer..............loginDao.............&&%%");
			System.out.println("Entered service layer...............Count.............&&%%");
		}catch(Exception ex) {
			ex.printStackTrace();
			throw ex;
		} finally {
            if (session != null) {
                session.close();
            }
        }
		System.out.println("return from here .............****&*&*&");
		return locList;
	}

	@Override
	public boolean saveMovie(Show show) throws Exception {
		Session session = null;
		DashBoardDao dashBoardDao = null;
		boolean saveFlag = false;
		try{
			System.out.println("Entered service layer...............Entered......................&&%%");
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			System.out.println("Entered service layer..........session..............&&%%");
			session = sessionFactory.openSession();
			dashBoardDao = DaoFactory.getDashBoardDao(session);
			saveFlag = dashBoardDao.saveMovie(show);
			System.out.println("Entered service layer..............loginDao.............&&%%");
			System.out.println("Entered service layer...............Count.............&&%%");
		}catch(Exception ex) {
			ex.printStackTrace();
			throw ex;
		} finally {
            if (session != null) {
                session.close();
            }
        }
		System.out.println("return from here .............****&*&*&");
		return saveFlag;
	}

	@Override
	public List<String> getMovie() throws Exception {
		Session session = null;
		DashBoardDao dashBoardDao = null;
		List<String> locList = null;
		try{
			System.out.println("Entered service layer...............Entered......................&&%%");
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			System.out.println("Entered service layer..........session..............&&%%");
			session = sessionFactory.openSession();
			dashBoardDao = DaoFactory.getDashBoardDao(session);
			locList = new ArrayList();
			locList = dashBoardDao.getMovie();
			System.out.println("Entered service layer..............loginDao.............&&%%");
			System.out.println("Entered service layer...............Count.............&&%%");
		}catch(Exception ex) {
			ex.printStackTrace();
			throw ex;
		} finally {
            if (session != null) {
                session.close();
            }
        }
		System.out.println("return from here .............****&*&*&");
		return locList;
	}

	@Override
	public List<String> getLocation(String movieName) throws Exception {
		Session session = null;
		DashBoardDao dashBoardDao = null;
		List<String> locList = null;
		try{
			System.out.println("Entered service layer...............Entered......................&&%%");
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			System.out.println("Entered service layer..........session..............&&%%");
			session = sessionFactory.openSession();
			dashBoardDao = DaoFactory.getDashBoardDao(session);
			locList = new ArrayList();
			locList = dashBoardDao.getLocation(movieName);
			System.out.println("Entered service layer..............loginDao.............&&%%");
			System.out.println("Entered service layer...............Count.............&&%%");
		}catch(Exception ex) {
			ex.printStackTrace();
			throw ex;
		} finally {
            if (session != null) {
                session.close();
            }
        }
		System.out.println("return from here .............****&*&*&");
		return locList;
	}

	
}
