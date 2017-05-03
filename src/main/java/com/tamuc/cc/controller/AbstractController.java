/**
 * 
 */
package com.tamuc.cc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.utilities.LoggerInterface;
import com.tamuc.cc.utilities.MessageHelper;



// TODO: Auto-generated Javadoc
/**
 * This class will acts as Parent class for all the Controller classes and
 * provide interface for logging and reading data from properties files.
 *
 * @author FacultyEvaluationSystem
 */
public abstract class AbstractController implements LoggerInterface {

	/** The message source. */
	@Autowired
	private MessageSource messageSource;

	/** The message helper. */
	private MessageHelper messageHelper = new MessageHelper();

	/**
	 * Gets the message source.
	 *
	 * @return the messageSource
	 */
	public MessageSource getMessageSource() {
		return messageSource;
	}

	/**
	 * Sets the message source.
	 *
	 * @param messageSource
	 *            the messageSource to set
	 */
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

	/**
	 * Gets the message helper.
	 *
	 * @return the messageHelper
	 */
	public MessageHelper getMessageHelper() {
		return messageHelper;
	}

	/**
	 * Sets the message helper.
	 *
	 * @param messageHelper
	 *            the messageHelper to set
	 */
	public void setMessageHelper(MessageHelper messageHelper) {
		this.messageHelper = messageHelper;
	}

	/**
	 * Gets the logged user.
	 *
	 * @param request
	 *            the request
	 * @return the logged user
	 */
	public UserBean getLoggedUser(HttpServletRequest request) {
		if (request.getSession() != null) {
			if (request.getSession().getAttribute(GlobalConstants.LOGGED_USER) != null) {
				UserBean loggedUser = (UserBean) request.getSession().getAttribute(GlobalConstants.LOGGED_USER);
				return loggedUser;
			}
		}
		return null;
	}

	/**
	 * Handle exceptions.
	 *
	 * @param request
	 *            the request
	 * @param ex
	 *            the ex
	 * @return the model and view
	 */
	@ExceptionHandler({Exception.class,HttpRequestMethodNotSupportedException.class})
	public ModelAndView handleExceptions(HttpServletRequest request, Exception ex) {
		errorLogger.error("Requested URL=" + request.getRequestURL());
		errorLogger.error("EXCEPTION RAISED ::" + ex.getMessage());
		errorLogger.error("Please check sysout.log for more details...");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception", ex);
		modelAndView.addObject("url", request.getRequestURL());
		modelAndView.setViewName("error");
		/*
		 * Thread th =new Thread(){ public void run(){ logMail("abc"); } };
		 */
		// th.setDaemon(true);
		// th.start();
		return modelAndView;
	}

	
	/**
	 * Removes the session details.
	 *
	 * @param request the request
	 */
	public void removeSessionDetails(HttpServletRequest request) {
		
	}
}
