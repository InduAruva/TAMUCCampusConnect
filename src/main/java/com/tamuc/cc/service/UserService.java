package com.tamuc.cc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tamuc.cc.bean.LoginBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.dao.UserDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class UserService.
 *
 * @author TAMUCCampusConnect
 */

@Service("userService")
public class UserService {

	/** The user dao. */
	@Autowired
	private UserDAO userDAO;

	/**
	 * This method will add the user details in the database.
	 *
	 * @param userBean
	 *            the user bean
	 * @return true, if successful
	 */
	public boolean addUser(UserBean userBean) {
		return userDAO.addUser(userBean);
	}

	/**
	 * Update user.
	 *
	 * @param userBean
	 *            the user bean
	 * @return true, if successful
	 */
	public boolean updateUser(UserBean userBean) {
		return userDAO.updateUser(userBean);
	}

	/**
	 * This method will update the password and security question details for
	 * the first time login.
	 *
	 * @param userBean
	 *            the user bean
	 * @return true, if successful
	 */
	public boolean updatePasswordAndSecQuestionDetails(UserBean userBean) {
		return userDAO.updatePasswordAndSecQuestionDetails(userBean);
	}

	/**
	 * This method will update the password details for the specified user.
	 *
	 * @param userBean the user bean
	 * @return true, if successful
	 */
	public boolean updatePassword(UserBean userBean) {
		return userDAO.updatePassword(userBean);
	}

	/**
	 * This method will validate login details for the specified user.
	 *
	 * @param userBean the user bean
	 * @return the user model
	 */
	public UserBean fetchUserByUsername(String userName) {
		return userDAO.fetchUserByUsername(userName);
	}
	

	/**
	 * Fetch users.
	 *
	 * @param userBean
	 *            the user bean
	 * @return the list
	 */
	public List<UserBean> fetchUsers(UserBean userBean) {
		return userDAO.fetchUsers(userBean);
	}



	/**
	 * This method will return name of the users based on the user Key.
	 *
	 * @param userNames the user names
	 * @return the list
	 */
	public List<UserBean> fetchNameByUserName(String userNames) {
		return userDAO.fetchNameByUserName(userNames);
	}
	
	/**
	 * Validate the login
	 * 
	 * @param loginBean
	 * @return
	 */
	public UserBean validateLogin(LoginBean loginBean) {
		return userDAO.validateLogin(loginBean.getEmailId(), loginBean.getPassword());
	}
	
	/**
	 * Fetch user by email id
	 * 
	 * @param bean
	 * @return
	 */
	public UserBean fetchUserByEmailId(String emailId) {
		return userDAO.fetchUserByEmailId(emailId);
	}

}
