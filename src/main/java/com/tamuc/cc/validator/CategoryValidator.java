package com.tamuc.cc.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tamuc.cc.bean.CategoryBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.constants.MessageConstants;
/**
 * @author TAMUCCampusConnect
 *
 */
@Component
public class CategoryValidator implements Validator {

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#supports(java.lang.Class)
	 */
	@Override
	public boolean supports(Class<?> arg0) {
		return CategoryBean.class.isAssignableFrom(arg0);
	}

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#validate(java.lang.Object, org.springframework.validation.Errors)
	 */
	@Override
	public void validate(Object bean, Errors errors) {
		CategoryBean categoryBean = (CategoryBean) bean;
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "categoryName", MessageConstants.EMPTY_CATEGORY_NAME);
    	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", MessageConstants.EMPTY_CATEGORY_DES);
    	if(categoryBean != null 
    			&& !String.valueOf(GlobalConstants.VALIDATION_TYPE_INSERT).equalsIgnoreCase(categoryBean.getValidationType())) {
    		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "active", MessageConstants.EMPTY_CATEGORY_ACTIVE_SW);
    	}
    	

	}

}
