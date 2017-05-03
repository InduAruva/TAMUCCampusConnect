package com.tamuc.cc.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tamuc.cc.bean.CommentsBean;
import com.tamuc.cc.dao.CommentsDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class CommentsService.
 *
 * @author TAMUCCampusConnect
 */
/**
 * @author TAMUCCampusConnect
 *
 */
@Service("commentsService")
public class CommentsService {

  /** The Comments dao. */
  @Autowired
  private CommentsDAO commentsDAO;

  /**
   * Adds the Comments.
   *
   * @param bean the bean
   * @return true, if successful
   * @throws IOException 
   */
  public boolean addComments(CommentsBean bean,MultipartFile videoFile,String videoLocation) throws IOException {
    boolean isSuccess = true;
   
       isSuccess = commentsDAO.addComments(bean);
       if(isSuccess && videoFile!=null && !videoFile.isEmpty()){
        String filePath= uploadVideoFile(videoFile,bean.getCommentedBy(),bean.getCommentId(),videoLocation);
        bean.setVideo(filePath);
        isSuccess=commentsDAO.updateVideo(filePath, bean.getCommentId());
       }
    
   return isSuccess;
  }

 

  
  public boolean deprecateComment(int commentId) {
    return commentsDAO.deprecateComment(commentId);
  }

  /**
   * Search Comments.
   *
   * @param bean the bean
   * @return the Comments bean
   */
  public List<CommentsBean> searchComments(CommentsBean bean) {
    return commentsDAO.searchComments(bean);
  }

  
  /**
   * Fetch active comments for discussion.
   *
   * @param discList the disc list
   * @return the map
   */
  public Map<String,String> fetchActiveCommentsForDiscussion(List<String> discList) {
    return commentsDAO.fetchActiveCommentsForDiscussion(discList);
  }
  
  /**
   * Increment like count.
   *
   * @param commentId the comment id
   * @return true, if successful
   */
  public boolean incrementLikeCount(int commentId) {
    return commentsDAO.incrementLikeCount(commentId);
  }
  
  
  public String uploadVideoFile(MultipartFile file,String username,int commentId,String videoLocation) throws IOException{
    StringBuffer filePath = new StringBuffer(videoLocation).append(File.separator).append(username);
    if(file!=null && !file.isEmpty()){
      byte[] bytes = file.getBytes();
      File dir = new File(filePath.toString());
      if(!dir.exists()){
        dir.mkdirs();
      }
      String videoFileName =  "VIDEO_COMM_"+commentId+"."+FilenameUtils.getExtension(file.getOriginalFilename());
      File serverFile = new File(dir.getAbsolutePath()
          + File.separator + videoFileName);
      BufferedOutputStream stream = new BufferedOutputStream(
          new FileOutputStream(serverFile));
      stream.write(bytes);
      stream.close();
      return videoFileName;    
    }
    return "";
  }

}
