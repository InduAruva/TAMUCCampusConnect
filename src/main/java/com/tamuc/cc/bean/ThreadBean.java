package com.tamuc.cc.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

// TODO: Auto-generated Javadoc
/**
 * The Class ThreadBean.
 *
 * @author TAMUCCampusConnect
 */
public class ThreadBean implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The thread id. */
	private int threadId;
	
	/** The topic. */
	private String topic;
	
	/** The description. */
	private String description;
	
	/** The category cd. */
	private String categoryCd;
	
	/** The started by. */
	private String startedBy;
	
	/** The start dt. */
	private Date startDt;
	
	/** The status. */
	private String status;
	
	/** The discussion lst. */
	private List<DiscussionBean> discussionLst;
	
	/** The active discussion. */
	private int activeDiscussion;
	
	private String validationType;
	
	/**
	 * Instantiates a new thread bean.
	 */
    public ThreadBean() {
	    super();
    }
	

	
	
	/**
	 * @param threadId
	 * @param topic
	 * @param description
	 * @param categoryCd
	 * @param startedBy
	 * @param startDt
	 * @param status
	 * @param discussionLst
	 * @param activeDiscussion
	 * @param validationType
	 */
    public ThreadBean(int threadId, String topic, String description, String categoryCd, String startedBy,
            Date startDt, String status, List<DiscussionBean> discussionLst, int activeDiscussion, String validationType) {
	    super();
	    this.threadId = threadId;
	    this.topic = topic;
	    this.description = description;
	    this.categoryCd = categoryCd;
	    this.startedBy = startedBy;
	    this.startDt = startDt;
	    this.status = status;
	    this.discussionLst = discussionLst;
	    this.activeDiscussion = activeDiscussion;
	    this.validationType = validationType;
    }




	/**
	 * @return the threadId
	 */
	public int getThreadId() {
		return threadId;
	}

	/**
	 * @param threadId the threadId to set
	 */
	public void setThreadId(int threadId) {
		this.threadId = threadId;
	}

	/**
	 * Gets the topic.
	 *
	 * @return the topic
	 */
	public String getTopic() {
		return topic;
	}
	
	/**
	 * Sets the topic.
	 *
	 * @param topic the topic to set
	 */
	public void setTopic(String topic) {
		this.topic = topic;
	}
	
	/**
	 * Gets the description.
	 *
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	
	/**
	 * Sets the description.
	 *
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	/**
	 * Gets the category cd.
	 *
	 * @return the categoryCd
	 */
	public String getCategoryCd() {
		return categoryCd;
	}
	
	/**
	 * Sets the category cd.
	 *
	 * @param categoryCd the categoryCd to set
	 */
	public void setCategoryCd(String categoryCd) {
		this.categoryCd = categoryCd;
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
	 * Gets the start dt.
	 *
	 * @return the startDt
	 */
	public Date getStartDt() {
		return startDt;
	}
	
	/**
	 * Sets the start dt.
	 *
	 * @param startDt the startDt to set
	 */
	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}
	
	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	
	/**
	 * Sets the status.
	 *
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	
	/**
	 * Gets the discussion lst.
	 *
	 * @return the discussionLst
	 */
	public List<DiscussionBean> getDiscussionLst() {
		return discussionLst;
	}
	
	/**
	 * Sets the discussion lst.
	 *
	 * @param discussionLst the discussionLst to set
	 */
	public void setDiscussionLst(List<DiscussionBean> discussionLst) {
		this.discussionLst = discussionLst;
	}
	
	/**
	 * Gets the active discussion.
	 *
	 * @return the activeDiscussion
	 */
	public int getActiveDiscussion() {
		return activeDiscussion;
	}
	
	/**
	 * Sets the active discussion.
	 *
	 * @param activeDiscussion the activeDiscussion to set
	 */
	public void setActiveDiscussion(int activeDiscussion) {
		this.activeDiscussion = activeDiscussion;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
    @Override
    public String toString() {
	    return "ThreadBean [threadId=" + threadId + ", topic=" + topic + ", description=" + description
	            + ", categoryCd=" + categoryCd + ", startedBy=" + startedBy + ", startDt=" + startDt + ", status="
	            + status + ", discussionLst=" + discussionLst + ", activeDiscussion=" + activeDiscussion + "]";
    }

	public String getValidationType() {
	    return validationType;
    }

	public void setValidationType(String validationType) {
	    this.validationType = validationType;
    }
	
    
	
}
