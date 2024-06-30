package com.dao;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.model.User;

public class DAO {
	private SessionFactory sessionFactory;

	public DAO(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public List getData() throws Exception{
		List list = null;
		Query query = null;
		Session session = null;
	   // Transaction transaction = null;

		try{
			//transaction = session.beginTransaction(); this is for update , insert, delete
			session = sessionFactory.openSession();
			StringBuilder builder = new StringBuilder(" select");
			builder.append(" aduser.user_first_name, aduser.user_last_name,");
			builder.append(" aduser.user_id, aduser.user_password, aduser.address,");
			builder.append(" aduser.email, aduser.phone, adrole.role_name, aduser.user_seq_id ");
			builder.append(" from");
			builder.append(" fe_roles_mstr adrole, fe_admin_user aduser");
			builder.append(" where");
			builder.append(" aduser.role_seq_id = adrole.role_seq_id order by aduser.user_seq_id asc");
			query = session.createSQLQuery(builder.toString());
			list = query.list();
			//transaction.commit();

		}catch(Exception e) {
//			if (transaction != null) {
//                transaction.rollback();
//            }
            e.printStackTrace();
            throw e;
        } finally {
            session.close();
        }
		return list;

	}

	public List getRoles() throws Exception{
		List list = null;
		Query query = null;
		Session session = null;
		try{
			session = sessionFactory.openSession();
			StringBuilder builder = new StringBuilder(" select");
			builder.append(" adrole.role_seq_id, adrole.role_name");
			builder.append(" from");
			builder.append(" fe_roles_mstr adrole order by adrole.role_seq_id asc ");
			query = session.createSQLQuery(builder.toString());
			list = query.list();
		}catch(Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            session.close();
        }
		return list;
	}

	public String saveUserData(User user) throws Exception {
	    Session session = null;
	    Transaction transaction = null;
	    SQLQuery query = null;

	    try {
	        session = sessionFactory.openSession();
	        transaction = session.beginTransaction();
	        StringBuilder builder = new StringBuilder("INSERT INTO fe_admin_user ");
	        builder.append("(USER_SEQ_ID, USER_FIRST_NAME, USER_LAST_NAME, USER_ID, USER_PASSWORD, ");
	        builder.append("ADDRESS, EMAIL, PHONE, ROLE_SEQ_ID, CREATED_BY, CREATED_ON, MODIFIED_BY, MODIFIED_ON) ");
	        builder.append("VALUES ");
	        builder.append("(:userSeqId, :userFirstName, :userLastName, :userId, :userPassword, :address, :email, ");
	        builder.append(":phone, :roleSeqId, :createdBy, :createdOn, :modifiedBy, :modifiedOn)");

//	        query = session.createSQLQuery(builder.toString());
//	        query.setParameter("userSeqId", user.getUserSeqId());
//	        query.setParameter("userFirstName", user.getUserFirstName());
//	        query.setParameter("userLastName", user.getUserLastName());
//	        query.setParameter("userId", user.getUserId());
//	        query.setParameter("userPassword", user.getUserPassword());
//	        query.setParameter("address", user.getAddress());
//	        query.setParameter("email", user.getEmail());
//	        query.setParameter("phone", user.getPhone());
//	        query.setParameter("roleSeqId", user.getRoleSeqId());
//	        query.setParameter("createdBy", user.getCreatedBy());
//	        query.setParameter("createdOn", user.getCreatedOn());
//	        query.setParameter("modifiedBy", user.getModifiedBy());
//	        query.setParameter("modifiedOn", user.getModifiedOn());
	        query.executeUpdate();

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	        throw e;
	    } finally {
	        session.close();
	    }
	    return "success";
	}

	public String getMaxUserSeqId() throws Exception{
		List <BigDecimal> list = null;
		Query query = null;
		Session session = null;
		String maxSeqId = null;
		try{
			session = sessionFactory.openSession();
			StringBuilder builder = new StringBuilder(" select");
			builder.append(" max(aduser.user_seq_id)");
			builder.append(" from");
			builder.append(" fe_admin_user aduser ");
			query = session.createSQLQuery(builder.toString());

			list = query.list();
	        if (list != null && !list.isEmpty()) {
	            BigDecimal maxSeqIdBigDecimal = list.get(0);
	            if (maxSeqIdBigDecimal != null) {
	                maxSeqId = maxSeqIdBigDecimal.toString(); // Convert BigDecimal to String
	            }
	        }

		}catch(Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            session.close();
        }
		return maxSeqId;
	}

}
