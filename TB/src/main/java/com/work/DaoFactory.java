package com.work;

import org.hibernate.Session;

import com.dao.DashBoardDao;
import com.dao.LoginDao;
import com.daoImpl.DashBoardDaoImpl;
import com.daoImpl.LoginDaoImpl;

public class DaoFactory {
	public static LoginDao getLoginDao(Session session) {
		return new LoginDaoImpl(session);
	}
	public static DashBoardDao getDashBoardDao(Session session) {
		return new DashBoardDaoImpl(session);
	}
}
