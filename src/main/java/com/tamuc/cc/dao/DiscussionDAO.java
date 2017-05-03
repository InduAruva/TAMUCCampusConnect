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

import com.tamuc.cc.bean.DiscussionBean;
import com.tamuc.cc.constants.GlobalConstants;

// TODO: Auto-generated Javadoc
/**
 * The Class DiscussionDAO.
 *
 * @author TAMUCCampusConnect
 */
@Repository("discussionDAO")
public class DiscussionDAO extends AbstractDAO {
	/**
	 * Adds the Discussion.
	 *
	 * @param bean
	 *            the bean
	 * @return true, if successful
	 */
	public boolean addDiscussion(DiscussionBean discussionBean) {
		StringBuilder query = new StringBuilder("INSERT INTO ").append(AbstractDAO.DISCUSSION_TABLE)
		        .append("(STARTED_DT,STARTED_BY,ACTIVE,MESSAGE,THREAD_ID)").append(" VALUES ")
		        .append("(NOW() ,? ,?,?,?)");
		getJdbcTemplate().update(query.toString(), discussionBean.getStartedBy(),discussionBean.getActive(), 
				discussionBean.getMessage(), discussionBean.getThreadId());

		return true;
	}

	/**
	 * Update Discussion.
	 *
	 * @param bean
	 *            the bean
	 * @return true, if successful
	 */
	public boolean updateDiscussion(DiscussionBean discussionBean) {
		StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.DISCUSSION_TABLE)
		        .append(" SET MESSAGE= ?, ACTIVE = ?").append(" WHERE DISCUSSION_ID= ?");
		getJdbcTemplate().update(query.toString(), discussionBean.getMessage(), discussionBean.getActive(),
				discussionBean.getDiscussionId());
		return true;
	}

	/**
	 * Delete Discussion.
	 *
	 * @param bean
	 *            the bean
	 * @return true, if successful
	 */
	public boolean deleteDiscussion(DiscussionBean bean) {
		return false;
	}

	/**
	 * fetch Active Discussions
	 * 
	 * @return
	 */
	public List<DiscussionBean> fetchActiveDiscussions() {
		try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.DISCUSSION_TABLE).append(
			        " WHERE ACTIVE !='I' ");
			return (List<DiscussionBean>) getJdbcTemplate().query(query.toString(),
			        new BeanPropertyRowMapper<DiscussionBean>(DiscussionBean.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	/**
	 * Search Discussion.
	 *
	 * @param bean
	 *            the bean
	 * @return the Discussion bean
	 */
	public List<DiscussionBean> searchDiscussion(DiscussionBean bean) {
		List<DiscussionBean> fetchedDiscussions = null;
		StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.DISCUSSION_TABLE);
		StringBuilder whereClause = new StringBuilder("");
		if (bean != null) {
			if (bean.getThreadId() != 0) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" THREAD_ID = '");
				whereClause.append(bean.getThreadId());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}
			if (bean.getDiscussionId() != 0) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" DISCUSSION_ID = '");
				whereClause.append(bean.getDiscussionId());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}
			if (bean.getAcceptedCommentId() != null && !bean.getAcceptedCommentId().isEmpty()) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" ACCEPTED_COMMENT_ID = '");
				whereClause.append(bean.getAcceptedCommentId());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}
			if (bean.getActive() != null && !bean.getActive().isEmpty()) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" ACTIVE = '");
				whereClause.append(bean.getActive());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}
			if (bean.getStartedBy() != null && !bean.getStartedBy().isEmpty()) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" STARTED_BY LIKE '");
				whereClause.append(bean.getStartedBy());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}
			if (bean.getMessage() != null && !bean.getMessage().isEmpty()) {
				if (whereClause.length() <= 0) {
					whereClause.append(GlobalConstants.WHERE_CLAUSE);
				} else {
					whereClause.append(GlobalConstants.AND);
				}
				whereClause.append(" MESSAGE LIKE '");
				whereClause.append(bean.getMessage());
				whereClause.append(GlobalConstants.SINGLE_QUOT);
			}
		}
		if (whereClause.length() > 0) {
			query.append(GlobalConstants.SPACE_STRING).append(whereClause);
		}
		query.append(" ORDER BY STARTED_DT DESC");
		fetchedDiscussions = (List<DiscussionBean>) getJdbcTemplate().query(query.toString(),
		        new BeanPropertyRowMapper<DiscussionBean>(DiscussionBean.class));
		return fetchedDiscussions;
	}

	/**
	 * 
	 * @param message
	 * @param threadId
	 * @return
	 */
	public DiscussionBean fetechDiscussionByNameAndThreadId(String message, int threadId) {
		try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.DISCUSSION_TABLE).append(
			        " WHERE MESSAGE=? AND THREAD_ID = ?");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { message, threadId },
			        new BeanPropertyRowMapper<DiscussionBean>(DiscussionBean.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public DiscussionBean fetchDiscussionById(int discussionId) {
		try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.DISCUSSION_TABLE).append(
			        " WHERE DISCUSSION_ID = ?");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { discussionId },
			        new BeanPropertyRowMapper<DiscussionBean>(DiscussionBean.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	/**
	 * Fetch active discussions for thread.
	 *
	 * @param threadId
	 *            the thread id
	 * @return the int
	 */
	public List<DiscussionBean> fetchActiveDiscussionsForThread(int threadId) {
		try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.DISCUSSION_TABLE)
			        .append(" WHERE THREAD_ID = ? and ACTIVE != 'I' ");
			return getJdbcTemplate().query(query.toString(), new Object[] { threadId },
					 new BeanPropertyRowMapper<DiscussionBean>(DiscussionBean.class));

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public Map<String, String> fetchActiveDiscussionsForThread(List<String> threadList) {
		Map<String, String> catActiveDiscussions = new HashMap<>();
		try {
			StringBuffer threadsStr = new StringBuffer();
			int i = 1;
			if (threadList != null && !threadList.isEmpty()) {
				for (String thread : threadList) {
					threadsStr.append("'").append(thread).append("'");
					if (i < threadList.size()) {
						threadsStr.append(",");
					}
					i++;
				}
			} else {
				return catActiveDiscussions;
			}

			StringBuilder query = new StringBuilder("SELECT THREAD_ID,COUNT(1) AS ACTIVE_COUNT FROM ")
			        .append(AbstractDAO.DISCUSSION_TABLE).append(" WHERE THREAD_ID IN ( ").append(threadsStr)
			        .append(") and ACTIVE = 'O' GROUP BY THREAD_ID");

			List<Map<String, Object>> rows = getJdbcTemplate().queryForList(query.toString());
			for (Map<String, Object> map : rows) {
				System.out.println(map.get("THREAD_ID"));
				System.out.println(map.get("ACTIVE_COUNT"));
				catActiveDiscussions.put(map.get("THREAD_ID").toString(), map.get("ACTIVE_COUNT").toString());
			}

			return catActiveDiscussions;
		} catch (EmptyResultDataAccessException e) {
			return catActiveDiscussions;
		}
	}

	public boolean acceptComment(int commentId, int discussionId) {
		StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.DISCUSSION_TABLE)
		        .append(" SET ACCEPTED_COMMENT_ID = ? , ACCEPTED_DT = NOW()").append(" WHERE DISCUSSION_ID= ?");
		getJdbcTemplate().update(query.toString(), commentId, discussionId);
		return true;
	}

}
