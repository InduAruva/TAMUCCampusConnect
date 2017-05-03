/**
 * 
 */
package com.tamuc.cc.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.tamuc.cc.utilities.LoggerInterface;


// TODO: Auto-generated Javadoc
/**
 * This class is the Parent class for all the DAO classes which contains common properties like
 * datasource, JDBC Template,etc.
 *
 * @author TAMUCCampusConnect
 */
public abstract class AbstractDAO implements LoggerInterface {


  /** The Constant USER_TABLE. */
  protected static final String USER_TABLE = "user";

  /** The Constant COMMENTS_TABLE. */
  protected static final String COMMENTS_TABLE = "comments";

  /** The Constant CATEGORY_TABLE. */
  protected static final String CATEGORY_TABLE = "category";
  
  /** The Constant THREAD_TABLE. */
  protected static final String THREAD_TABLE = "thread";
  
  /** The Constant DISCUSSION_TABLE. */
  protected static final String DISCUSSION_TABLE = "discussion";
  
  /** The Constant RT_ALL_REF_TABLE. */
  protected static final String RT_ALL_REF_TABLE = "rt_all_ref";

  /** The data source. */
  @Autowired
  protected DataSource dataSource;

  /** The jdbc template. */
  @Autowired
  private JdbcTemplate jdbcTemplate;


  /**
   * Gets the jdbc template.
   *
   * @return the jdbcTemplate
   */
  public JdbcTemplate getJdbcTemplate() {
    return jdbcTemplate;
  }

  /**
   * Sets the jdbc template.
   *
   * @param jdbcTemplate the jdbcTemplate to set
   */
  public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
    this.jdbcTemplate = jdbcTemplate;
  }

  /**
   * Gets the data source.
   *
   * @return the dataSource
   */
  public DataSource getDataSource() {
    return dataSource;
  }

  /**
   * Sets the data source.
   *
   * @param dataSource the dataSource to set
   */
  public void setDataSource(DataSource dataSource) {
    this.dataSource = dataSource;
  }


}
