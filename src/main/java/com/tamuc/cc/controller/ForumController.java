/**
 * 
 */
package com.tamuc.cc.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.xmlbeans.impl.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tamuc.cc.bean.CategoryBean;
import com.tamuc.cc.bean.CommentsBean;
import com.tamuc.cc.bean.DiscussionBean;
import com.tamuc.cc.bean.ThreadBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.URLConstants;
import com.tamuc.cc.constants.ViewConstants;
import com.tamuc.cc.service.CategoryService;
import com.tamuc.cc.service.CommentsService;
import com.tamuc.cc.service.DiscussionService;
import com.tamuc.cc.service.ThreadService;
import com.tamuc.cc.service.UserService;

// TODO: Auto-generated Javadoc
/**
 * The Class ForumController.
 *
 * @author TAMUCCampusConnect
 */
@Controller
public class ForumController extends AbstractController {

  /** The category service. */
  @Autowired
  private CategoryService categoryService;

  /** The thread service. */
  @Autowired
  private ThreadService threadService;

  /** The discussion service. */
  @Autowired
  private DiscussionService discussionService;

  /** The comments service. */
  @Autowired
  private CommentsService commentsService;
  
  @Autowired
  private UserService userService;



  /**
   * Display forum categories.
   *
   * @param request the request
   * @param response the response
   * @param model the model
   * @return the string
   */
  @RequestMapping(value = URLConstants.URL_FORUM, method = RequestMethod.GET)
  public String displayForumCategories(HttpServletRequest request, HttpServletResponse response,
      Model model) {
    UserBean loggedUser = getLoggedUser(request);

    if (loggedUser == null) {
      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
    }
    List<CategoryBean> allCategoryList = categoryService.fetchActiveCategories();
    List<String> catList = new ArrayList<String>();
    for (CategoryBean bean : allCategoryList) {
      catList.add(bean.getCategoryCd());
    }
    Map<String, String> activeThreads = threadService.fetchActiveThreadsForCategory(catList);
    allCategoryList = categoryService.populateActiveThreads(allCategoryList, activeThreads);
    model.addAttribute("FORUM_ALL_CATEGORIES", allCategoryList);
    return ViewConstants.VIEW_FORUM_CATEGORIES;
  }


  /**
   * Display forum threads by category.
   *
   * @param category the category
   * @param request the request
   * @param response the response
   * @param model the model
   * @return the string
   */
  @RequestMapping(value = URLConstants.URL_THREADS + "/{categoryCd}", method = RequestMethod.GET)
  public String displayForumThreadsByCategory(@PathVariable("categoryCd") String categoryCd,
      HttpServletRequest request, HttpServletResponse response, Model model) {
    UserBean loggedUser = getLoggedUser(request);

    if (loggedUser == null) {
      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
    }
    ThreadBean thread = new ThreadBean();
    thread.setCategoryCd(categoryCd);
    List<ThreadBean> allThreads = threadService.searchThread(thread);
    List<String> list = new ArrayList<String>();
    for (ThreadBean bean : allThreads) {
      list.add(String.valueOf(bean.getThreadId()));
    }
    Map<String, String> activeDisc = discussionService.fetchActiveDiscussionsForThread(list);
    allThreads = threadService.populateActiveDiscussions(allThreads, activeDisc);
    CategoryBean category = new CategoryBean();
    category = categoryService.fetchCategoryByCode(thread.getCategoryCd());
    category.setThreadList(allThreads);
    model.addAttribute("CATEGORY_THREADS", category);
    return ViewConstants.VIEW_FORUM_THREADS;
  }



