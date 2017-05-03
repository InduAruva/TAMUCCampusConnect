package com.tamuc.cc.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tamuc.cc.bean.ThreadBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;

/**
 * @author TAMUCCampusConnect
 *
 */
@Component("threadValidator")
public class ThreadValidator implements Validator {

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#supports(java.lang.Class)
	 */
	@Override
	public boolean supports(Class<?> arg0) {
		return ThreadBean.class.isAssignableFrom(arg0);
	}

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#validate(java.lang.Object, org.springframework.validation.Errors)
	 */
	@Override
	public void validate(Object bean, Errors errors) {
		ThreadBean threadBean = (ThreadBean) bean;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "categoryCd", MessageConstants.EMPTY_CATEGORY_NAME);
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "topic", MessageConstants.EMPTY_THREAD_NAME);
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", MessageConstants.EMPTY_THREAD_DES);
    	if(threadBean != null 
    			&& !String.valueOf(GlobalConstants.VALIDATION_TYPE_INSERT).equalsIgnoreCase(threadBean.getValidationType())) {
    		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "status", MessageConstants.EMPTY_THREAD_ACTIVE_SW);
    	}
		
		
	}

}
