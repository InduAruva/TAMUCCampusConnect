/**
 * 
 */
package com.tamuc.cc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.tamuc.cc.bean.CommentsBean;
import com.tamuc.cc.constants.GlobalConstants;

// TODO: Auto-generated Javadoc
/**
 * The Class CommentsDAO.
 *
 * @author TAMUCCampusConnect
 */
@Repository("commentsDAO")
public class CommentsDAO extends AbstractDAO {

  /**
   * Adds the Comments.
   *
   * @param commentsBean the comments bean
   * @return true, if successful
   */
  public boolean addComments(CommentsBean commentsBean) {
    //comment Id should be auto incremented?
    int commentId= generateCommentId();
    
    StringBuilder query = new StringBuilder("INSERT INTO ").append(AbstractDAO.COMMENTS_TABLE)
		        .append("(COMMENT_ID,DISCUSSION_ID,COMMENTED_BY,COMMENT_DT,NO_OF_LIKES,IMAGE,TEXT, DEPRECATED)")
		        .append(" VALUES ").append("(?,? ,? ,NOW(),? ,?  ,?,'N')");
		getJdbcTemplate().update(query.toString(), commentId,commentsBean.getDiscussionId(), commentsBean.getCommentedBy(),
		        commentsBean.getNoOfLikes(), commentsBean.getImage(), commentsBean.getText());
		commentsBean.setCommentId(commentId);
    return true;
  }

  /**
   * Update Comments.
   *
   * @param bean the bean
   * @return true, if successful
   */
  public boolean updateVideo(String videoFile,int commentId) {
    StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.COMMENTS_TABLE)
        .append(" SET VIDEO = ?")
        .append(" WHERE COMMENT_ID= ?");
    getJdbcTemplate().update(query.toString(), videoFile,commentId);
    return true;
  }

  /**
   * Delete Comments.
   *
   * @param bean the bean
   * @return true, if successful
   */
  public boolean deprecateComment(int commentId) {
    StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.COMMENTS_TABLE)
        .append(" SET DEPRECATED = 'Y'")
        .append(" WHERE COMMENT_ID= ?");
    getJdbcTemplate().update(query.toString(), commentId);
    return true;
  }

  /**
   * Search Comments.
   *
   * @param bean the bean
   * @return the Comments bean
   */
  public List<CommentsBean> searchComments(CommentsBean bean) {
    List<CommentsBean> fetchedComments= null;
    StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.COMMENTS_TABLE);
    StringBuilder whereClause = new StringBuilder("");
    if(bean!=null){
      if (bean.getDiscussionId()!=0) {
        if (whereClause.length() <= 0) {
          whereClause.append(GlobalConstants.WHERE_CLAUSE);
        } else {
          whereClause.append(GlobalConstants.AND);
        }
        whereClause.append(" DISCUSSION_ID = '");
        whereClause.append(bean.getDiscussionId());
        whereClause.append(GlobalConstants.SINGLE_QUOT);
      }
      if (whereClause.length() <= 0) {
        whereClause.append(GlobalConstants.WHERE_CLAUSE);
      } else {
        whereClause.append(GlobalConstants.AND);
      }
      whereClause.append(" ( DEPRECATED <> 'Y' or DEPRECATED IS NULL ) ");

    }
    if (whereClause.length() > 0) {
      query.append(GlobalConstants.SPACE_STRING).append(whereClause);
    }
    query.append(" ORDER BY COMMENT_DT DESC");
    fetchedComments = (List<CommentsBean>) getJdbcTemplate().query(query.toString(),
        new BeanPropertyRowMapper<CommentsBean>(CommentsBean.class));
    return fetchedComments;
  }


  /**
   * Increment like count.
   *
   * @param commentId the comment id
   * @return true, if successful
   */
  public boolean incrementLikeCount(int commentId) {
    StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.COMMENTS_TABLE)
        .append(" SET NO_OF_LIKES = NO_OF_LIKES+1")
        .append(" WHERE COMMENT_ID= ?");
    getJdbcTemplate().update(query.toString(), commentId);
    return true;
  }


  /**
   * Fetch active comments for discussion.
   *
   * @param discList the disc list
   * @return the map
   */
  public Map<String,String> fetchActiveCommentsForDiscussion(List<String> discList) {
    Map<String,String> activeComments = new HashMap<>();      
    try {
      StringBuffer discStr = new StringBuffer();
      int i = 1;
      if(discList !=null && !discList.isEmpty()){
        for(String thread : discList){
          discStr.append("'").append(thread).append("'");
          if(i<discList.size()){
            discStr.append(",");
          }
          i++;
        }
      }      
      else{
        return activeComments;
      }

      StringBuilder query = new StringBuilder("SELECT DISCUSSION_ID ,COUNT(1) AS ACTIVE_COUNT FROM ").append(AbstractDAO.COMMENTS_TABLE).append(
          " WHERE DISCUSSION_ID IN ( ").append(discStr).append(") and (DEPRECATED IS NULL OR DEPRECATED ='N')  GROUP BY DISCUSSION_ID");

      List<Map<String, Object>> rows = getJdbcTemplate().queryForList(query.toString());
      for(Map<String, Object> map : rows){
        activeComments.put(map.get("DISCUSSION_ID").toString(),map.get("ACTIVE_COUNT").toString());
      }

      return activeComments;
    } catch (EmptyResultDataAccessException e) {
      return activeComments;
    }
  }

  
  private int generateCommentId() {
    try {
      StringBuilder query =
          new StringBuilder("SELECT IFNULL(MAX(COMMENT_ID),0) FROM ").append(AbstractDAO.COMMENTS_TABLE);
      int i = getJdbcTemplate().queryForObject(query.toString(), null, Integer.class);
      return i+1;

    } catch (EmptyResultDataAccessException e) {
      return 1;
    }
  }
  

}
