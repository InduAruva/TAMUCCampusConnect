/**
 * 
 */
package com.tamuc.cc.constants;

/**
 * The Interface MessageConstants.
 *
 * @author FacultyEvaluationSystem
 */
public interface MessageConstants {

	/*-----Begin - Generic message CONSTANTS ----------- */
	/** The Constant DELETE_USER_FAILURE. */
	public static final String DELETE_FAILURE = "delete.failure";

	public static final String DELETE_INVALID = "delete.invalid";

	/** The Constant DELETE__SUCCESS. */
	public static final String DELETE_SUCCESS = "delete.success";

	/** The Constant SEARCH__FAILURE. */
	public static final String SEARCH_FAILURE = "search.failure";

	/** The Constant EDIT__SUCCESS. */
	public static final String EDIT_SUCCESS = "edit.success";

	/** The Constant EDIT__FAILURE. */
	public static final String EDIT_FAILURE = "edit.failure";

	public static final String DEFAULT_PASSWORD = "default.password";

	public static final String GENERIC_FAILURE = "Failure.generic";
	public static final String INVALID_USERNAME = "Invalid.username";

	/*-----End - Generic message CONSTANTS ----------- */

	/*-----Begin - LOGIN CONTROLLER CONSTANTS ---------- */
	/** The Constant LOGIN_FAILURE. */
	public static final String LOGIN_FAILURE = "login.failure";

	/** The Constant LOGOUT_SUCCESS. */
	public static final String LOGOUT_SUCCESS = "logout.success";

	/** The Constant PASSWORD_RESET_FAILURE. */
	public static final String PASSWORD_RESET_FAILURE = "passwordReset.failure";

	/** The Constant PASSWORD_RESET_SUCCESS. */
	public static final String PASSWORD_RESET_SUCCESS = "passwordReset.success";

	// Login
	public static final String NAME_REQUIRED = "NotEmpty.LoginBean.name";
	public static final String USERNAME_REQUIRED = "NotEmpty.LoginBean.username";
	public static final String PASSWORD_REQUIRED = "NotEmpty.LoginBean.password";
	public static final String CONFIRM_PASSWORD_REQUIRED = "NotEmpty.LoginBean.confirmPassword";
	public static final String PASSWORD_MISMATCH = "Mismatch.LoginBean.password";
	public static final String EMPTY_SEC_QUESTION = "NotEmpty.LoginBean.SecQuestion";
	public static final String EMPTY_SEC_ANSWER = "NotEmpty.LoginBean.SecAnswer";
	public static final String SUCCESS_PASSWORD_RESET = "Success.LoginBean.passwordReset";
	public static final String FAILURE_PASSWORD_RESET = "Failure.LoginBean.passwordReset";
	public static final String INVALID_USER = "Invalid.LoginBean.user";
	public static final String INVALID_DETAILS = "Invalid.LoginBean.details";

	public static final String ROLE_REQUIRED = "Invalid.userBean.role";

	/*-----End - LOGIN CONTROLLER CONSTANTS ---------- */

	/*----- USER CONTROLLER CONSTANTS ----------- */
	/** The Constant ADD_USER_FAILURE. */
	public static final String ADD_USER_FAILURE = "addUser.failure";
	public static final String ADD_USER_SUCCESS = "addUser.success";
	public static final String EMPTY_NAME = "NotEmpty.UserBean.name";
	public static final String EMPTY_EMAIL_ID = "NotEmpty.UserBean.emailId";
	public static final String EMPTY_DEPARTMENT = "NotEmpty.UserBean.department";
	public static final String EMPTY_PASSWORD = "NotEmpty.UserBean.password";
	public static final String EMPTY_CONFIRM_PASSWORD = "NotEmpty.UserBean.confirmPassword";
	public static final String INVALID_PASSWORD = "Invalid.UserBean.password";
	public static final String FAILURE_SEC_QUESTION = "Failure.UserBean.SecQuestion";
	public static final String EMPTY_USERNAME = "NotEmpty.UserBean.username";
	public static final String FAILURE_USER = "Failure.UserBean.user";
	public static final String INVALID_EMAIL_ID = "Pattern.userBean.email";
	public static final String UPDATE_PROFILE_SUCCESS = "update.success";
	public static final String UPDATE_PROFILE_FAILURE = "update.failure";
	public static final String INVALID_IMAGE_FORMAT = "invalid.image.format";
	public static final String INVALID_IMAGE_SIZE = "invalid.image.size";

	public static final String EMPTY_CATEGORY_NAME = "NotEmpty.CategoryBean.name";
	public static final String EMPTY_CATEGORY_DES = "NotEmpty.CategoryBean.description";
	public static final String EMPTY_CATEGORY_ACTIVE_SW = "NotEmpty.CategoryBean.activeSw";
	public static final String SUCCESS_ADD_CATEGORY = "Success.CategoryBean.addCategory";
	public static final String FAILURE_ADD_CATEGORY = "Failure.CategoryBean.addCategory";
	public static final String EXISTING_CATEGORY = "Existing.CategoryBean.category";
	
	public static final String EMPTY_THREAD_NAME = "NotEmpty.ThreadBean.name";
	public static final String EMPTY_THREAD_DES = "NotEmpty.ThreadBean.description";
	public static final String EMPTY_THREAD_ACTIVE_SW = "NotEmpty.ThreadBean.activeSw";
	public static final String SUCCESS_ADD_THREAD = "Success.ThreadBean.addThread";
	public static final String FAILURE_ADD_THREAD = "Failure.ThreadBean.addThread";
	public static final String EXISTING_THREAD = "Existing.ThreadBean.thread";

	public static final String EMPTY_DISCUSSION_TOPIC = "NotEmpty.DiscussionBean.topic";
	public static final String EMPTY_DISCUSSION_ACTIVE_SW = "NotEmpty.DiscussionBean.activeSw";
	public static final String SUCCESS_ADD_DISCUSSION = "Success.DiscussionBean.addDiscussion";
	public static final String FAILURE_ADD_DISCUSSION = "Failure.DiscussionBean.addDiscussion";
	public static final String EXISTING_DISCUSSION = "Existing.DiscussionBean.discussion";

}
