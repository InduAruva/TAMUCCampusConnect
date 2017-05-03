package com.tamuc.cc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tamuc.cc.bean.CommentsBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;
import com.tamuc.cc.constants.URLConstants;
import com.tamuc.cc.constants.ViewConstants;
import com.tamuc.cc.service.CommentsService;

/**
 * @author TAMUCCampusConnect
 *
 */
@Controller
public class CommentsController extends AbstractController {

  @Autowired
  private CommentsService commentsService;

  @RequestMapping(value = URLConstants.URL_ADD_COMMENT, method = RequestMethod.POST)
  public String processAddComments(@RequestParam("uploadImage") MultipartFile file,
      @RequestParam("uploadVideo") MultipartFile videoFile, HttpServletRequest request, HttpServletResponse response,
      @ModelAttribute(value="commentsBean") CommentsBean commentsBean,RedirectAttributes redirectAttributes) throws IOException {
    UserBean loggedUser = getLoggedUser(request);

    if (loggedUser == null) {
      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
    }
    if((commentsBean.getText()==null || commentsBean.getText().isEmpty()) && (file==null || file.getSize()<=0) && (videoFile==null || videoFile.getSize()<=0)){
    	return GlobalConstants.REDIRECT_REQ + URLConstants.URL_COMMENTS+"/"+commentsBean.getDiscussionId();
    }
    if ( file != null && file.getSize() != 0 && (!file.getContentType().equals("image/jpeg") 
        && !file.getContentType().equals("image/gif")
        && !file.getContentType().equals("image/x-png"))) {
      redirectAttributes.addFlashAttribute(GlobalConstants.FAILURE_MESSAGE,
          this.getMessageSource().getMessage(MessageConstants.INVALID_IMAGE_FORMAT, null, null));
      return GlobalConstants.REDIRECT_REQ + URLConstants.URL_COMMENTS+"/"+commentsBean.getDiscussionId();
    } 
    else if ( file != null && file.getSize() > 2048000 ) {
      redirectAttributes.addFlashAttribute(GlobalConstants.FAILURE_MESSAGE,
          this.getMessageSource().getMessage(MessageConstants.INVALID_IMAGE_SIZE, null, null));
      return GlobalConstants.REDIRECT_REQ + URLConstants.URL_COMMENTS+"/"+commentsBean.getDiscussionId();
    } 
    else {
      if(file != null && file.getSize() > 0) {
        byte[] imageByte = file.getBytes();
        commentsBean.setImage(imageByte);    
      }
    }   
    String videoLocation=String.valueOf(request.getServletContext().getInitParameter("videoLocation"));
    commentsBean.setCommentedBy(loggedUser.getUserName());;
    commentsService.addComments(commentsBean,videoFile,videoLocation);

    return GlobalConstants.REDIRECT_REQ + URLConstants.URL_COMMENTS+"/"+commentsBean.getDiscussionId();
  }

 
  /**
   * @param discussionId
   * @param commentId
   * @param request
   * @param response
   * @param model
   * @return
   */
  @RequestMapping(value = URLConstants.URL_REMOVE_COMMENT + "/{discussionId}"+"/{commentId}", method = RequestMethod.GET)
  public String removeComment(@PathVariable("discussionId") int discussionId , @PathVariable("commentId") int commentId,
      HttpServletRequest request, HttpServletResponse response, Model model) {
    UserBean loggedUser = getLoggedUser(request);

    if (loggedUser == null) {
      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
    }
    commentsService.deprecateComment(commentId);

    return GlobalConstants.REDIRECT_REQ + URLConstants.URL_COMMENTS+"/"+discussionId;
  }


  /**
   * @param discussionId
   * @param commentId
   * @param request
   * @param response
   * @param model
   * @return
   */
  @RequestMapping(value = URLConstants.URL_LIKE_COMMENTS + "/{discussionId}"+"/{commentId}", method = RequestMethod.GET)
  public String likeComment(@PathVariable("discussionId") int discussionId , @PathVariable("commentId") int commentId,
      HttpServletRequest request, HttpServletResponse response, Model model) {
    UserBean loggedUser = getLoggedUser(request);

    if (loggedUser == null) {
      return GlobalConstants.REDIRECT_REQ + ViewConstants.VIEW_LOGIN;
    }
    commentsService.incrementLikeCount(commentId);

    return GlobalConstants.REDIRECT_REQ + URLConstants.URL_COMMENTS+"/"+discussionId;
  }


}
