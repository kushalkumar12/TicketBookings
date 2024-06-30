package com.dao;

import java.util.List;

public interface LoginDao {
	public List<Object> login(String phone, String password)throws Exception;
	public String checkMail(String email) throws Exception;
	public int checkUser(String userName) throws Exception;
	public String checkPassword(String password) throws Exception;
	public List<Object> getNewDetails() throws Exception;
	public List<String> getRoles() throws Exception;
	public boolean saveUser() throws Exception;
}
