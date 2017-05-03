/**
 * 
 */
package com.tamuc.cc.utilities;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;


/**
 * The Class LogAspects.
 *
 * @author FacultyEvaluationSystem
 */

@Aspect
public class LogAspects implements LoggerInterface {

  /**
   * Following is the definition for a pointcut to select all the methods available. So advice will
   * be called for all the methods.
   */
  @Pointcut("within(com.fes.*.*) && execution(public * *(..))")
  private void selectAll() {}

  /**
   * 
   * This is the method which I would like to execute before a selected method execution.
   *
   * @param joinPoint the join point
   */
  @Before("selectAll()")
  public void beforeMethod(final JoinPoint joinPoint) {
    applicationLogger.debug("CLASS Name:" + joinPoint.getTarget().getClass().getName()
        + " Entering in Method : " + joinPoint.getSignature().getName() + "...");
  }

  /**
   * 
   * This is the method which I would like to execute after a selected method execution.
   *
   * @param joinPoint the join point
   */
  @After("selectAll()")
  public void afterMethod(JoinPoint joinPoint) {
    applicationLogger.debug("CLASS Name:" + joinPoint.getTarget().getClass().getName()
        + "... Exiting from Method : " + joinPoint.getSignature().getName());
  }


}
