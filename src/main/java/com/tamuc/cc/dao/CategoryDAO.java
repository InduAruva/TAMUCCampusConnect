package com.tamuc.cc.dao;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.tamuc.cc.bean.CategoryBean;
import com.tamuc.cc.constants.GlobalConstants;

// TODO: Auto-generated Javadoc
/**
 * The Class CategoryDAO.
 *
 * @author TAMUCCampusConnect
 */
@Repository("categoryDAO")
public class CategoryDAO extends AbstractDAO {

  /**
   * Adds the category.
   *
   * @param bean the bean
   * @return true, if successful
   */
	public boolean addCategory(CategoryBean categoryBean) {
		categoryBean.setCategoryCd(generateCategoryCode());
		StringBuilder query = new StringBuilder("INSERT INTO ").append(AbstractDAO.CATEGORY_TABLE)
		        .append("(CATEGORY_CD,DESCRIPTION,CREATED_DT,CREATED_BY,ACTIVE,CATEGORY_NAME)").append(" VALUES ")
		        .append("(? ,? ,NOW(),? ,'Y',?)");
		getJdbcTemplate().update(query.toString(), categoryBean.getCategoryCd(), categoryBean.getDescription(),
		        categoryBean.getCreatedBy(), categoryBean.getCategoryName());
		return true;
	}

  /**
   * Update category.
   *
   * @param bean the bean
   * @return true, if successful
   */
  public boolean updateCategory(CategoryBean categoryBean) {
		StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.CATEGORY_TABLE)
		        .append(" SET DESCRIPTION= ?, ACTIVE = ?, CATEGORY_NAME = ?")
		        .append(" WHERE CATEGORY_CD= ?");
		getJdbcTemplate().update(query.toString(), categoryBean.getDescription(), categoryBean.getActive(),
				categoryBean.getCategoryName(), categoryBean.getCategoryCd());
    return true;
  }

  /**
   * Delete category.
   *
   * @param bean the bean
   * @return true, if successful
   */
  public boolean deleteCategory(CategoryBean categoryBean) {
	  StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.CATEGORY_TABLE)
	        .append(" SET  ACTIVE = 'N'")
	        .append(" WHERE CATEGORY_CD= ?");
	getJdbcTemplate().update(query.toString(),
			categoryBean.getCategoryCd());
    return true;
  }

  /**
   * Search category.
   *
   * @param bean the bean
   * @return the category bean
   */
  public List<CategoryBean> searchCategory(CategoryBean categoryBean) {
    List<CategoryBean> fetchedCats = null;
    StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.CATEGORY_TABLE);
    StringBuilder whereClause = new StringBuilder("");
    if(categoryBean!=null){
     
    	if (categoryBean.getCategoryCd() != null && !categoryBean.getCategoryCd().isEmpty()) {
			if (whereClause.length() <= 0) {
				whereClause.append(GlobalConstants.WHERE_CLAUSE);
			} else {
				whereClause.append(GlobalConstants.AND);
			}
			whereClause.append(" CATEGORY_CD = '");
			whereClause.append(categoryBean.getCategoryCd());
			whereClause.append(GlobalConstants.SINGLE_QUOT);
		}
    	
    	if (categoryBean.getCategoryName() != null && !categoryBean.getCategoryName().isEmpty()) {
			if (whereClause.length() <= 0) {
				whereClause.append(GlobalConstants.WHERE_CLAUSE);
			} else {
				whereClause.append(GlobalConstants.AND);
			}
			whereClause.append(" CATEGORY_NAME LIKE '");
			whereClause.append(categoryBean.getCategoryName());
			whereClause.append(GlobalConstants.SINGLE_QUOT);
		}
    	
    	if (categoryBean.getDescription() != null && !categoryBean.getDescription().isEmpty()) {
			if (whereClause.length() <= 0) {
				whereClause.append(GlobalConstants.WHERE_CLAUSE);
			} else {
				whereClause.append(GlobalConstants.AND);
			}
			whereClause.append(" DESCRIPTION = '");
			whereClause.append(categoryBean.getDescription());
			whereClause.append(GlobalConstants.SINGLE_QUOT);
		}
    	
    	if (categoryBean.getActive() != null && !categoryBean.getActive().isEmpty()) {
			if (whereClause.length() <= 0) {
				whereClause.append(GlobalConstants.WHERE_CLAUSE);
			} else {
				whereClause.append(GlobalConstants.AND);
			}
			whereClause.append(" ACTIVE = '");
			whereClause.append(categoryBean.getActive());
			whereClause.append(GlobalConstants.SINGLE_QUOT);
		}
    }
    if (whereClause.length() > 0) {
      query.append(GlobalConstants.SPACE_STRING).append(whereClause);
    }
    fetchedCats = (List<CategoryBean>) getJdbcTemplate().query(query.toString(),
        new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));
    return fetchedCats;
  }

  public boolean updateActiveSwitch(String catCd, String active){
	  StringBuilder query = new StringBuilder("UPDATE ").append(AbstractDAO.CATEGORY_TABLE)
		        .append(" SET  ACTIVE = ?")
		        .append(" WHERE CATEGORY_CD= ?");
		getJdbcTemplate().update(query.toString(), active, catCd);
	    return true;
  }
  
  
  public CategoryBean fetechCategoryByName(String catCd) {
	  try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.CATEGORY_TABLE).append(
			        " WHERE CATEGORY_NAME LIKE ? ");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { catCd },
			        new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
  }
  
  /**
   * fetch Active Categories 
   * @return
   */
	public List<CategoryBean> fetchActiveCategories() {
		try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.CATEGORY_TABLE).append(
			        " WHERE ACTIVE='Y' ");
			return (List<CategoryBean>) getJdbcTemplate().query(query.toString(),
			        new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
  
  public CategoryBean fetchCategoryByCode(String catCd) {
	  try {
			StringBuilder query = new StringBuilder("SELECT * FROM ").append(AbstractDAO.CATEGORY_TABLE).append(
			        " WHERE CATEGORY_CD=? ");
			return getJdbcTemplate().queryForObject(query.toString(), new Object[] { catCd },
			        new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
  }
/*  public String fetchLatestCategoryCd() {
	  try {
			StringBuilder query = new StringBuilder("SELECT CATEGORY_CD FROM ").append(AbstractDAO.CATEGORY_TABLE).append(
			        " ORDER BY CREATED_DT DESC ");
			return getJdbcTemplate().queryForObject(query.toString(),
			        new BeanPropertyRowMapper<String>(String.class));

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
  }*/
  
  public Integer fetchLatestCategoryCd() {
	  try {
			StringBuilder query = new StringBuilder("SELECT COUNT(1) FROM ").append(AbstractDAO.CATEGORY_TABLE);
			return getJdbcTemplate().queryForObject(query.toString(), null, Integer.class);

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
  }
  public String fetchCategoryByCategoryCd( String categoryCd) {
	  try {
			StringBuilder query = new StringBuilder("SELECT CATEGORY_CD FROM ").append(AbstractDAO.CATEGORY_TABLE).append(
			        " WHERE CATEGORY_NAME LIKE ?  ");
			return getJdbcTemplate().queryForObject(query.toString(), new Object [] { categoryCd },
			        new BeanPropertyRowMapper<String>(String.class));

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
  }
  
	private String generateCategoryCode() {
		Integer catCd = fetchLatestCategoryCd();
		catCd = catCd + 1;
		return "C" + catCd;

	}

}
