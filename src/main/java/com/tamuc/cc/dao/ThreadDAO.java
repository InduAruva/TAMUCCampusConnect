/**
 * 
 */
package com.tamuc.cc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.tamuc.cc.bean.ThreadBean;
import com.tamuc.cc.constants.GlobalConstants;

// TODO: Auto-generated Javadoc
/**
 * The Class ThreadDAO.
 *
 * @author TAMUCCampusConnect
 */
@Repository("threadDAO")
public class ThreadDAO extends AbstractDAO {
  /**
   * Adds the Thread.
   *
   * @param bean the bean
   * @return true, if successful
   */
	public boolean addThread(ThreadBean threadBean) {
		StringBuilder query = new StringBuilder("INSERT INTO ").append(AbstractDAO.THREAD_TABLE)
		        .append("(TOPIC,DESCRIPTION,CATEGORY_CD,STARTED_BY,START_DT,STATUS)").append(" VALUES ")
		        .append("(? ,? ,? ,? ,NOW(),'Y')");
		getJdbcTemplate().update(query.toString(), threadBean.getTopic(), threadBean.getDescription(),
		        threadBean.getCategoryCd(), threadBean.getStartedBy());
		return true;
	}

	/**
	 * Update Thread.
	 *
	 * @param bean
	 *            the bean
	 * @return true, if successful
	 */
	public boolean updateThread(ThreadBean threadBean) {
		StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.THREAD_TABLE)
		        .append(" SET DESCRIPTION= ?, STATUS = ?, CATEGORY_CD = ?, TOPIC = ?").append(" WHERE THREAD_ID= ?");
		getJdbcTemplate().update(query.toString(), threadBean.getDescription(), threadBean.getStatus(),
		        threadBean.getCategoryCd(), threadBean.getTopic(), threadBean.getThreadId());
		return true;
	}

  /**
   * Delete Thread.
   *
   * @param bean the bean
   * @return true, if successful
   */
  public boolean deleteThread(ThreadBean bean) {
    return false;
  }

  
  /**
	 * @param topic
	 * @return
	 */
  public ThreadBean fetchThreadByName(String topic) {
	  try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.THREAD_TABLE).append(
			        " WHERE TOPIC=? ");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { topic },
			        new BeanPropertyRowMapper<ThreadBean>(ThreadBean.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
  }
  
  /**
	 * @param topic
	 * @return
	 */
  public ThreadBean fetchThreadById(int threadId) {
	  try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.THREAD_TABLE).append(
			        " WHERE THREAD_ID=? ");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { threadId },
			        new BeanPropertyRowMapper<ThreadBean>(ThreadBean.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
  }
  
  /**
   * fetch Active Threads 
   * @return
   */
	public List<ThreadBean> fetchActiveThreads() {
		try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.THREAD_TABLE).append(
			        " WHERE STATUS='Y' ");
			return (List<ThreadBean>) getJdbcTemplate().query(query.toString(),
			        new BeanPropertyRowMapper<ThreadBean>(ThreadBean.class));

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
  
  /**
   * Search Thread.
   *
   * @param bean the bean
   * @return the Thread beanO
   */
  public List<ThreadBean> searchThread(ThreadBean bean) {
    List<ThreadBean> fetchedThreads = null;
    StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.THREAD_TABLE);
    StringBuilder whereClause = new StringBuilder("");
    if(bean!=null){
      if (bean.getCategoryCd() != null && !bean.getCategoryCd().isEmpty()) {
        if (whereClause.length() <= 0) {
          whereClause.append(GlobalConstants.WHERE_CLAUSE);
        } else {
          whereClause.append(GlobalConstants.AND);
        }
        whereClause.append(" CATEGORY_CD = '");
        whereClause.append(bean.getCategoryCd());
        whereClause.append(GlobalConstants.SINGLE_QUOT);
      }
      if (bean.getTopic() != null && !bean.getTopic().isEmpty()) {
          if (whereClause.length() <= 0) {
            whereClause.append(GlobalConstants.WHERE_CLAUSE);
          } else {
            whereClause.append(GlobalConstants.AND);
          }
          whereClause.append(" TOPIC LIKE '");
          whereClause.append(bean.getTopic());
          whereClause.append(GlobalConstants.SINGLE_QUOT);
        }
      if (bean.getStatus() != null  && !bean.getStatus().isEmpty()) {
        if (whereClause.length() <= 0) {
          whereClause.append(GlobalConstants.WHERE_CLAUSE);
        } else {
          whereClause.append(GlobalConstants.AND);
        }
        whereClause.append(" STATUS = '");
        whereClause.append(bean.getStatus());
        whereClause.append(GlobalConstants.SINGLE_QUOT);
      }
    }
    if (whereClause.length() > 0) {
      query.append(GlobalConstants.SPACE_STRING).append(whereClause);
    }
    query.append(" ORDER BY START_DT DESC");
    fetchedThreads = (List<ThreadBean>) getJdbcTemplate().query(query.toString(),
        new BeanPropertyRowMapper<ThreadBean>(ThreadBean.class));
    return fetchedThreads;
  }

  /**
   * Fetch active threads for category.
   *
   * @param catCd the cat cd
   * @return the int
   */
	public int fetchActiveThreadsForCategory(String catCd) {
		try {
			StringBuilder query = new StringBuilder("SELECT COUNT(1) FROM ").append(AbstractDAO.THREAD_TABLE).append(
			        " WHERE CATEGORY_CD = ? and STATUS = 'Y' ");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { catCd },
			        new BeanPropertyRowMapper<Integer>(Integer.class));

		} catch (EmptyResultDataAccessException e) {
			return GlobalConstants.INVALID_VALUE;
		}
	}

	
	public Map<String,String> fetchActiveThreadsForCategory(List<String> catList) {
	  Map<String,String> catActiveThreads = new HashMap<>();
	  try {
	    StringBuffer catCds = new StringBuffer();
	    int i = 1;
	    if(catList !=null && !catList.isEmpty()){
	      for(String cat : catList){
	        catCds.append("'").append(cat).append("'");
	        if(i<catList.size()){
	          catCds.append(",");
	        }
	        i++;
	      }
	    }      
	    else{
	      return catActiveThreads;
	    }

	    StringBuilder query = new StringBuilder("SELECT CATEGORY_CD,COUNT(1) AS ACTIVE_THREAD FROM ").append(AbstractDAO.THREAD_TABLE).append(
	        " WHERE CATEGORY_CD IN ( ").append(catCds).append(") and STATUS = 'Y' GROUP BY CATEGORY_CD");
	    List<Map<String, Object>> rows = getJdbcTemplate().queryForList(query.toString());
	    for(Map<String, Object> map : rows){
	      catActiveThreads.put(map.get("CATEGORY_CD").toString(),map.get("ACTIVE_THREAD").toString());
	    }

	    return catActiveThreads;
	  } catch (EmptyResultDataAccessException e) {
	    return catActiveThreads;
	  }
	}
	
	
	public List<ThreadBean> fetchThreadByThreadIds(Set<String> threadSet) {
	  List<ThreadBean> threadList = null;
      try {
        StringBuffer threadIds = new StringBuffer();
        int i = 1;
        if(threadSet !=null && !threadSet.isEmpty()){
          for(String cat : threadSet){
            threadIds.append("'").append(cat).append("'");
            if(i<threadSet.size()){
              threadIds.append(",");
            }
            i++;
          }
        }      
        else{
          return threadList;
        }

        StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.THREAD_TABLE).append(
            " WHERE THREAD_ID IN (").append(threadIds).append(")");
        threadList = (List<ThreadBean>) getJdbcTemplate().query(query.toString(),
            new BeanPropertyRowMapper<ThreadBean>(ThreadBean.class));
        return threadList;
      } catch (EmptyResultDataAccessException e) {
        return threadList;
      }
    }

}
