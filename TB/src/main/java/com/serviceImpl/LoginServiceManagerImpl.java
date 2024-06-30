package com.serviceImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.dao.LoginDao;
import com.service.LoginServiceManager;
import com.work.DaoFactory;
import com.work.HibernateUtil;

public class LoginServiceManagerImpl implements LoginServiceManager{

	@Override
	public String checkMail(String email) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkUser(String userName) throws Exception {
		Session session = null;
		LoginDao loginDao = null;
		int count = 0;
		try{
			System.out.println("Entered service layer...............Entered......................&&%%");
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			System.out.println("Entered service layer..........session..............&&%%");
			session = sessionFactory.openSession();
			loginDao = DaoFactory.getLoginDao(session);
			System.out.println("Entered service layer..............loginDao.............&&%%");
			count = loginDao.checkUser(userName);
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
		return count;

	}

	@Override
	public String checkPassword(String password) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getNewDetails() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getRoles() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean saveUser() throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Object> login(String phone, String password) throws Exception {
		Session session = null;
		LoginDao loginDao = null;
		String result = null;
		List<Object> loginResult = null;

		try{
			System.out.println("Entered service layer...............Entered......................&&%%");
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			System.out.println("Entered service layer..........session..............&&%%");
			session = sessionFactory.openSession();
			loginDao = DaoFactory.getLoginDao(session);
			System.out.println("Entered service layer..............loginDao.............&&%%");
			loginResult = loginDao.login(phone, password);
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
		return loginResult;
	}

}
