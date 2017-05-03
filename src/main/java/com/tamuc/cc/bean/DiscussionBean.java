package com.tamuc.cc.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

// TODO: Auto-generated Javadoc
/**
 * The Class DiscussionBean.
 *
 * @author TAMUCCampusConnect
 */
public class DiscussionBean implements Serializable {

  /** The Constant serialVersionUID. */
  private static final long serialVersionUID = 1L;
  
  /** The discussion id. */
  private int discussionId;
  
  /** The active. */
  private String active;
  
  /** The started by. */
  private String startedBy;
  
  /** The started dt. */
  private Date startedDt;
  
  /** The message. */
  private String message;
  
  /** The accepted comments. */
  private String acceptedCommentId;
  
  /** The accepted dt. */
  private Date acceptedDt;
  
  /** The thread id. */
  private int threadId;
  
  /** The comment lst. */
  private List<CommentsBean> commentLst;
  
  /** The no of comments. */
  private int noOfComments;

  private String validationType;
  
  /**
   * Instantiates a new discussion bean.
   */
  public DiscussionBean() {
    super();
  }

  
  /**
 * @param discussionId
 * @param active
 * @param startedBy
 * @param startedDt
 * @param message
 * @param acceptedCommentId
 * @param acceptedDt
 * @param threadId
 * @param commentLst
 * @param noOfComments
 * @param validationType
 */
public DiscussionBean(int discussionId, String active, String startedBy, Date startedDt, String message,
        String acceptedCommentId, Date acceptedDt, int threadId, List<CommentsBean> commentLst, int noOfComments,
        String validationType) {
	super();
	this.discussionId = discussionId;
	this.active = active;
	this.startedBy = startedBy;
	this.startedDt = startedDt;
	this.message = message;
	this.acceptedCommentId = acceptedCommentId;
	this.acceptedDt = acceptedDt;
	this.threadId = threadId;
	this.commentLst = commentLst;
	this.noOfComments = noOfComments;
	this.validationType = validationType;
}





/**
   * Gets the discussion id.
   *
   * @return the discussion id
   */
  public int getDiscussionId() {
	return discussionId;
}

/**
 * Sets the discussion id.
 *
 * @param discussionId the new discussion id
 */
public void setDiscussionId(int discussionId) {
	this.discussionId = discussionId;
}

/**
   * Gets the active.
   *
   * @return the active
   */
  public String getActive() {
    return active;
  }

  /**
   * Sets the active.
   *
   * @param active the active to set
   */
  public void setActive(String active) {
    this.active = active;
  }

  /**
   * Gets the started by.
   *
   * @return the startedBy
   */
  public String getStartedBy() {
    return startedBy;
  }

  /**
   * Sets the started by.
   *
   * @param startedBy the startedBy to set
   */
  public void setStartedBy(String startedBy) {
    this.startedBy = startedBy;
  }

  /**
   * Gets the started dt.
   *
   * @return the startedDt
   */
  public Date getStartedDt() {
    return startedDt;
  }

  /**
   * Sets the started dt.
   *
   * @param startedDt the startedDt to set
   */
  public void setStartedDt(Date startedDt) {
    this.startedDt = startedDt;
  }

  /**
   * Gets the message.
   *
   * @return the message
   */
  public String getMessage() {
    return message;
  }

  /**
   * Sets the message.
   *
   * @param message the message to set
   */
  public void setMessage(String message) {
    this.message = message;
  }

  /**
   * Gets the accepted comment id.
   *
   * @return the acceptedCommentId
   */
public String getAcceptedCommentId() {
	return acceptedCommentId;
}

/**
 * Sets the accepted comment id.
 *
 * @param acceptedCommentId the acceptedCommentId to set
 */
public void setAcceptedCommentId(String acceptedCommentId) {
	this.acceptedCommentId = acceptedCommentId;
}


  /**
   * Gets the accepted dt.
   *
   * @return the acceptedDt
   */
  public Date getAcceptedDt() {
    return acceptedDt;
  }

  /**
   * Sets the accepted dt.
   *
   * @param acceptedDt the acceptedDt to set
   */
  public void setAcceptedDt(Date acceptedDt) {
    this.acceptedDt = acceptedDt;
  }

 
  /**
   * Gets the thread id.
   *
   * @return the thread id
   */
  public int getThreadId() {
    return threadId;
  }

  
  /**
   * Sets the thread id.
   *
   * @param threadId the new thread id
   */
  public void setThreadId(int threadId) {
    this.threadId = threadId;
  }

  /**
   * Gets the comment lst.
   *
   * @return the commentLst
   */
  public List<CommentsBean> getCommentLst() {
    return commentLst;
  }

  /**
   * Sets the comment lst.
   *
   * @param commentLst the commentLst to set
   */
  public void setCommentLst(List<CommentsBean> commentLst) {
    this.commentLst = commentLst;
  }

  /**
   * Gets the no of comments.
   *
   * @return the noOfComments
   */
  public int getNoOfComments() {
    return noOfComments;
  }

  /**
   * Sets the no of comments.
   *
   * @param noOfComments the noOfComments to set
   */
  public void setNoOfComments(int noOfComments) {
    this.noOfComments = noOfComments;
  }

public String getValidationType() {
	return validationType;
}

public void setValidationType(String validationType) {
	this.validationType = validationType;
}


}
