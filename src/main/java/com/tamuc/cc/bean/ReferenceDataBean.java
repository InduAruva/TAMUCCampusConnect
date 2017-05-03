/**
 * 
 */
package com.tamuc.cc.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

// TODO: Auto-generated Javadoc
/**
 * The Class ReferenceDataBean.
 *
 * @author LeaveManagementApplication
 */

public class ReferenceDataBean {

	/** The reference data map. */
	public static Map<String, List<ReferenceTableBean>> referenceDataMap =
			new HashMap<String, List<ReferenceTableBean>>();

	/** The user map. */
	private static Map<String, UserBean> userMap = new HashMap<String, UserBean>();

	/** The Category map. */
	private static Map<String, CategoryBean> categoryMap = new HashMap<String, CategoryBean>();
	
	/** The Thread map. */
	private static Map<String, ThreadBean> threadMap = new HashMap<String, ThreadBean>();

	/**
	 * Gets the reference data map.
	 *
	 * @return the reference data map
	 */
	public Map<String, List<ReferenceTableBean>> getReferenceDataMap() {
		return referenceDataMap;
	}

	/**
	 * Sets the reference data map.
	 *
	 * @param referenceDataMap the reference data map
	 */
	public void setReferenceDataMap(Map<String, List<ReferenceTableBean>> referenceDataMap) {
		ReferenceDataBean.referenceDataMap = referenceDataMap;
	}

	/**
	 * Gets the user map.
	 *
	 * @return the user map
	 */
	public Map<String, UserBean> getUserMap() {
		return userMap;
	}

	/**
	 * Sets the user map.
	 *
	 * @param userMap the user map
	 */
	public void setUserMap(Map<String, UserBean> userMap) {
		ReferenceDataBean.userMap = userMap;
	}

	public Map<String, CategoryBean> getCategoryMap() {
	    return categoryMap;
    }

	public void setCategoryMap(Map<String, CategoryBean> categoryMap) {
	    ReferenceDataBean.categoryMap = categoryMap;
    }

	/**
	 * @return the threadMap
	 */
    public Map<String, ThreadBean> getThreadMap() {
	    return threadMap;
    }

	/**
	 * @param threadMap the threadMap to set
	 */
    public void setThreadMap(Map<String, ThreadBean> threadMap) {
	    ReferenceDataBean.threadMap = threadMap;
    }
	
}
