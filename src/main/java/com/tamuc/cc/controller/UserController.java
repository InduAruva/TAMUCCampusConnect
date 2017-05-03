package com.tamuc.cc.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.xmlbeans.impl.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tamuc.cc.bean.LoginBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;
import com.tamuc.cc.constants.URLConstants;
import com.tamuc.cc.constants.ViewConstants;
import com.tamuc.cc.service.ReferenceDataService;
import com.tamuc.cc.service.UserService;
import com.tamuc.cc.validator.UserValidator;

/**
 * The Class UserController.
 *
 * @author TAMUCCampusConnect
 */
@Controller("userController")
public class UserController extends AbstractController {

	/** The user delegate. */
	@Autowired
	private UserService userService;
	
	/** The user validator. */
	@Autowired
	private UserValidator userValidator;
	
	/**
	 * Display home.
	 *
	 * @param request the request
	 * @param response the response
	 * @param userBean the user bean
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_HOME_PAGE, method = RequestMethod.GET)
	public String displayHome(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.USER_BEAN) UserBean userBean,
	        Model model) {
	    UserBean loggedUser = getLoggedUser(request);
	    if (loggedUser == null) {
	    	return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
	    }
	    return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_USER_HOME_PAGE;
	}

	/**
	 * Display add user page.
	 *
	 * @param request
	 *            the request
	 * @param response
	 *            the response
	 * @param userBean
	 *            the user bean
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_ADD_USER, method = RequestMethod.GET)
	public String displayAddUser(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.USER_BEAN) UserBean userBean) {
		return null;
	}

	/**
	 * Process add user page.
	 *
	 * @param request            the request
	 * @param response            the response
	 * @param userBean            the user bean
	 * @param results            the results
	 * @param redirectAttributes            the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_ADD_USER, method = RequestMethod.POST)
	public String processAddUser(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.USER_BEAN) UserBean userBean, BindingResult results,
	        RedirectAttributes redirectAttributes, Model model) {
		
		/*UserBean loggedUser = getLoggedUser(request);
	    if (loggedUser == null) {
	    	return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
	    }*/
	    