  /**
   * Display forum threads by category.
   *
   * @param threadId the thread id
   * @param request the request
   * @param response the response
   * @param model the model
   * @return the string
   */
  @RequestMapping(value = URLConstants.URL_DISCUSSION + "/{threadId}", method = RequestMethod.GET)
  public String displayForumDiscussionsByThread(@PathVariable("threadId") int threadId,
      HttpServletRequest request, HttpServletResponse response, Model model) {
    UserBean loggedUser = getLoggedUser(request);

    if (loggedUser == null) {
      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
    }
    DiscussionBean disc = new DiscussionBean();
    disc.setThreadId(threadId);
    List<DiscussionBean> allDiscussions = discussionService.fetchActiveDiscussionsForThread(threadId);
    List<String> list = new ArrayList<String>();
    for (DiscussionBean bean : allDiscussions) {
      list.add(String.valueOf(bean.getDiscussionId()));
    }
    Map<String, String> comments = commentsService.fetchActiveCommentsForDiscussion(list);
    allDiscussions = discussionService.populateComments(allDiscussions, comments);
    ThreadBean thread = new ThreadBean();
    thread = threadService.fetchThreadById(threadId);
    thread.setDiscussionLst(allDiscussions);
    
    CategoryBean cat = new CategoryBean();
    cat = categoryService.fetchCategoryByCode(thread.getCategoryCd());
     
    model.addAttribute("CATEGORY",cat);
    model.addAttribute("THREAD_DISCUSSIONS", thread);
    return ViewConstants.VIEW_FORUM_DISCUSSIONS;
  }


  /**
   * Display forum comments by discussion.
   *
   * @param discussionId the discussion id
   * @param request the request
   * @param response the response
   * @param model the model
   * @return the string
   */
  @RequestMapping(value = URLConstants.URL_COMMENTS + "/{discussionId}", method = RequestMethod.GET)
  public String displayForumCommentsByDiscussion(@PathVariable("discussionId") int discussionId,
      HttpServletRequest request, HttpServletResponse response, @ModelAttribute(value="commentsBean") CommentsBean commentsBean , Model model) {
    UserBean loggedUser = getLoggedUser(request);

    if (loggedUser == null) {
      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
    }
    CommentsBean commentBean = new CommentsBean();
    commentBean.setDiscussionId(discussionId);
    List<CommentsBean> commentsList = commentsService.searchComments(commentBean);
    for (CommentsBean bean : commentsList) {
      UserBean commenter = userService.fetchUserByUsername(bean.getCommentedBy());
      if(commenter.getProfilePic()!=null){
        byte[] encodedImage = Base64.encode(commenter.getProfilePic());
        commenter.setEncodedProfilePic(new String(encodedImage)); 
      }    
      bean.setCommenter(commenter);
      if(bean.getImage()!=null){
        byte[] encodedImage = Base64.encode(bean.getImage());
        bean.setEncodedImage(new String(encodedImage));
        
      }
     }    
    DiscussionBean discussion = new DiscussionBean();
    discussion.setDiscussionId(discussionId);
    discussion =discussionService.fetchDiscussionById(discussionId);
    discussion.setCommentLst(commentsList);
    
    ThreadBean thread = new ThreadBean();
    thread =threadService.fetchThreadById(discussion.getThreadId());
    
    CategoryBean cat = new CategoryBean();
    cat = categoryService.fetchCategoryByCode(thread.getCategoryCd());
     
    model.addAttribute("CATEGORY",cat);
    model.addAttribute("THREAD",thread);
    model.addAttribute("DISCUSSION", discussion);
    return ViewConstants.VIEW_FORUM_COMMENTS;
  }
  
  
  @RequestMapping(value = URLConstants.URL_USER_HOME_PAGE , method = RequestMethod.GET)
  public String displayUserHomeForum(HttpServletRequest request, HttpServletResponse response, Model model) {
    UserBean loggedUser = getLoggedUser(request);

    if (loggedUser == null) {
      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
    }
    DiscussionBean disc = new DiscussionBean();
    disc.setStartedBy(loggedUser.getUserName());
    disc.setActive("O");
    List<DiscussionBean> allDiscussions = discussionService.searchDiscussion(disc);
    Set<String> set = new HashSet<String>();
    if(allDiscussions!=null && !allDiscussions.isEmpty()){
      for (DiscussionBean bean : allDiscussions) {
        set.add(String.valueOf(bean.getThreadId()));
      }
      List<ThreadBean> threadList = threadService.fetchThreadByThreadIds(set);
      threadList = threadService.populateActiveDiscussions(threadList, allDiscussions);  
      model.addAttribute("THREADS", threadList);
    }    
    
    return ViewConstants.VIEW_USER_HOME_PAGE;
  }

  
  
  

}
