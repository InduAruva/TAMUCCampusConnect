package com.tamuc.cc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.xmlbeans.impl.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tamuc.cc.bean.LoginBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;
import com.tamuc.cc.constants.URLConstants;
import com.tamuc.cc.constants.ViewConstants;
import com.tamuc.cc.service.UserService;
import com.tamuc.cc.validator.LoginValidator;

/**
 * The Class LoginController.
 *
 * @author TAMUCCampusConnect
 */
@Controller("loginController")
public class LoginController extends AbstractController {
  /** The login delegate. */
  @Autowired
  private UserService userService;

  /** The login validator. */
  @Autowired
  private LoginValidator loginValidator;

  /**
   * Init binder.
   *
   * @param binder the binder
   */
/*  @InitBinder
  protected void initBinder(WebDataBinder binder) {
    binder.setValidator(loginValidator);
  }*/

  /**
   * Display login page.
   *
   * @param request the request
   * @param response the response
   * @param loginBean the login bean
   * @return the string
   */
  @RequestMapping(value = URLConstants.URL_LOGIN, method = RequestMethod.GET)
  public String displayLogin(HttpServletRequest request, HttpServletResponse response,
      @ModelAttribute(value = GlobalConstants.LOGIN_BEAN) LoginBean loginBean, Model model) {
    UserBean loggedUser = getLoggedUser(request);
    if (loggedUser != null) {
      // return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_HOME_PAGE;
    }
    model.addAttribute(GlobalConstants.USER_BEAN,new UserBean());
    return ViewConstants.VIEW_HOME_PAGE;
  }

  /**
   * Display login page.
   *
   * @param request the request
   * @param response the response
   * @param loginBean the login bean
   * @return the string
   */
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String displayLoginPage(HttpServletRequest request, HttpServletResponse response,
      @ModelAttribute(value = GlobalConstants.LOGIN_BEAN) LoginBean loginBean,Model model) {
    UserBean loggedUser = getLoggedUser(request);
    if (loggedUser != null) {
    	return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_USER_HOME_PAGE;
    }
    removeSessionDetails(request);
    model.addAttribute(GlobalConstants.USER_BEAN, new UserBean());
    return ViewConstants.VIEW_HOME_PAGE;
  }

  /**
   * Validate login and redirect the user to home page.
   *
   * @param request the request
   * @param response the response
   * @param loginBean the login bean
   * @param bindingResults the binding results
   * @param redirectAttributes the redirect attributes
   * @return the string
   */
  @RequestMapping(value = URLConstants.URL_LOGIN, method = RequestMethod.POST)
  public String processLogin(HttpServletRequest request, HttpServletResponse response,
      @ModelAttribute(value = GlobalConstants.LOGIN_BEAN) LoginBean loginBean,
      BindingResult bindingResults, RedirectAttributes redirectAttributes,
      Model model) {
	  
	  loginBean.setValidationType(GlobalConstants.VALIDATION_TYPE_LOGIN);
	  loginValidator.validate(loginBean, bindingResults);
		if (!bindingResults.hasErrors()) {
			UserBean userBean = userService.validateLogin(loginBean);
			if(userBean != null) {
				//Login success
				if(userBean.getProfilePic() != null && userBean.getProfilePic().length > 0) {
					byte[] encodedImage = Base64.encode(userBean.getProfilePic());
				     userBean.setEncodedProfilePic(new String(encodedImage));
				}
				request.getSession().setAttribute(GlobalConstants.LOGGED_USER, userBean);
				//redirectAttributes.addFlashAttribute(GlobalConstants., arg1)
				return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_HOME_PAGE;
			}
			else {
				//Failure
				model.addAttribute(GlobalConstants.FAILURE_MESSAGE, this.getMessageSource()
				        .getMessage(MessageConstants.LOGIN_FAILURE, null, null));
			}
		} 
		model.addAttribute(GlobalConstants.USER_BEAN, new UserBean());
		model.addAttribute(GlobalConstants.NAV_FROM, GlobalConstants.NAV_FROM_LOGIN);
		return ViewConstants.VIEW_HOME_PAGE;
		
  }

