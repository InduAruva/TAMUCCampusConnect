/**
 * 
 */
package com.tamuc.cc.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.tamuc.cc.bean.ReferenceTableBean;

// TODO: Auto-generated Javadoc
/**
 * The Class ReferenceDataDAO.
 *
 * @author TAMUCCampusConnect
 */
@Repository
public class ReferenceDataDAO extends AbstractDAO {

  /**
   * Fetch reference table data.
   *
   * @param refTableName the ref table name
   * @return the list
   */
  public List<ReferenceTableBean> fetchReferenceTableData(String refTableName) {
    StringBuilder sql =
        new StringBuilder("SELECT * FROM ").append(refTableName)
            .append(" ORDER BY DESCRIPTION ASC");
    List<ReferenceTableBean> referenceData = new ArrayList<>();
    referenceData =
        getJdbcTemplate().query(sql.toString(),
            new BeanPropertyRowMapper<ReferenceTableBean>(ReferenceTableBean.class));
    return referenceData;
  }

  /**
   * This method loads the names of all the reference tables from Load ref table names.
   *
   * @return the list
   */
  public List<String> loadRefTableNames() {
    StringBuilder sql = new StringBuilder("SELECT * FROM ").append(RT_ALL_REF_TABLE);
    List<String> tableNames = new ArrayList<String>();
    tableNames = getJdbcTemplate().queryForList(sql.toString(), String.class);
    return tableNames;
  }

}
