package com.tamuc.cc.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tamuc.cc.bean.LoginBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;

/**
 * @author TAMUCCampusConnect
 *
 */
@Component("loginValidator")
public class LoginValidator implements Validator {

	@Autowired
	private EmailValidator emailValidator;
	
	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#supports(java.lang.Class)
	 */
	  @Override
	  public boolean supports(Class<?> arg0) {
	    return LoginBean.class.isAssignableFrom(arg0);
	  }

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#validate(java.lang.Object, org.springframework.validation.Errors)
	 */
    @Override
    public void validate(Object loginBean, Errors errors) {
    	LoginBean bean = (LoginBean) loginBean;
    	
    	if(bean != null) {
    		if(GlobalConstants.VALIDATION_TYPE_LOGIN == bean.getValidationType()) {
        		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailId", MessageConstants.EMPTY_EMAIL_ID);
        		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", MessageConstants.PASSWORD_REQUIRED);
    		} else if (GlobalConstants.VALIDATION_TYPE_PWD_RESET == bean.getValidationType()) {
    			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailId", MessageConstants.EMPTY_EMAIL_ID);
        		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", MessageConstants.PASSWORD_REQUIRED);
        		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", MessageConstants.CONFIRM_PASSWORD_REQUIRED);
        		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "securityQuestion", MessageConstants.EMPTY_SEC_QUESTION);
        		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "securityAnswer", MessageConstants.EMPTY_SEC_ANSWER);
				
        		if(bean.getEmailId() != null && bean.getEmailId().length() > 0 &&
        				!emailValidator.valid(bean.getEmailId())) {
        			errors.rejectValue("emailId", MessageConstants.INVALID_EMAIL_ID);
        		}
				
				if(bean.getPassword() != null && String.valueOf(bean.getPassword()).trim().length() > 0 
						&& bean.getConfirmPassword() != null && String.valueOf(bean.getConfirmPassword()).trim().length() > 0
						&& !(String.valueOf(bean.getPassword()).trim().equalsIgnoreCase(
								String.valueOf(bean.getConfirmPassword()).trim()))) {
					errors.rejectValue("password", MessageConstants.PASSWORD_MISMATCH);
				}
				if(bean.getPassword() != null && String.valueOf(bean.getPassword()).trim().length() > 1 
	    				&& String.valueOf(bean.getPassword()).trim().length() < 6) {
	    			errors.rejectValue("password", MessageConstants.INVALID_PASSWORD);
	    		}
    		}    	    
    	}
    }

}
