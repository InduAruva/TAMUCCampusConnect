package com.tamuc.cc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tamuc.cc.bean.DiscussionBean;
import com.tamuc.cc.dao.DiscussionDAO;

/**
 * The Class DiscussionService.
 *
 * @author TAMUCCampusConnect
 */
@Service("discussionService")
public class DiscussionService {

	/** The Discussion dao. */
	@Autowired
	private DiscussionDAO discussionDAO;

	/**
	 * Adds the Discussion.
	 *
	 * @param bean the bean
	 * @return true, if successful
	 */
	public boolean addDiscussion(DiscussionBean bean) {
		return discussionDAO.addDiscussion(bean);
	}

	/**
	 * Update Discussion.
	 *
	 * @param bean the bean
	 * @return true, if successful
	 */
	public boolean updateDiscussion(DiscussionBean bean) {
		return discussionDAO.updateDiscussion(bean);
	}

	/**
	 * Delete Discussion.
	 *
	 * @param bean the bean
	 * @return true, if successful
	 */
	public boolean deleteDiscussion(DiscussionBean bean) {
		return discussionDAO.deleteDiscussion(bean);
	}
	
	/**
	 * fetch Active Discussions
	 * 
	 * @return
	 */
	public List<DiscussionBean> fetchActiveDiscussions() {
		return discussionDAO.fetchActiveDiscussions();
	}

	/**
	 * Search Discussion.
	 *
	 * @param bean the bean
	 * @return the Discussion bean
	 */
	public List<DiscussionBean> searchDiscussion(DiscussionBean bean) {
		return discussionDAO.searchDiscussion(bean);
	}
	
	public DiscussionBean fetechDiscussionByNameAndThreadId(String message, int threadId) {
		return discussionDAO.fetechDiscussionByNameAndThreadId(message, threadId);
	}
	/**
	 * Fetch active discussions for thread.
	 *
	 * @param threadId
	 *            the thread id
	 * @return the int
	 */
	public List<DiscussionBean> fetchActiveDiscussionsForThread(int threadId) {
		return discussionDAO.fetchActiveDiscussionsForThread(threadId);
	}
	
	public Map<String,String> fetchActiveDiscussionsForThread(List<String> threadList) {
	  return discussionDAO.fetchActiveDiscussionsForThread(threadList);
	}
	
	
	public List<DiscussionBean> populateComments(List<DiscussionBean> list,Map<String,String> active){
      for(DiscussionBean bean : list){
        if(active.containsKey(String.valueOf(bean.getDiscussionId()))){
          bean.setNoOfComments(Integer.parseInt(active.get(String.valueOf(bean.getDiscussionId()))));
        }
        else{
          bean.setNoOfComments(0);
        }

      }
      return list;
    }
	
	public boolean acceptComment(int commentId,int discussionId) {
	  return discussionDAO.acceptComment(commentId, discussionId);
	}

	/**
	 * @param discussionId
	 * @return
	 */
    public DiscussionBean fetchDiscussionById(int discussionId) {
	    return discussionDAO.fetchDiscussionById(discussionId);
    }

}
