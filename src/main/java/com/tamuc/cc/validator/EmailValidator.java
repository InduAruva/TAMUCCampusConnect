package com.tamuc.cc.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

/**
 * This class will be used for server side validation for Email address entered for the driver by the
 * admin on the add user view.
 */
@Component("emailValidator")
public class EmailValidator {

	/** The pattern. */
	private Pattern pattern;
	
	/** The matcher. */
	private Matcher matcher;

	/** The Constant EMAIL_PATTERN. */
	/*private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";*/
	
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@(leomail.tamuc.edu|tamuc.edu)";

	/**
	 * Instantiates a new email validator.
	 */
	public EmailValidator() {
		pattern = Pattern.compile(EMAIL_PATTERN);
	}

	/**
	 * Valid.
	 *
	 * @param email the email
	 * @return true, if successful
	 */
	public boolean valid(final String email) {

		matcher = pattern.matcher(email);
		return matcher.matches();

	}
}