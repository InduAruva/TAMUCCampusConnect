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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tamuc.cc.bean.CategoryBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;
import com.tamuc.cc.constants.URLConstants;
import com.tamuc.cc.constants.ViewConstants;
import com.tamuc.cc.service.CategoryService;
import com.tamuc.cc.service.ReferenceDataService;
import com.tamuc.cc.service.ThreadService;
import com.tamuc.cc.validator.CategoryValidator;

// TODO: Auto-generated Javadoc
/**
 * The Class CategoryController.
 *
 * @author TAMUCCampusConnect
 */
@Controller("categoryController")
public class CategoryController extends AbstractController {

  /** The category service. */
  @Autowired
  private CategoryService categoryService;
  @Autowired 
  private ThreadService threadService;

  /** The login validator. */
  @Autowired
  private CategoryValidator categoryValidator;

  /**
   * Init binder.
   *
   * @param binder the binder
   */
  @InitBinder
  protected void initBinder(WebDataBinder binder) {
    binder.setValidator(categoryValidator);
  }

  /**
   * Display add category.
   *
   * @param request the request
   * @param response the response
   * @param userBean the user bean
   * @return the string
   */
  @RequestMapping(value = URLConstants.URL_ADD_CATEGORY, method = RequestMethod.GET)
  public String displayAddCategory(HttpServletRequest request, HttpServletResponse response,
      @ModelAttribute(value = GlobalConstants.CATEGORY_BEAN) CategoryBean categoryBean) {
	  UserBean loggedUser = getLoggedUser(request);
	    if (loggedUser == null) {
	    	return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
	    }
    return ViewConstants.VIEW_ADD_CATEGORY;
  }

  /**
   * Process add category.
   *
   * @param request the request
   * @param response the response
   * @param userBean the user bean
   * @param results the results
   * @param redirectAttributes the redirect attributes
   * @return the model and view
   */
  @RequestMapping(value = URLConstants.URL_ADD_CATEGORY, method = RequestMethod.POST)
  public String processAddCategory(HttpServletRequest request, HttpServletResponse response,
       @ModelAttribute(value = GlobalConstants.CATEGORY_BEAN) CategoryBean categoryBean,
       BindingResult results, RedirectAttributes redirectAttributes, Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		categoryBean.setCreatedBy(loggedUser.getUserName());
		categoryBean.setValidationType(GlobalConstants.VALIDATION_TYPE_INSERT);
		categoryValidator.validate(categoryBean, results);
		if (!results.hasErrors()) {
			CategoryBean bean = categoryService.fetechCategoryByName(categoryBean.getCategoryName());
			if (bean == null) {
				// New category
				categoryBean.setActive(GlobalConstants.YES);
				boolean val = categoryService.addCategory(categoryBean);
				if (val) {
					updateCategoryMap(categoryBean);

					model.addAttribute(GlobalConstants.SUCCESS_MESSAGE,
					        this.getMessageSource().getMessage(MessageConstants.SUCCESS_ADD_CATEGORY, null, null));
				} else {
					model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
					        this.getMessageSource().getMessage(MessageConstants.FAILURE_ADD_CATEGORY, null, null));
				}
			} else {
				model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
				        this.getMessageSource().getMessage(MessageConstants.EXISTING_CATEGORY, null, null));
			}
		}

		return ViewConstants.VIEW_ADD_CATEGORY;
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
	@RequestMapping(value = URLConstants.URL_SEARCH_CATEGORY, method = RequestMethod.GET)
	public String displaySearch(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.CATEGORY_BEAN) CategoryBean categoryBean) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		//removeSessionDetails(request);
		request.getSession().removeAttribute(GlobalConstants.SESSION_SEARCH_CATEGORY_LIST);
		return ViewConstants.VIEW_SEARCH_CATEGORY;
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
	@RequestMapping(value = URLConstants.URL_SEARCH_CATEGORY, method = RequestMethod.POST)
	public String processSearch(HttpServletRequest request, HttpServletResponse response,
	        @ModelAttribute(value = GlobalConstants.CATEGORY_BEAN) CategoryBean categoryBean,
	        RedirectAttributes redirectAttributes, Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_HOME_PAGE;
		}
		if (request.getSession().getAttribute(GlobalConstants.SESSION_SEARCH_CATEGORY_LIST) != null) {
			request.getSession().removeAttribute(GlobalConstants.SESSION_SEARCH_CATEGORY_LIST);
		}
		List<CategoryBean> categoryBeanLst = categoryService.searchCategory(categoryBean);
		if (categoryBeanLst == null || categoryBeanLst.isEmpty()) {
			model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
			        this.getMessageSource().getMessage(MessageConstants.SEARCH_FAILURE, null, null));
		} else {
			request.getSession().setAttribute(GlobalConstants.SESSION_SEARCH_CATEGORY_LIST, categoryBeanLst);
		}

		return ViewConstants.VIEW_SEARCH_CATEGORY;
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
	@RequestMapping(value = URLConstants.URL_EDIT_CATEGORY + "/{categoryCd}", method = RequestMethod.GET)
	public String displayEditCategory(@PathVariable("categoryCd") String categoryCd, HttpServletRequest request,
	        HttpServletResponse response, RedirectAttributes redirectAttributes,
	        @ModelAttribute(value = GlobalConstants.CATEGORY_BEAN) CategoryBean categoryBean, Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}
		categoryBean = categoryService.fetchCategoryByCode(categoryCd);
		model.addAttribute(GlobalConstants.CATEGORY_BEAN, categoryBean);
		//removeSessionDetails(request);
		return ViewConstants.VIEW_EDIT_CATEGORY;
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
	@RequestMapping(value = URLConstants.URL_EDIT_CATEGORY_SAVE, method = RequestMethod.POST)
	public String processEditCategory(HttpServletRequest request, HttpServletResponse response,
	       @ModelAttribute(value = GlobalConstants.CATEGORY_BEAN) CategoryBean categoryBean,
	        RedirectAttributes redirectAttributes, BindingResult results, Model model) {
		UserBean loggedUser = getLoggedUser(request);
		if (loggedUser == null) {
			return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
		}

		categoryBean.setValidationType(GlobalConstants.VALIDATION_TYPE_UPDATE);
		categoryValidator.validate(categoryBean, results);
		if(!results.hasErrors()) {
			boolean isUpdated = categoryService.updateCategory(categoryBean);
			if (isUpdated) {
				updateCategoryMap(categoryBean);
				model.addAttribute(GlobalConstants.SUCCESS_MESSAGE,
				        this.getMessageSource().getMessage(MessageConstants.EDIT_SUCCESS, null, null));
			} else {
				model.addAttribute(GlobalConstants.FAILURE_MESSAGE,
				        this.getMessageSource().getMessage(MessageConstants.EDIT_FAILURE, null, null));
			}
		}
		
		return ViewConstants.VIEW_EDIT_CATEGORY;
	}
	
	private void updateCategoryMap(CategoryBean categoryBean) {
		Map<String, CategoryBean> cateMap = ReferenceDataService.getCategoryMap();
        cateMap.put(categoryBean.getCategoryCd(), categoryBean);
        ReferenceDataService.setCategoryMap(cateMap);
	}
}
