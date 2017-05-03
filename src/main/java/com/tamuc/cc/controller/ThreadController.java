/**
 * 
 */
package com.tamuc.cc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tamuc.cc.bean.ThreadBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;
import com.tamuc.cc.constants.URLConstants;
import com.tamuc.cc.constants.ViewConstants;
import com.tamuc.cc.service.DiscussionService;
import com.tamuc.cc.service.ReferenceDataService;
import com.tamuc.cc.service.ThreadService;
import com.tamuc.cc.validator.ThreadValidator;

/**
 * @author TAMUCCampusConnect
 *
 */
@Controller
public class ThreadController extends AbstractController {

	@Autowired
	private ThreadService threadService;
	
	@Autowired
	private DiscussionService discussionService;

	/** The login validator. */
	@Autowired
	private ThreadValidator threadValidator;

	/**
	 * Init binder.
	 *
	 * @param binder
	 *            the binder
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(threadValidator);
	}

	/**
	 * Display add Thead.
	 *
	 * @param request the request
	 * @param response the response
	 * @param userBean the user bean
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_ADD_THREAD, method = RequestMethod.GET)
	public String displayAddThread(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute(value = GlobalConstants.THREAD_BEAN) ThreadBean threadBean) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		return ViewConstants.VIEW_ADD_THREAD;
	}
	  
	@RequestMapping(value = URLConstants.URL_ADD_THREAD, method = RequestMethod.POST)
	public String processAddThread(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.THREAD_BEAN) ThreadBean threadBean, BindingResult results,
	        RedirectAttributes redirectAttributes, Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		threadBean.setStartedBy(loggedUser.getUserName());
		threadBean.setValidationType(GlobalConstants.VALIDATION_TYPE_INSERT);
		threadValidator.validate(threadBean, results);
		if (!results.hasErrors()) {
			ThreadBean bean = threadService.fetchThreadByName(threadBean.getTopic());
			if (bean == null) {
				// New Thread
				threadBean.setStatus(GlobalConstants.YES);
				boolean val = threadService.addThread(threadBean);
				if (val) {
					updateThreadMap(threadBean);
					model.addAttribute(GlobalConstants.SUCCESS_MESSAGE,
					        this.getMessageSource().getMessage(MessageConstants.SUCCESS_ADD_THREAD, null, null));
					model.addAttribute(GlobalConstants.THREAD_BEAN, new ThreadBean());
				} else {
					model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
					        this.getMessageSource().getMessage(MessageConstants.FAILURE_ADD_THREAD, null, null));
				}
			} else {
				model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
				        this.getMessageSource().getMessage(MessageConstants.EXISTING_THREAD, null, null));
			}
		}
		return ViewConstants.VIEW_ADD_THREAD;
	}

	
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
	@RequestMapping(value = URLConstants.URL_SEARCH_THREAD, method = RequestMethod.GET)
	public String displaySearch(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.THREAD_BEAN) ThreadBean threadBean) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		request.getSession().removeAttribute(GlobalConstants.SESSION_SEARCH_THREAD_LIST);
		return ViewConstants.VIEW_SEARCH_THREAD;
	}

	
	/**
	 * Process search.
	 *
	 * @param request
	 *            the request
	 * @param response
	 *            the response
	 * @param userBean
	 *            the user bean
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_SEARCH_THREAD, method = RequestMethod.POST)
	public String processSearch(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.THREAD_BEAN) ThreadBean threadBean,
	        RedirectAttributes redirectAttributes, Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_HOME_PAGE;
		}
		if (request.getSession().getAttribute(GlobalConstants.SESSION_SEARCH_THREAD_LIST) != null) {
			request.getSession().removeAttribute(GlobalConstants.SESSION_SEARCH_THREAD_LIST);
		}
		List<ThreadBean> threadBeanLst = threadService.searchThread(threadBean);
		if (threadBeanLst == null || threadBeanLst.isEmpty()) {
			model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
			        this.getMessageSource().getMessage(MessageConstants.SEARCH_FAILURE, null, null));
		} else {
			request.getSession().setAttribute(GlobalConstants.SESSION_SEARCH_THREAD_LIST, threadBeanLst);
		}
		return ViewConstants.VIEW_SEARCH_THREAD;
	}	
	
	
	/**
	 * Process edit.
	 *
	 * @param editUsername
	 *            the edit username
	 * @param request
	 *            the request
	 * @param response
	 *            the response
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @param userBean
	 *            the user bean
	 * @param model
	 *            the model
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_EDIT_THREAD + "/{threadId}", method = RequestMethod.GET)
	public String displayEditThread(@PathVariable("threadId") int threadId, HttpServletRequest request,
	        HttpServletResponse response, RedirectAttributes redirectAttributes,
	        @ModelAttribute(value = GlobalConstants.THREAD_BEAN) ThreadBean threadBean, Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		threadBean = threadService.fetchThreadById(threadId);
		model.addAttribute(GlobalConstants.THREAD_BEAN, threadBean);
		return ViewConstants.VIEW_EDIT_THREAD;
	}
	
	/**
	 * Process edit.
	 *
	 * @param request
	 *            the request
	 * @param response
	 *            the response
	 * @param userBean
	 *            the user bean
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @param results
	 *            the results
	 * @param model
	 *            the model
	 * @return the string
	 */
	@RequestMapping(value = URLConstants.URL_EDIT_THREAD_SAVE, method = RequestMethod.POST)
	public String processEditThread(HttpServletRequest request, HttpServletResponse response,
	       @ModelAttribute(value = GlobalConstants.THREAD_BEAN) ThreadBean threadBean,
	        RedirectAttributes redirectAttributes, BindingResult results, Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}

		threadBean.setValidationType(GlobalConstants.VALIDATION_TYPE_UPDATE);
		threadValidator.validate(threadBean, results);
		if(!results.hasErrors()) {
			boolean isUpdated = threadService.updateThread(threadBean);
			if (isUpdated) {
				updateThreadMap(threadBean);
				model.addAttribute(GlobalConstants.SUCCESS_MESSAGE,
				        this.getMessageSource().getMessage(MessageConstants.EDIT_SUCCESS, null, null));
			} else {
				model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
				        this.getMessageSource().getMessage(MessageConstants.EDIT_FAILURE, null, null));
			}
		}
		
		return ViewConstants.VIEW_EDIT_THREAD;
	}
	
	@RequestMapping(value = URLConstants.URL_EDIT_THREAD, method = RequestMethod.POST)
	public ModelAndView processEditThread(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.THREAD_BEAN) ThreadBean threadBean, BindingResult results,
	        RedirectAttributes redirectAttributes) {

		return null;
	}

	@RequestMapping(value = URLConstants.URL_DELETE_THREAD, method = RequestMethod.POST)
	public ModelAndView processDeleteThread(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.THREAD_BEAN) ThreadBean threadBean, BindingResult results,
	        RedirectAttributes redirectAttributes) {
		return null;
	}
	
	private void updateThreadMap(ThreadBean threadBean) {
		Map<String, ThreadBean> threadMap = ReferenceDataService.getThreadMap();
		threadMap.put(threadBean.getCategoryCd(), threadBean);
        ReferenceDataService.setThreadMap(threadMap);
	}
	
}
