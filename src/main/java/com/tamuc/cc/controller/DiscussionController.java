package com.tamuc.cc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tamuc.cc.bean.DiscussionBean;
import com.tamuc.cc.bean.ThreadBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;
import com.tamuc.cc.constants.URLConstants;
import com.tamuc.cc.constants.ViewConstants;
import com.tamuc.cc.service.DiscussionService;
import com.tamuc.cc.service.ReferenceDataService;
import com.tamuc.cc.service.ThreadService;
import com.tamuc.cc.validator.DiscussionValidator;

/**
 * @author TAMUCCampusConnect
 *
 */
@Controller
public class DiscussionController extends AbstractController {

	@Autowired
	private DiscussionService discussionService;
	@Autowired
	private ThreadService threadService;
	@Autowired
	private DiscussionValidator discussionValidator;
	
	/**
	 * Init binder.
	 *
	 * @param binder
	 *            the binder
	 */
/*	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(discussionValidator);
	}*/

	/**
	 * Display Add Category
	 * 
	 * @param categoryCd
	 * @param threadId
	 * @param request
	 * @param response
	 * @param discussionBean
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = URLConstants.URL_ADD_DISCUSSION+ "/{categoryCd}"+ "/{threadId}",method = RequestMethod.GET)
	public String displayAddDiscussion(@PathVariable("categoryCd") String categoryCd,
			@PathVariable("threadId") int threadId,HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.DISCUSSION_BEAN) DiscussionBean discussionBean,Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		ThreadBean thread = threadService.fetchThreadById(threadId);
		model.addAttribute("THREAD",thread);
		model.addAttribute("CATEGORY", ReferenceDataService.getCategoryMap().get(categoryCd));
		if(model.asMap()!=null && model.asMap().get("RESULTS")!=null){
			BindingResult results = (BindingResult)model.asMap().get("RESULTS");
			model.addAttribute("org.springframework.validation.BindingResult.discussionBean", results);
		}
		
		model.addAttribute(GlobalConstants.DISCUSSION_BEAN,discussionBean);
		return ViewConstants.VIEW_ADD_DISCUSSION;
	}

	/**
	 * Add Discussion
	 * 
	 * @param request
	 * @param response
	 * @param discussionBean
	 * @param results
	 * @param redirectAttributes
	 * @param categoryCd
	 * @return
	 */
	@RequestMapping(value = URLConstants.URL_ADD_DISCUSSION, method = RequestMethod.POST)
	public String processAddDiscussion(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.DISCUSSION_BEAN) DiscussionBean discussionBean, 
	        BindingResult results, RedirectAttributes redirectAttributes, 
	        @RequestParam("categoryCd") String categoryCd) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		discussionBean.setStartedBy(loggedUser.getUserName());
		discussionBean.setValidationType(GlobalConstants.VALIDATION_TYPE_INSERT);
		discussionValidator.validate(discussionBean, results);
		if (!results.hasErrors()) {
			DiscussionBean bean = discussionService.fetechDiscussionByNameAndThreadId(
					discussionBean.getMessage(), discussionBean.getThreadId());
			if (bean == null) {
				// New Discussion
				discussionBean.setActive("O");
				boolean val = discussionService.addDiscussion(discussionBean);
				if (val) {
					redirectAttributes.addFlashAttribute(GlobalConstants.SUCCESS_MESSAGE,
					        this.getMessageSource().getMessage(MessageConstants.SUCCESS_ADD_DISCUSSION, null, null));
					
					redirectAttributes.addFlashAttribute(GlobalConstants.DISCUSSION_BEAN, new DiscussionBean());
				} else {
					redirectAttributes.addFlashAttribute(GlobalConstants.FAILURE_MESSAGE,
					        this.getMessageSource().getMessage(MessageConstants.FAILURE_ADD_DISCUSSION, null, null));
				}
			} else {
				redirectAttributes.addFlashAttribute(GlobalConstants.FAILURE_MESSAGE,
				        this.getMessageSource().getMessage(MessageConstants.EXISTING_DISCUSSION, null, null));
			}
		} else {
			redirectAttributes.addFlashAttribute("RESULTS", results);			
			redirectAttributes.addFlashAttribute(GlobalConstants.DISCUSSION_BEAN, discussionBean);
		}
		return GlobalConstants.REDIRECT_REQ + URLConstants.URL_ADD_DISCUSSION 
				+ "/" + categoryCd + "/" + discussionBean.getThreadId();
	}

	/**
	 * Display Search Discussion
	 * 
	 * @param categoryCd
	 * @param threadId
	 * @param request
	 * @param response
	 * @param discussionBean
	 * @param model
	 * @return
	 */
	@RequestMapping(value = URLConstants.URL_SEARCH_DISCUSSION+ "/{categoryCd}"+ "/{threadId}",method = RequestMethod.GET)
	public String displaySearchDiscussion(@PathVariable("categoryCd") String categoryCd,
			@PathVariable("threadId") int threadId,HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.DISCUSSION_BEAN) DiscussionBean discussionBean,Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		ThreadBean thread = threadService.fetchThreadById(threadId);
		model.addAttribute("THREAD",thread);
		model.addAttribute("CATEGORY", ReferenceDataService.getCategoryMap().get(categoryCd));
		
		model.addAttribute(GlobalConstants.DISCUSSION_BEAN,discussionBean);
		request.getSession().removeAttribute(GlobalConstants.SESSION_SEARCH_DISCUSSION_LIST);
		return ViewConstants.VIEW_SEARCH_DISCUSSION;
	}
	
	/**
	 * Show search results
	 * 
	 * @param categoryCd
	 * @param request
	 * @param response
	 * @param discussionBean
	 * @param results
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = URLConstants.URL_SEARCH_DISCUSSION + "/{categoryCd}", method = RequestMethod.POST)
	public String processSearchDiscussion(@PathVariable("categoryCd") String categoryCd,HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.DISCUSSION_BEAN) DiscussionBean discussionBean, 
	        BindingResult results, RedirectAttributes redirectAttributes) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_HOME_PAGE;
		}
		if (request.getSession().getAttribute(GlobalConstants.SESSION_SEARCH_DISCUSSION_LIST) != null) {
			request.getSession().removeAttribute(GlobalConstants.SESSION_SEARCH_DISCUSSION_LIST);
		}
		
		return ViewConstants.VIEW_SEARCH_DISCUSSION;
		
	}
	
	/**
	 * Display edit discussion
	 * 
	 * @param categoryCd
	 * @param discussionId
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @param discussionBean
	 * @param model
	 * @return
	 */
	@RequestMapping(value = URLConstants.URL_EDIT_DISCUSSION + "/{categoryCd}" + "/{discussionId}", method = RequestMethod.GET)
	public String displayEditDiscussion(@PathVariable("categoryCd") String categoryCd, 
			@PathVariable("discussionId") int discussionId,	HttpServletRequest request,
	        HttpServletResponse response, RedirectAttributes redirectAttributes,/*
	        @ModelAttribute(value = GlobalConstants.DISCUSSION_BEAN) DiscussionBean discussionBean,*/ Model model) {
		
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		
		DiscussionBean discussionBean = discussionService.fetchDiscussionById(discussionId);
		
		//For update discussion
		if(model.asMap()!=null && (model.asMap().get("RESULTS")!=null || model.asMap().get("ERROR")!=null)){
			BindingResult results = (BindingResult)model.asMap().get("RESULTS");
			model.addAttribute("org.springframework.validation.BindingResult.discussionBean", results);
			discussionBean = (DiscussionBean) model.asMap().get("discussionBean");
		}
		if(discussionBean != null) {
			ThreadBean thread = threadService.fetchThreadById(discussionBean.getThreadId());
			model.addAttribute("THREAD",thread);
			model.addAttribute("CATEGORY", ReferenceDataService.getCategoryMap().get(categoryCd));
		}
		
		model.addAttribute(GlobalConstants.DISCUSSION_BEAN, discussionBean);
		return ViewConstants.VIEW_EDIT_DISCUSSION;
	}
	
	/**
	 * Update Discussion
	 * @param request
	 * @param response
	 * @param discussionBean
	 * @param redirectAttributes
	 * @param results
	 * @param model
	 * @param categoryCd
	 * @return
	 */
	@RequestMapping(value = URLConstants.URL_UPDATE_DISCUSSION, method = RequestMethod.POST)
	public String processEditCategory(HttpServletRequest request, HttpServletResponse response,
	       @ModelAttribute(value = GlobalConstants.DISCUSSION_BEAN) DiscussionBean discussionBean,
	        RedirectAttributes redirectAttributes, BindingResult results, Model model,
	        @RequestParam("categoryCd") String categoryCd) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		discussionBean.setValidationType(GlobalConstants.VALIDATION_TYPE_UPDATE);
		discussionValidator.validate(discussionBean, results);
		if(!results.hasErrors()) {
			boolean isUpdated = discussionService.updateDiscussion(discussionBean);
			if (isUpdated) {
				redirectAttributes.addFlashAttribute(GlobalConstants.SUCCESS_MESSAGE,
				        this.getMessageSource().getMessage(MessageConstants.EDIT_SUCCESS, null, null));
			} else {
				redirectAttributes.addFlashAttribute(GlobalConstants.FAILURE_MESSAGE,
				        this.getMessageSource().getMessage(MessageConstants.EDIT_FAILURE, null, null));
				redirectAttributes.addFlashAttribute("ERROR","ERROR");
				//redirectAttributes.addFlashAttribute(GlobalConstants.DISCUSSION_BEAN, discussionBean);
			}
		} else {
			redirectAttributes.addFlashAttribute("RESULTS", results);			
			//redirectAttributes.addFlashAttribute(GlobalConstants.DISCUSSION_BEAN, discussionBean);
		}
		redirectAttributes.addFlashAttribute(GlobalConstants.DISCUSSION_BEAN, discussionBean);
		return GlobalConstants.REDIRECT_REQ + URLConstants.URL_EDIT_DISCUSSION 
				+ "/" + categoryCd + "/" + discussionBean.getDiscussionId();
	}
	
	/**
	 * 
	 * @param discussionId
	 * @param commentId
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	  @RequestMapping(value = URLConstants.URL_ACCEPT_COMMENTS + "/{discussionId}"+"/{commentId}", method = RequestMethod.GET)
	  public String likeComment(@PathVariable("discussionId") int discussionId , @PathVariable("commentId") int commentId,
	      HttpServletRequest request, HttpServletResponse response, Model model) {
	    UserBean loggedUser = getLoggedUser(request);

	    if (loggedUser == null) {
	      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
	    }
	    discussionService.acceptComment(commentId, discussionId);

	    return GlobalConstants.REDIRECT_REQ + URLConstants.URL_COMMENTS+"/"+discussionId;
	  }

	

	
}
