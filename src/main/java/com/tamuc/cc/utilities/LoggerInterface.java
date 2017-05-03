package com.tamuc.cc.utilities;

import org.apache.log4j.Logger;

import com.tamuc.cc.constants.GlobalConstants;


// TODO: Auto-generated Javadoc
/**
 * The Interface LoggerInterface.
 */
public interface LoggerInterface {

  /** The Constant logger. */
  public static final Logger applicationLogger = Logger
      .getLogger(GlobalConstants.APPLICATION_LOGGER);

  /** The Constant errorLogger. */
  public static final Logger errorLogger = Logger.getLogger(GlobalConstants.ERROR_LOGGER);

}
