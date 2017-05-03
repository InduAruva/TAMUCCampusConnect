package com.tamuc.cc.bean;

import java.io.Serializable;
import java.sql.Date;

// TODO: Auto-generated Javadoc
/**
 * The Class CommentsBean.
 *
 * @author TAMUCCampusConnect
 */
public class CommentsBean implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The comment id. */
	private int commentId;
	
	/** The commented by. */
	private String commentedBy;
	
	/** The comment dt. */
	private Date commentDt;
	
	/** The no of likes. */
	private int noOfLikes;
	
	/** The image. */
	private byte[] image;
	//Custom
	private String encodedImage;
	
	/** The video. */
	private String video;
	
	/** The text. */
	private String text;
	
	/** The deprecated. */
	private String deprecated;
	
	/** The discussion id. */
	private int discussionId;
	
	//Custom field
	private UserBean commenter;
	
	
	/**
	 * Instantiates a new comments bean.
	 */
    public CommentsBean() {
	    super();
    }
	
	/**
	 * Instantiates a new comments bean.
	 *
	 * @param commentId the comment id
	 * @param commentedBy the commented by
	 * @param commentDt the comment dt
	 * @param noOfLikes the no of likes
	 * @param image the image
	 * @param video the video
	 * @param text the text
	 * @param deprecated the deprecated
	 * @param discussionId the discussion id
	 */
    public CommentsBean(int commentId, String commentedBy, Date commentDt, int noOfLikes, byte[] image, String video,
            String text, String deprecated, int discussionId) {
	    super();
	    this.commentId = commentId;
	    this.commentedBy = commentedBy;
	    this.commentDt = commentDt;
	    this.noOfLikes = noOfLikes;
	    this.image = image;
	    this.video = video;
	    this.text = text;
	    this.deprecated = deprecated;
	    this.discussionId = discussionId;
    }
	
	/**
	 * Gets the comment id.
	 *
	 * @return the commentId
	 */
	public int getCommentId() {
		return commentId;
	}
	
	/**
	 * Sets the comment id.
	 *
	 * @param commentId the commentId to set
	 */
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	
	/**
	 * Gets the commented by.
	 *
	 * @return the commentedBy
	 */
	public String getCommentedBy() {
		return commentedBy;
	}
	
	/**
	 * Sets the commented by.
	 *
	 * @param commentedBy the commentedBy to set
	 */
	public void setCommentedBy(String commentedBy) {
		this.commentedBy = commentedBy;
	}
	
	/**
	 * Gets the comment dt.
	 *
	 * @return the commentDt
	 */
	public Date getCommentDt() {
		return commentDt;
	}
	
	/**
	 * Sets the comment dt.
	 *
	 * @param commentDt the commentDt to set
	 */
	public void setCommentDt(Date commentDt) {
		this.commentDt = commentDt;
	}
	
	/**
	 * Gets the no of likes.
	 *
	 * @return the noOfLikes
	 */
	public int getNoOfLikes() {
		return noOfLikes;
	}
	
	/**
	 * Sets the no of likes.
	 *
	 * @param noOfLikes the noOfLikes to set
	 */
	public void setNoOfLikes(int noOfLikes) {
		this.noOfLikes = noOfLikes;
	}
	
	
	
	/**
	 * @return the image
	 */
	public byte[] getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(byte[] image) {
		this.image = image;
	}

	/**
	 * Gets the video.
	 *
	 * @return the video
	 */
	public String getVideo() {
		return video;
	}
	
	/**
	 * Sets the video.
	 *
	 * @param video the video to set
	 */
	public void setVideo(String video) {
		this.video = video;
	}
	
	/**
	 * Gets the text.
	 *
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	
	/**
	 * Sets the text.
	 *
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}
	
	/**
	 * Gets the deprecated.
	 *
	 * @return the deprecated
	 */
	public String getDeprecated() {
		return deprecated;
	}
	
	/**
	 * Sets the deprecated.
	 *
	 * @param deprecated the deprecated to set
	 */
	public void setDeprecated(String deprecated) {
		this.deprecated = deprecated;
	}
	
	/**
	 * Gets the discussion id.
	 *
	 * @return the discussionId
	 */
	public int getDiscussionId() {
		return discussionId;
	}
	
	/**
	 * Sets the discussion id.
	 *
	 * @param discussionId the discussionId to set
	 */
	public void setDiscussionId(int discussionId) {
		this.discussionId = discussionId;
	}

  /**
   * @return the commenter
   */
  public UserBean getCommenter() {
    return commenter;
  }

  /**
   * @param commenter the commenter to set
   */
  public void setCommenter(UserBean commenter) {
    this.commenter = commenter;
  }

  /**
   * @return the encodedImage
   */
  public String getEncodedImage() {
    return encodedImage;
  }

  /**
   * @param encodedImage the encodedImage to set
   */
  public void setEncodedImage(String encodedImage) {
    this.encodedImage = encodedImage;
  }
	
}
