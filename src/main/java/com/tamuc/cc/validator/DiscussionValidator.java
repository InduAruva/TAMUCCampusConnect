package com.tamuc.cc.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tamuc.cc.bean.DiscussionBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;

/**
 * @author TAMUCCampusConnect
 *
 */
@Component
public class DiscussionValidator implements Validator {

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#supports(java.lang.Class)
	 */
    @Override
    public boolean supports(Class<?> arg0) {
	    return DiscussionBean.class.isAssignableFrom(arg0);
    }

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#validate(java.lang.Object, org.springframework.validation.Errors)
	 */
    @Override
    public void validate(Object bean, Errors errors) {
    	DiscussionBean discussionBean = (DiscussionBean) bean;
    	
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "message", MessageConstants.EMPTY_DISCUSSION_TOPIC);
    	if(discussionBean != null 
    			&& !String.valueOf(GlobalConstants.VALIDATION_TYPE_INSERT).equalsIgnoreCase(discussionBean.getValidationType())) {
    		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "active", MessageConstants.EMPTY_DISCUSSION_ACTIVE_SW);
    	}
    }

}
