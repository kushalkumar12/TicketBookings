package com.fit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.DAO;
import com.model.User;
import com.work.HibernateUtil;
@Controller
public class AddUserDetailsInDBController {
	@RequestMapping("/addUserDetails")
	public String connectDb(HttpServletResponse response, HttpServletRequest request) throws Exception {

		String forward = "//pages/AddUserForm.jsp";
		DAO dao = null;
		List roleList = null;

		String userFirstName = null;
		String userLastName = null;
		String userId = null;
		String userPassword = null;
		String address = null;
		String email = null;
		String phone = null;
		int roleSeqId = 0;
		String userSeqId = "0";

		String status = null;

		try {
			System.out.println("saving data started to fe_admin_user.");
		    userFirstName = request.getParameter("userFirstName");
		    userLastName = request.getParameter("userLastName");
		    userId = request.getParameter("userId");
		    userPassword = request.getParameter("userPassword");
		    address = request.getParameter("address");
		    email = request.getParameter("email");
		    phone = request.getParameter("phone");
		    roleSeqId = Integer.parseInt(request.getParameter("roleName"));

		    dao = new DAO(HibernateUtil.getSessionFactory());

		    System.out.println("All Parameters arrived successfully");

		    System.out.println("Creating sequence from Fe_admin_user table");
		    userSeqId = dao.getMaxUserSeqId();
		    System.out.println("Created sequence from Fe_admin_user table i.e : " + userSeqId);

		    User user = new User();
//		    user.setUserSeqId(Integer.parseInt(userSeqId)+1);
//		    user.setUserFirstName(userFirstName);
//		    user.setUserLastName(userLastName);
//		    user.setUserId(userId);
//		    user.setUserPassword(userPassword);
//		    user.setAddress(address);
//		    user.setEmail(email);
//		    user.setPhone(phone);
//		    user.setRoleSeqId(roleSeqId);
//		    user.setCreatedBy("AdminUser");
//		    user.setCreatedOn(new Date());
//		    user.setModifiedBy("AdminUser");
//		    user.setModifiedOn(new Date());

		    System.out.println("Started saving in DB table fe_admin_user");
		    status = dao.saveUserData(user);
			System.out.print("User data saving status "+status);

			if(status == "success") {
				forward = "/connectDb.o";
			}
		}catch(Exception e ) {
			e.printStackTrace();
			throw e;
		}
		return forward;
	}
}