		userBean.setValidationType(GlobalConstants.VALIDATION_TYPE_INSERT);
		userValidator.validate(userBean, results);
		if (!results.hasErrors()) {
			UserBean bean = userService.fetchUserByEmailId(userBean.getEmailId());
			if (bean == null) {
				// New user
				boolean val = userService.addUser(userBean);
				if (val) {
					updateUserMap(userBean);
					model.addAttribute(GlobalConstants.SUCCESS_MESSAGE, this.getMessageSource()
					        .getMessage(MessageConstants.ADD_USER_SUCCESS, null, null));
				} else {
					// ADD_USER_FAILURE
					model.addAttribute(GlobalConstants.FAILURE_MESSAGE, this.getMessageSource()
					        .getMessage(MessageConstants.ADD_USER_FAILURE, null, null));
				}
			} else {
				// existing user
				model.addAttribute(GlobalConstants.FAILURE_MESSAGE, this.getMessageSource()
				        .getMessage(MessageConstants.FAILURE_USER, null, null));
			}
		}
		model.addAttribute(GlobalConstants.USER_BEAN, userBean);
		model.addAttribute(GlobalConstants.LOGIN_BEAN, new LoginBean());
		model.addAttribute(GlobalConstants.NAV_FROM, GlobalConstants.NAV_FROM_REGISTER_USER);
		return ViewConstants.VIEW_HOME_PAGE;
	}

	/**
	 * Process delete user.
	 *
	 * @param delUsername
	 *            the del username
	 * @param request
	 *            the request
	 * @param response
	 *            the response
	 * @param userBean
	 *            the user bean
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @param model
	 *            the model
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_DELETE_USER + "/{username}", method = RequestMethod.GET)
	public String processDeleteUser(@PathVariable("username") String delUsername, HttpServletRequest request,
	        HttpServletResponse response, @ModelAttribute(value = GlobalConstants.USER_BEAN) UserBean userBean,
	        RedirectAttributes redirectAttributes, Model model) {
		return null;}

	/**
	 * Display search.
	 *
	 * @param request
	 *            the request
	 * @param response
	 *            the response
	 * @param userBean
	 *            the user bean
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_SEARCH_USER, method = RequestMethod.GET)
	public String displaySearch(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.USER_BEAN) UserBean userBean) {
		return null;}

	/**
	 * Process search.
	 *
	 * @param request            the request
	 * @param response            the response
	 * @param userBean            the user bean
	 * @param redirectAttributes            the redirect attributes
	 * @param model the model
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_SEARCH_USER, method = RequestMethod.POST)
	public String processSearch(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.USER_BEAN) UserBean userBean,
	        RedirectAttributes redirectAttributes, Model model) {
		return null;
	}
	
	@RequestMapping(value = URLConstants.URL_PROFILE, method = RequestMethod.GET)
    public String displayProfile(HttpServletRequest request, HttpServletResponse response,
            @ModelAttribute(value = GlobalConstants.USER_BEAN) UserBean userBean,Model model) {
	  UserBean loggedUser = getLoggedUser(request);
      
      if (loggedUser == null) {
          return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_HOME_PAGE;
      }
        userBean = loggedUser;        		
        model.addAttribute(GlobalConstants.USER_BEAN,userBean);
        return ViewConstants.VIEW_PROFILE;
    }
	
	@RequestMapping(value = URLConstants.URL_UPLOAD_PROFILE_IMAGE, method = RequestMethod.POST)
	public String processUploadProfile(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("uploadImage") MultipartFile file,
			@ModelAttribute(value = GlobalConstants.USER_BEAN) UserBean userBean,Model model,
			BindingResult bindingResult) throws IOException {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_HOME_PAGE;
		}
		if ( file != null ){
			if (!file.getContentType().equals("image/jpeg") 		
					&& !file.getContentType().equals("image/gif")
					&& !file.getContentType().equals("image/x-png")
					&& !file.getContentType().equals("image/jpg")) {
				model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
						this.getMessageSource().getMessage(MessageConstants.INVALID_IMAGE_FORMAT, null, null));
			}
			else{
					byte[] imageByte = file.getBytes();
					userBean.setProfilePic(imageByte);
					 byte[] encodedImage = Base64.encode(userBean.getProfilePic());
				      String encodedString = new String(encodedImage);
				      userBean.setEncodedProfilePic(encodedString);
				
			}
		}

		model.addAttribute(GlobalConstants.USER_BEAN,userBean);
		return ViewConstants.VIEW_PROFILE;
	}
     

	
	/**
	 * This method will update the profile.
	 * @param request
	 * @param response
	 * @param userBean
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = URLConstants.URL_PROFILE, method = RequestMethod.POST)
	public String processUpdateProfile(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("uploadImage") MultipartFile file,
			@ModelAttribute(value = GlobalConstants.USER_BEAN) UserBean userBean,Model model,
			BindingResult bindingResult) throws IOException {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_HOME_PAGE;
		}
		
		userBean.setValidationType(GlobalConstants.VALIDATION_TYPE_UPDATE);
		userValidator.validate(userBean, bindingResult);
		if (!bindingResult.hasErrors()) {
			if ( file != null && file.getSize() != 0 && (!file.getContentType().equals("image/jpeg") 
					&& !file.getContentType().equals("image/gif")
					&& !file.getContentType().equals("image/x-png"))) {
				model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
						this.getMessageSource().getMessage(MessageConstants.INVALID_IMAGE_FORMAT, null, null));
			} else {
				if(file != null && file.getSize() > 0) {
					//Profile Image needs to be changed
						//(userBean.getProfilePic() == null || userBean.getProfilePic().length == 0)&& loggedUser.getProfilePic() != null) {
					byte[] imageByte = file.getBytes();
					userBean.setProfilePic(imageByte);
					byte[] encodedImage = Base64.encode(userBean.getProfilePic());
					userBean.setEncodedProfilePic(new String(encodedImage));
				} else {
					//Profile Pic does not needs to be updated
					if(loggedUser.getProfilePic() != null && loggedUser.getProfilePic().length > 0) {
						userBean.setProfilePic(loggedUser.getProfilePic());
						userBean.setEncodedProfilePic(loggedUser.getEncodedProfilePic());
					}
				}
				if(userBean.getPassword() == null || userBean.getPassword().length == 0) {
					userBean.setPassword(loggedUser.getPassword());
				}
				
				boolean isUpdated = userService.updateUser(userBean);
				if (isUpdated) {
					/*if(userBean.getProfilePic() != null && userBean.getProfilePic().length > 0) {
						byte[] encodedImage = Base64.encode(userBean.getProfilePic());
						userBean.setEncodedProfilePic(new String(encodedImage));
					}*/
					updateUserMap(userBean);
					request.getSession().setAttribute(GlobalConstants.LOGGED_USER, userBean);
					model.addAttribute(GlobalConstants.SUCCESS_MESSAGE,
							this.getMessageSource().getMessage(MessageConstants.UPDATE_PROFILE_SUCCESS, null, null));
				} else {
					model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
							this.getMessageSource().getMessage(MessageConstants.UPDATE_PROFILE_FAILURE, null, null));
				} 
			}
		} else {
			//Error occured. Retain the image
			if(loggedUser.getProfilePic() != null && loggedUser.getProfilePic().length > 0) {
				userBean.setProfilePic(loggedUser.getProfilePic());
				userBean.setEncodedProfilePic(loggedUser.getEncodedProfilePic());
			}
			
		}
		model.addAttribute(GlobalConstants.USER_BEAN,userBean);
		return ViewConstants.VIEW_PROFILE;
	}
	
	private void updateUserMap(UserBean userBean) {
		Map<String, UserBean> userMap = ReferenceDataService.getUserMap();
		userMap.put(userBean.getUserName(), userBean);
        ReferenceDataService.setUserMap(userMap);
	}
	

}