  /**
   * Logout session.
   *
   * @param request the request
   * @param response the response
   * @param redirectAttributes the redirect attributes
   * @return the string
   */
  @RequestMapping(value = URLConstants.URL_LOGOUT, method = RequestMethod.GET)
  public String processLogoutSession(HttpServletRequest request, HttpServletResponse response,
      RedirectAttributes redirectAttributes) {
    UserBean loggedUser = getLoggedUser(request);
    if (loggedUser == null) {
      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
    }

    // invalidate session
    request.getSession().invalidate();
    redirectAttributes.addFlashAttribute(GlobalConstants.SUCCESS_MESSAGE, this.getMessageSource()
        .getMessage(MessageConstants.LOGOUT_SUCCESS, null, null));

    removeSessionDetails(request);
    return ViewConstants.VIEW_LOGOUT;
  }
  
  
/*  
  *//**
   * Display forgot password.
   *
   * @param request            the request
   * @param response            the response
   * @param userBean the user bean
   * @return the string
   *//*
  @RequestMapping(value = URLConstants.URL_FORGOT_PASSWORD, method = RequestMethod.GET)
  public String displayForgotPassword(HttpServletRequest request, HttpServletResponse response,
          @ModelAttribute(value = GlobalConstants.LOGIN_BEAN) LoginBean loginBean, Model model) {
      model.addAttribute(GlobalConstants.USER_BEAN,new UserBean());
      return ViewConstants.VIEW_HOME_PAGE;
  }*/

  /**
   * Process forgot password.
   *
   * @param request            the request
   * @param response            the response
   * @param userBean the user bean
   * @param redirectAttributes            the redirect attributes
   * @return the string
   */
  @RequestMapping(value = URLConstants.URL_FORGOT_PASSWORD, method = RequestMethod.POST)
  public String processForgotPassword(HttpServletRequest request, HttpServletResponse response,
           @ModelAttribute(value = GlobalConstants.LOGIN_BEAN) LoginBean loginBean, 
	        RedirectAttributes redirectAttributes, Model model, BindingResult bindingResults) {

		loginBean.setValidationType(GlobalConstants.VALIDATION_TYPE_PWD_RESET);
		loginValidator.validate(loginBean, bindingResults);
		if (!bindingResults.hasErrors()) {
			UserBean bean = userService.fetchUserByEmailId(loginBean.getEmailId());
			if(bean != null) {
				boolean val = validateSecurityDetails(bean, loginBean);
				if(val) {
					//Details are correct. Password needs to be reset.
					bean.setPassword(loginBean.getPassword());
					val = userService.updatePassword(bean);
					if(val) {
						//success
						model.addAttribute(GlobalConstants.SUCCESS_MESSAGE, this.getMessageSource()
						        .getMessage(MessageConstants.SUCCESS_PASSWORD_RESET, null, null));
					} else {
						//Failure
						model.addAttribute(GlobalConstants.FAILURE_MESSAGE, this.getMessageSource()
						        .getMessage(MessageConstants.FAILURE_PASSWORD_RESET, null, null));
					}
				} else {
					//Entered details do not match with exiting details
					model.addAttribute(GlobalConstants.FAILURE_MESSAGE, this.getMessageSource()
					        .getMessage(MessageConstants.INVALID_DETAILS, null, null));
				}
			} else {
				//Invalid user
				model.addAttribute(GlobalConstants.FAILURE_MESSAGE, this.getMessageSource()
				        .getMessage(MessageConstants.INVALID_USER, null, null));
			}
		}
		model.addAttribute(GlobalConstants.USER_BEAN, new UserBean());
		model.addAttribute(GlobalConstants.NAV_FROM, GlobalConstants.NAV_FROM_FORGOT_PASSWORD);
		return ViewConstants.VIEW_HOME_PAGE;
	}

	/**
	 * @param bean
	 * @param loginBean
	 */
	private boolean validateSecurityDetails(UserBean bean, LoginBean loginBean) {
		if (bean != null && loginBean != null) {
			if(bean.getSecurityQuestion() != null && bean.getSecurityQuestion().equalsIgnoreCase(
					loginBean.getSecurityQuestion()) && bean.getSecurityAnswer() != null && 
					bean.getSecurityAnswer().equalsIgnoreCase(loginBean.getSecurityAnswer())) {
				return true;
			}
		}
		return false;
	}
	
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public ModelAndView displayHome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("exception", ex);
		modelAndView.addObject("url", request.getRequestURL());
		modelAndView.setViewName("error");
		return modelAndView;
	}

}
