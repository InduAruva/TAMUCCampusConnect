package com.tamuc.cc.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;

/**
 * @author TAMUCCampusConnect
 *
 */
@Component("userValidator")
public class UserValidator implements Validator{

	/** The email validator. */
	@Autowired
	private EmailValidator emailValidator;
	
	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#supports(java.lang.Class)
	 */
    @Override
    public boolean supports(Class<?> arg0) {
    	 return UserBean.class.isAssignableFrom(arg0);
    }

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#validate(java.lang.Object, org.springframework.validation.Errors)
	 */
    @Override
    public void validate(Object userBean, Errors errors) {
    	UserBean bean = (UserBean) userBean;
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullName", MessageConstants.EMPTY_NAME);
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailId", MessageConstants.EMPTY_EMAIL_ID);
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "securityQuestion", MessageConstants.EMPTY_SEC_QUESTION);
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "securityAnswer", MessageConstants.EMPTY_SEC_ANSWER);
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "department", MessageConstants.EMPTY_DEPARTMENT);
    	
    	

    	if(bean != null) {
    		if(GlobalConstants.VALIDATION_TYPE_INSERT.equalsIgnoreCase(bean.getValidationType())) {
    			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", MessageConstants.EMPTY_PASSWORD);
    		}
    		if(bean.getPassword() != null && String.valueOf(bean.getPassword()).trim().length() > 1 
    				&& String.valueOf(bean.getPassword()).trim().length() < 6) {
    			errors.rejectValue("password", MessageConstants.INVALID_PASSWORD);
    		}
    		if(bean.getEmailId() != null && bean.getEmailId().length() > 0 &&
    				!emailValidator.valid(bean.getEmailId())) {
    			errors.rejectValue("emailId", MessageConstants.INVALID_EMAIL_ID);
    		}
    	}    	
    }

}
