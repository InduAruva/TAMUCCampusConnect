/**
 * 
 */
package com.tamuc.cc.bean;

import java.io.Serializable;
import java.util.Arrays;

// TODO: Auto-generated Javadoc
/**
 * The Class LoginBean.
 *
 * @author TAMUCCampusConnect
 */
public class LoginBean implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
    
    /** The user name. */
    private String userName;
    
    /** The user name. */
    private String emailId;
    
    /** The password. */
    private char[] password;
    
    /** The confirm password. */
    private char[] confirmPassword;
    
    /** The security question. */
    private String securityQuestion;
    
    /** The security answer. */
    private String securityAnswer;
	
    private char validationType;
    /**
     * Instantiates a new login bean.
     */
    public LoginBean() {
	    super();
    }


    
	/**
	 * @param userName
	 * @param emailId
	 * @param password
	 * @param confirmPassword
	 * @param securityQuestion
	 * @param securityAnswer
	 * @param validationType
	 */
    public LoginBean(String userName, String emailId, char[] password, char[] confirmPassword, String securityQuestion,
            String securityAnswer, char validationType) {
	    super();
	    this.userName = userName;
	    this.emailId = emailId;
	    this.password = password;
	    this.confirmPassword = confirmPassword;
	    this.securityQuestion = securityQuestion;
	    this.securityAnswer = securityAnswer;
	    this.validationType = validationType;
    }



	/**
	 * Gets the user name.
	 *
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * Sets the user name.
	 *
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * Gets the password.
	 *
	 * @return the password
	 */
	public char[] getPassword() {
		return password;
	}

	/**
	 * Sets the password.
	 *
	 * @param password the password to set
	 */
	public void setPassword(char[] password) {
		this.password = password;
	}

	/**
	 * Gets the confirm password.
	 *
	 * @return the confirmPassword
	 */
	public char[] getConfirmPassword() {
		return confirmPassword;
	}

	/**
	 * Sets the confirm password.
	 *
	 * @param confirmPassword the confirmPassword to set
	 */
	public void setConfirmPassword(char[] confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	/**
	 * Gets the security question.
	 *
	 * @return the securityQuestion
	 */
	public String getSecurityQuestion() {
		return securityQuestion;
	}

	/**
	 * Sets the security question.
	 *
	 * @param securityQuestion the securityQuestion to set
	 */
	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	/**
	 * Gets the security answer.
	 *
	 * @return the securityAnswer
	 */
	public String getSecurityAnswer() {
		return securityAnswer;
	}

	/**
	 * Sets the security answer.
	 *
	 * @param securityAnswer the securityAnswer to set
	 */
	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
    @Override
    public int hashCode() {
	    final int prime = 31;
	    int result = 1;
	    result = prime * result + Arrays.hashCode(confirmPassword);
	    result = prime * result + Arrays.hashCode(password);
	    result = prime * result + ((securityAnswer == null) ? 0 : securityAnswer.hashCode());
	    result = prime * result + ((securityQuestion == null) ? 0 : securityQuestion.hashCode());
	    result = prime * result + ((userName == null) ? 0 : userName.hashCode());
	    return result;
    }

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
    @Override
    public boolean equals(Object obj) {
	    if (this == obj)
		    return true;
	    if (obj == null)
		    return false;
	    if (!(obj instanceof LoginBean))
		    return false;
	    LoginBean other = (LoginBean) obj;
	    if (!Arrays.equals(confirmPassword, other.confirmPassword))
		    return false;
	    if (!Arrays.equals(password, other.password))
		    return false;
	    if (securityAnswer == null) {
		    if (other.securityAnswer != null)
			    return false;
	    } else if (!securityAnswer.equals(other.securityAnswer))
		    return false;
	    if (securityQuestion == null) {
		    if (other.securityQuestion != null)
			    return false;
	    } else if (!securityQuestion.equals(other.securityQuestion))
		    return false;
	    if (userName == null) {
		    if (other.userName != null)
			    return false;
	    } else if (!userName.equals(other.userName))
		    return false;
	    return true;
    }

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
    @Override
    public String toString() {
	    return "LoginBean [userName=" + userName + ", password=" + Arrays.toString(password) + ", confirmPassword="
	            + Arrays.toString(confirmPassword) + ", securityQuestion=" + securityQuestion + ", securityAnswer="
	            + securityAnswer + "]";
    }

	/**
	 * @return the validationType
	 */
    public char getValidationType() {
	    return validationType;
    }

	/**
	 * @param validationType the validationType to set
	 */
    public void setValidationType(char validationType) {
	    this.validationType = validationType;
    }



	/**
	 * @return the emailId
	 */
    public String getEmailId() {
	    return emailId;
    }



	/**
	 * @param emailId the emailId to set
	 */
    public void setEmailId(String emailId) {
	    this.emailId = emailId;
    }
    
    
}
