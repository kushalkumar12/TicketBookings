package com.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.dao.LoginDao;
import com.model.User;
import com.model.UserRole;

public class LoginDaoImpl implements LoginDao{

	private Session session = null;

	public LoginDaoImpl(Session session) {
		this.session = session;
	}

	@Override
	public String checkMail(String email) throws Exception {

		return null;
	}

	@Override
	public int checkUser(String userName) throws Exception {
		List<User> userList = null;
		Query <User> query = null;
		int usercount = 0;
		try{
			String sql = "SELECT * FROM USERS_DTLS WHERE PHONE=:userName";
			query = session.createSQLQuery(sql);
			query.setString("userName", userName);
			userList = query.list();
			usercount = userList != null && !userList.isEmpty() ? userList.size() : 0;
			System.out.println("COUNT OF USER :: "+ usercount);
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return usercount;
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
		List list = null;
		Query <UserRole> query = null;
		Session session = null;
		Transaction transaction = null;
		try{
			//session = sessionFactory.openSession();
		     transaction = session.beginTransaction();

		        String sql = "from UserRole";
		        query = session.createQuery(sql, UserRole.class);
		        list = query.list();

		        transaction.commit();
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}

		return null;
	}

	@Override
	public boolean saveUser() throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Object> login(String phone, String password) throws Exception {
		List<Object> userList = null;
		Query query = null;
		String result = null;
		int usercount = 0;
		try{
			String sql = "SELECT FIRST_NAME , LAST_NAME,ROLE_ID FROM USERS_DTLS WHERE PHONE=:phone AND PASSWORD=:password";
			query = session.createSQLQuery(sql);
			query.setString("phone", phone);
			query.setString("password", password);
			userList = query.list();
			System.out.println(userList.toString() + "-----------<<");
			System.out.println("DB login ended");
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return userList;
	}

}