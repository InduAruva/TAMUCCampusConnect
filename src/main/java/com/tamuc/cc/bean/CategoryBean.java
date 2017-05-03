package com.tamuc.cc.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

// TODO: Auto-generated Javadoc
/**
 * The Class CategoryBean.
 *
 * @author TAMUCCampusConnect
 */
public class CategoryBean implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The category cd. */
	private String categoryCd;

	/** The description. */
	private String description;

	/** The created dt. */
	private Date createdDt;

	/** The created by. */
	private String createdBy;

	/** The active. */
	private String active;

	/** The active threads. */
	private int activeThreads;

	private String validationType;
	
	private String categoryName;
	
	private List<ThreadBean> threadList;

	/**
	 * Instantiates a new category bean.
	 */
	public CategoryBean() {
		super();
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
	 * @param categoryCd
	 * @param description
	 * @param createdDt
	 * @param createdBy
	 * @param active
	 * @param activeThreads
	 * @param validationType
	 * @param categoryName
	 */
    public CategoryBean(String categoryCd, String description, Date createdDt, String createdBy, String active,
            int activeThreads, String validationType, String categoryName) {
	    super();
	    this.categoryCd = categoryCd;
	    this.description = description;
	    this.createdDt = createdDt;
	    this.createdBy = createdBy;
	    this.active = active;
	    this.activeThreads = activeThreads;
	    this.validationType = validationType;
	    this.categoryName = categoryName;
    }

	/**
	 * Sets the category cd.
	 *
	 * @param categoryCd
	 *            the categoryCd to set
	 */
	public void setCategoryCd(String categoryCd) {
		this.categoryCd = categoryCd;
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
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Gets the created dt.
	 *
	 * @return the createdDt
	 */
	public Date getCreatedDt() {
		return createdDt;
	}

	/**
	 * Sets the created dt.
	 *
	 * @param createdDt
	 *            the createdDt to set
	 */
	public void setCreatedDt(Date createdDt) {
		this.createdDt = createdDt;
	}

	/**
	 * Gets the created by.
	 *
	 * @return the createdBy
	 */
	public String getCreatedBy() {
		return createdBy;
	}

	/**
	 * Sets the created by.
	 *
	 * @param createdBy
	 *            the createdBy to set
	 */
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
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
	 * @param active
	 *            the active to set
	 */
	public void setActive(String active) {
		this.active = active;
	}

	/**
	 * Gets the active threads.
	 *
	 * @return the activeThreads
	 */
	public int getActiveThreads() {
		return activeThreads;
	}

	/**
	 * Sets the active threads.
	 *
	 * @param activeThreads
	 *            the activeThreads to set
	 */
	public void setActiveThreads(int activeThreads) {
		this.activeThreads = activeThreads;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof CategoryBean))
			return false;
		CategoryBean other = (CategoryBean) obj;
		if (active != other.active)
			return false;
		if (activeThreads != other.activeThreads)
			return false;
		if (categoryCd == null) {
			if (other.categoryCd != null)
				return false;
		} else if (!categoryCd.equals(other.categoryCd))
			return false;
		if (createdBy == null) {
			if (other.createdBy != null)
				return false;
		} else if (!createdBy.equals(other.createdBy))
			return false;
		if (createdDt == null) {
			if (other.createdDt != null)
				return false;
		} else if (!createdDt.equals(other.createdDt))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CategoryBean [categoryCd=" + categoryCd + ", description=" + description + ", createdDt=" + createdDt
		        + ", createdBy=" + createdBy + ", active=" + active + ", activeThreads=" + activeThreads + "]";
	}

	public String getValidationType() {
		return validationType;
	}

	public void setValidationType(String validationType) {
		this.validationType = validationType;
	}

	public String getCategoryName() {
	    return categoryName;
    }

	public void setCategoryName(String categoryName) {
	    this.categoryName = categoryName;
    }

  /**
   * @return the threadList
   */
  public List<ThreadBean> getThreadList() {
    return threadList;
  }

  /**
   * @param threadList the threadList to set
   */
  public void setThreadList(List<ThreadBean> threadList) {
    this.threadList = threadList;
  }

}
