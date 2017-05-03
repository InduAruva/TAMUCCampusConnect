package com.tamuc.cc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tamuc.cc.bean.DiscussionBean;
import com.tamuc.cc.bean.ThreadBean;
import com.tamuc.cc.dao.ThreadDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class ThreadService.
 *
 * @author TAMUCCampusConnect
 */
@Service("threadService")
public class ThreadService {

	/** The Thread dao. */
	@Autowired
	private ThreadDAO threadDAO;

	/**
	 * Adds the Thread.
	 *
	 * @param bean the bean
	 * @return true, if successful
	 */
	public boolean addThread(ThreadBean bean) {
		return threadDAO.addThread(bean);
	}

	/**
	 * Update Thread.
	 *
	 * @param bean the bean
	 * @return true, if successful
	 */
	public boolean updateThread(ThreadBean bean) {
		return threadDAO.updateThread(bean);
	}

	/**
	 * Delete Thread.
	 *
	 * @param bean the bean
	 * @return true, if successful
	 */
	public boolean deleteThread(ThreadBean bean) {
		return threadDAO.deleteThread(bean);
	}
	
	/**
	 * fetch Active Threads
	 * 
	 * @return
	 */
	public List<ThreadBean> fetchActiveThreads() {
		return threadDAO.fetchActiveThreads();
	}
	
	/**
	 * @param topic
	 * @return
	 */
    public ThreadBean fetchThreadByName(String topic) {
	    return threadDAO.fetchThreadByName(topic);
    }
    
    /**
	 * @param topic
	 * @return
	 */
	public ThreadBean fetchThreadById(int threadId) {
		return threadDAO.fetchThreadById(threadId);
	}

	/**
	 * Search Thread.
	 *
	 * @param bean the bean
	 * @return the Thread bean
	 */
	public List<ThreadBean> searchThread(ThreadBean bean) {
		return threadDAO.searchThread(bean);
	}
	
	/**
	 * Fetch active threads for category.
	 *
	 * @param catCd
	 *            the cat cd
	 * @return the int
	 */
	public int fetchActiveThreadsForCategory(String catCd) {
		return threadDAO.fetchActiveThreadsForCategory(catCd);
	}

	public Map<String,String> fetchActiveThreadsForCategory(List<String> catCd) {
	  return threadDAO.fetchActiveThreadsForCategory(catCd);
	}
	
	public List<ThreadBean> populateActiveDiscussions(List<ThreadBean> list,Map<String,String> active){
	  for(ThreadBean bean : list){
	    if(active.containsKey(String.valueOf(bean.getThreadId()))){
	      bean.setActiveDiscussion(Integer.parseInt(active.get(String.valueOf(bean.getThreadId()))));
	    }
	    else{
	      bean.setActiveDiscussion(0);
	    }

	  }
	  return list;
	}
	
	public List<ThreadBean> populateActiveDiscussions(List<ThreadBean> list,List<DiscussionBean> discussionList){
      for(ThreadBean bean : list){
        List<DiscussionBean> discList = new ArrayList<DiscussionBean>();
        for(DiscussionBean disc : discussionList){
          if(disc.getThreadId()==bean.getThreadId()){
            discList.add(disc);
          }
        } 
        bean.setDiscussionLst(discList);
      }
      return list;
    }
	
	public List<ThreadBean> fetchThreadByThreadIds(Set<String> threadSet) {
	  return threadDAO.fetchThreadByThreadIds(threadSet);
	}
	
}
