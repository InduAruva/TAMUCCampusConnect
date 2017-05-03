/**
 * 
 */
package com.tamuc.cc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tamuc.cc.bean.CategoryBean;
import com.tamuc.cc.bean.ReferenceDataBean;
import com.tamuc.cc.bean.ReferenceTableBean;
import com.tamuc.cc.bean.ThreadBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.dao.ReferenceDataDAO;
import com.tamuc.cc.utilities.LoggerInterface;

// TODO: Auto-generated Javadoc
/**
 * The Class ReferenceDataDelegate.
 *
 * @author TAMUCCampusConnect
 */
@Component
public class ReferenceDataService implements LoggerInterface {

  /** The reference data bean. */
  private static ReferenceDataBean referenceDataBean;

  /** The reference data service. */
  @Autowired
  private ReferenceDataDAO referenceDataDAO;

  /** The user service. */
  @Autowired
  private UserService userService;
  
  @Autowired
  private CategoryService categoryService;
  
  @Autowired
  private ThreadService threadService;

  static {
    referenceDataBean = new ReferenceDataBean();
  }

  /**
   * This method fetches the data for reference tables from the database at the server startup and
   * stores it in referenceMap of ReferenceDataBean.
   * 
   */
  @Autowired
  public void setReferenceDataBean() {
    Map<String, List<ReferenceTableBean>> refDataMap =
        new HashMap<String, List<ReferenceTableBean>>();
   List<String> refTableNames = referenceDataDAO.loadRefTableNames();
    for (String refTableName : refTableNames) {
      List<ReferenceTableBean> list = referenceDataDAO.fetchReferenceTableData(refTableName);
      refDataMap.put(refTableName.toUpperCase(), list);
      ReferenceDataBean.referenceDataMap.put(refTableName, list);
      applicationLogger.debug("REFERENCE DATE LOADED FOR TABLE :: " + refTableName);
    }
  
    referenceDataBean.setReferenceDataMap(refDataMap);
    // Fetch all users and set in userMap
     List<UserBean> userList = userService.fetchUsers(null);
    Map<String, UserBean> userMap = new HashMap<>();
    for (UserBean user : userList) {
      userMap.put(user.getUserName(), user);
    }
    referenceDataBean.setUserMap(userMap);
    
    List<CategoryBean> catList = categoryService.fetchActiveCategories();
    Map<String, CategoryBean> catMap = new HashMap<>();
    for (CategoryBean categoryBean : catList) {
      catMap.put(categoryBean.getCategoryCd(), categoryBean);
    }
    referenceDataBean.setCategoryMap(catMap);
    
    List<ThreadBean> threadList = threadService.fetchActiveThreads();
    Map<String, ThreadBean> threadMap = new HashMap<>();
    for (ThreadBean threadBean : threadList) {
    	threadMap.put(String.valueOf(threadBean.getThreadId()), threadBean);
    }
    referenceDataBean.setThreadMap(threadMap);
  }

  

  /**
   * Gets the reference data.
   *
   * @param refTableName the ref table name
   * @return the reference data
   */
  public static List<ReferenceTableBean> getReferenceData(String refTableName) {
    return referenceDataBean.getReferenceDataMap().get(refTableName.toUpperCase());
  }

  /**
   * Gets the user full name.
   *
   * @return the user full name
   */
  public static Map<String, UserBean> getUserMap() {
    return referenceDataBean.getUserMap();
  }

  /**
   * Sets the user map.
   *
   * @param userMap the user map
   */
  public static void setUserMap(Map<String, UserBean> userMap) {
    referenceDataBean.setUserMap(userMap);
  }
  
  /**
   * Gets the user full name.
   *
   * @return the user full name
   */
  public static Map<String, CategoryBean> getCategoryMap() {
    return referenceDataBean.getCategoryMap();
  }

  /**
   * Sets the user map.
   *
   * @param userMap the user map
   */
  public static void setCategoryMap(Map<String, CategoryBean> categoryMap) {
    referenceDataBean.setCategoryMap(categoryMap);
  }


  /**
   * Sets the user map.
   *
   * @param userMap the user map
   */
  public static void setThreadMap(Map<String, ThreadBean> threadMap) {
    referenceDataBean.setThreadMap(threadMap);
  }
  
  /**
   * Gets the user full name.
   *
   * @return the user full name
   */
  public static Map<String, ThreadBean> getThreadMap() {
    return referenceDataBean.getThreadMap();
  }

  /**
   * Gets the description by code.
   *
   * @param code the code
   * @param refTableName the ref table name
   * @return the description by code
   */
  public static String getDescriptionByCode(String code, String refTableName) {

    List<ReferenceTableBean> refData =
        referenceDataBean.getReferenceDataMap().get(refTableName.toUpperCase());
    for (ReferenceTableBean bean : refData) {
      if (code.equals(bean.getCode())) {
        return bean.getDescription();
      }
    }
    return "";
  }



}
