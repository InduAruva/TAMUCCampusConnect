package com.tamuc.cc.dao;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;

/**
 * This is DAO Layer for the User Views which will perform all the database
 * operation related to inserting, deleting, updating and retrieving information
 * related to User.
 * 
 * @author TAMUCCampusConnect
 *
 */

@Repository("userDAO")
public class UserDAO extends AbstractDAO {

	/**
	 * This method will add the user details in the database.
	 *
	 * @param userBean
	 *            the user bean
	 * @return true, if successful
	 */
	public boolean addUser(UserBean userBean) {
		userBean.setUserName(userBean.getEmailId().toUpperCase());
		StringBuilder query = new StringBuilder("INSERT INTO ")
		        .append(AbstractDAO.USER_TABLE)
		        .append("(USERNAME,PASSWORD,EMAIL_ID,SECURITY_QUESTION,SECURITY_ANSWER,ROLE_CD,"
		                + "REGISTRATION_DT, DEPARTMENT, PROFILE_PIC, FULL_NAME)").append(" VALUES ")
		        .append("(? ,? ,? ,? ,? ,? ,NOW(),?,?,?)");
		getJdbcTemplate().update(query.toString(), userBean.getUserName(), String.valueOf(userBean.getPassword()),
		        userBean.getEmailId(), userBean.getSecurityQuestion(), userBean.getSecurityAnswer(),
		        userBean.getRoleCd(), userBean.getDepartment(), userBean.getProfilePic(), userBean.getFullName());
		return true;
	}

	/**
	 * Update user.
	 *
	 * @param userBean
	 *            the user bean
	 * @return true, if successful
	 */
	public boolean updateUser(UserBean userBean) {
		StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.USER_TABLE)
		        .append(" SET FULL_NAME= ?, DEPARTMENT = ?, PROFILE_PIC = ?, SECURITY_QUESTION= ?, SECURITY_ANSWER= ?, PASSWORD = ?")
		        .append(" WHERE EMAIL_ID= ?");
		getJdbcTemplate().update(query.toString(), userBean.getFullName(), userBean.getDepartment(),
		        userBean.getProfilePic(), userBean.getSecurityQuestion(), userBean.getSecurityAnswer(),String.valueOf(userBean.getPassword()),
		        userBean.getEmailId());
		return true;
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
		StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.USER_TABLE)
		        .append(" SET PASSWORD =?,SECURITY_QUESTION=?,SECURITY_ANSWER=?").append(" WHERE USERNAME=?");
		getJdbcTemplate().update(query.toString(), String.valueOf(userBean.getPassword()),
		        userBean.getSecurityQuestion(), userBean.getSecurityAnswer(), userBean.getUserName());
		return true;
	}

	/**
	 * This method will update the password details for the specified user.
	 *
	 * @param password
	 *            the password
	 * @param username
	 *            the username
	 * @return true, if successful
	 */
	public boolean updatePassword(UserBean userBean) {
		StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.USER_TABLE).append(
		        " SET PASSWORD = ? WHERE USERNAME = ?");
		try {
			getJdbcTemplate().update(query.toString(), String.valueOf(userBean.getPassword()), userBean.getUserName());
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * This method will validate login details for the specified user.
	 *
	 * @param username
	 *            the username
	 * @return the user model
	 */
	public UserBean fetchUserByUsername(String username) {
		try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.USER_TABLE).append(
			        " WHERE USERNAME=? ");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { username },
			        new BeanPropertyRowMapper<UserBean>(UserBean.class));

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	/**
	 * This method will validate login details for the specified user.
	 * 
	 * @param emailId
	 * @return
	 */
	public UserBean fetchUserByEmailId(String emailId) {
		try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.USER_TABLE).append(
			        " WHERE EMAIL_ID=? ");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { emailId },
			        new BeanPropertyRowMapper<UserBean>(UserBean.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	/**
	 * This method will validate login details for the specified user.
	 *
	 * @param username
	 *            the username
	 * @return the user model
	 */
	public UserBean validateLogin(String emailId, char[] password) {
		try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.USER_TABLE).append(
			        " WHERE EMAIL_ID= ? AND PASSWORD = ? ");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { emailId, String.valueOf(password) },
			        new BeanPropertyRowMapper<UserBean>(UserBean.class));

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	/**
	 * Fetch users.
	 *
	 * @param userBean
	 *            the user bean
	 * @return the list
	 */
	public List<UserBean> fetchUsers(UserBean userBean) {
		List<UserBean> fetchedUserList = null;
		StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.USER_TABLE);
		StringBuilder whereClause = new StringBuilder("");
		if (userBean != null) {
			if (userBean.getUserName() != null && !userBean.getUserName().isEmpty()) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" USERNAME like '");
				whereClause.append(userBean.getUserName());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}
			
			if (userBean.getPassword() != null && !userBean.getPassword().toString().isEmpty()) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" PASSWORD = '");
				whereClause.append(String.valueOf(userBean.getPassword()));
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}

			if (userBean.getRoleCd() != null && !userBean.getRoleCd().isEmpty()
			        && !GlobalConstants.INVALID_ROLE.equalsIgnoreCase(userBean.getRoleCd())) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" ROLE_CD = '");
				whereClause.append(userBean.getRoleCd());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}

			if (userBean.getEmailId() != null && !userBean.getEmailId().isEmpty()) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" EMAIL_ID = '");
				whereClause.append(userBean.getEmailId());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}

			if (userBean.getDepartment() != null && !userBean.getDepartment().isEmpty()) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" DEPARTMENT = '");
				whereClause.append(userBean.getDepartment());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}

			if (userBean.getFullName() != null && !userBean.getFullName().isEmpty()) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" FULL_NAME = '");
				whereClause.append(userBean.getFullName());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}

		}

		if (whereClause.length() > 0) {
			query.append(GlobalConstants.SPACE_STRING).append(whereClause);
		}
		fetchedUserList = (List<UserBean>) getJdbcTemplate().query(query.toString(),
		        new BeanPropertyRowMapper<UserBean>(UserBean.class));

		return fetchedUserList;

	}

	/**
	 * Update name.
	 *
	 * @param userName
	 *            the user name
	 * @param name
	 *            the name
	 * @return true, if successful
	 */
	public boolean updateName(String userName, String name) {
		StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.USER_TABLE).append(
		        " SET FULL_NAME = ? WHERE USER_NAME = ?");
		try {
			getJdbcTemplate().update(query.toString(), name, userName);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * This method will return name of the users based on the user Key.
	 *
	 * @param userNames
	 *            the user names
	 * @return the list
	 */
	public List<UserBean> fetchNameByUserName(String userNames) {
		List<UserBean> fetchedUserList = null;
		StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.USER_TABLE)
		        .append(" WHERE USER_NAME IN (").append(userNames).append(")");

		fetchedUserList = (List<UserBean>) getJdbcTemplate().query(query.toString(),
		        new BeanPropertyRowMapper<UserBean>(UserBean.class));
		return fetchedUserList;
	}
	
	
}
