package com.tamuc.cc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tamuc.cc.bean.CategoryBean;
import com.tamuc.cc.dao.CategoryDAO;

// TODO: Auto-generated Javadoc
/**
 * The Class CategoryService.
 *
 * @author TAMUCCampusConnect
 */
@Service("categoryService")
public class CategoryService {

	/** The category dao. */
	@Autowired
	private CategoryDAO categoryDAO;

	/**
	 * Adds the category.
	 *
	 * @param bean the bean
	 * @return true, if successful
	 */
	public boolean addCategory(CategoryBean bean) {
		return categoryDAO.addCategory(bean);
	}

	/**
	 * Update category.
	 *
	 * @param bean the bean
	 * @return true, if successful
	 */
	public boolean updateCategory(CategoryBean bean) {
		return categoryDAO.updateCategory(bean);
	}

	/**
	 * Delete category.
	 *
	 * @param bean the bean
	 * @return true, if successful
	 */
	public boolean deleteCategory(CategoryBean bean) {
		return categoryDAO.deleteCategory(bean);
	}

	/**
	 * Search category.
	 *
	 * @param bean the bean
	 * @return the category bean
	 */
	public List<CategoryBean> searchCategory(CategoryBean bean) {
		return categoryDAO.searchCategory(bean);
	}

	public List<CategoryBean> fetchActiveCategories() {
		return categoryDAO.fetchActiveCategories();
	}
	
	public boolean markActiveInactive(CategoryBean bean){
	  return categoryDAO.updateActiveSwitch(bean.getCategoryCd(), bean.getActive());
	}

	public CategoryBean fetechCategoryByName(String catCd) {
		return categoryDAO.fetechCategoryByName(catCd);
	}
	
	public List<CategoryBean> populateActiveThreads(List<CategoryBean> catList,Map<String,String> activeThreads){
		   for(CategoryBean bean : catList){
		     if(activeThreads.containsKey(bean.getCategoryCd())){
		       bean.setActiveThreads(Integer.valueOf(activeThreads.get(bean.getCategoryCd())));
		     }
		     else{
		       bean.setActiveThreads(0);
		     }
		    
		   }
		   return catList;
		}

	/**
	 * @param categoryCd
	 * @return
	 */
    public CategoryBean fetchCategoryByCode(String categoryCd) {
	    return categoryDAO.fetchCategoryByCode(categoryCd);
    }
}
