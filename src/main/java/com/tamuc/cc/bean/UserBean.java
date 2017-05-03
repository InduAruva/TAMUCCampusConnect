/**
 * 
 */
package com.tamuc.cc.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

// TODO: Auto-generated Javadoc
/**
 * The Class UserBean.
 *
 * @author TAMUCCampusConnect
 */
public class UserBean implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The user name. */
	private String userName;

	/** The password. */
	private char[] password;

	/** The security question. */
	private String securityQuestion;

	/** The security answer. */
	private String securityAnswer;

	/** The email id. */
	private String emailId;

	/** The role cd. */
	private String roleCd;

	/** The registration dt. */
	private Date registrationDt;

	/** The department. */
	private String department;

	/** The profile pic. */
	private byte[] profilePic;

	/** The full name. */
	private String fullName;
	
	/** The profile pic. */
	private String encodedProfilePic;

	private String validationType;
	
	/**
	 * Instantiates a new user bean.
	 */
	public UserBean() {
		super();
	}


	/**
	 * @param userName
	 * @param password
	 * @param securityQuestion
	 * @param securityAnswer
	 * @param emailId
	 * @param roleCd
	 * @param registrationDt
	 * @param department
	 * @param profilePic
	 * @param fullName
	 * @param encodedProfilePic
	 * @param validationType
	 */
    public UserBean(String userName, char[] password, String securityQuestion, String securityAnswer, String emailId,
            String roleCd, Date registrationDt, String department, byte[] profilePic, String fullName,
            String encodedProfilePic, String validationType) {
	    super();
	    this.userName = userName;
	    this.password = password;
	    this.securityQuestion = securityQuestion;
	    this.securityAnswer = securityAnswer;
	    this.emailId = emailId;
	    this.roleCd = roleCd;
	    this.registrationDt = registrationDt;
	    this.department = department;
	    this.profilePic = profilePic;
	    this.fullName = fullName;
	    this.encodedProfilePic = encodedProfilePic;
	    this.validationType = validationType;
    }







	/**
	 * Gets the user name.
	 *
	 * @return the user name
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * Sets the user name.
	 *
	 * @param userName
	 *            the new user name
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
	 * @param password
	 *            the new password
	 */
	public void setPassword(char[] password) {
		this.password = password;
	}

	/**
	 * Gets the security question.
	 *
	 * @return the security question
	 */
	public String getSecurityQuestion() {
		return securityQuestion;
	}

	/**
	 * Sets the security question.
	 *
	 * @param securityQuestion
	 *            the new security question
	 */
	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	/**
	 * Gets the security answer.
	 *
	 * @return the security answer
	 */
	public String getSecurityAnswer() {
		return securityAnswer;
	}

	/**
	 * Sets the security answer.
	 *
	 * @param securityAnswer
	 *            the new security answer
	 */
	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}

	/**
	 * Gets the role cd.
	 *
	 * @return the role cd
	 */
	public String getRoleCd() {
		return roleCd;
	}

	/**
	 * Sets the role cd.
	 *
	 * @param roleCd
	 *            the new role cd
	 */
	public void setRoleCd(String roleCd) {
		this.roleCd = roleCd;
	}

	/**
	 * Gets the registration dt.
	 *
	 * @return the registration dt
	 */
	public Date getRegistrationDt() {
		return registrationDt;
	}

	/**
	 * Sets the registration dt.
	 *
	 * @param registrationDt
	 *            the new registration dt
	 */
	public void setRegistrationDt(Date registrationDt) {
		this.registrationDt = registrationDt;
	}

	/**
	 * Gets the department.
	 *
	 * @return the department
	 */
	public String getDepartment() {
		return department;
	}

	/**
	 * Sets the department.
	 *
	 * @param department
	 *            the new department
	 */
	public void setDepartment(String department) {
		this.department = department;
	}

	/**
	 * @return the profilePic
	 */
	public byte[] getProfilePic() {
		return profilePic;
	}

	/**
	 * @param profilePic
	 *            the profilePic to set
	 */
	public void setProfilePic(byte[] profilePic) {
		this.profilePic = profilePic;
	}

	/**
	 * Gets the full name.
	 *
	 * @return the full name
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * Sets the full name.
	 *
	 * @param fullName
	 *            the new full name
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((department == null) ? 0 : department.hashCode());
		result = prime * result + ((fullName == null) ? 0 : fullName.hashCode());
		result = prime * result + Arrays.hashCode(password);
		result = prime * result + ((profilePic == null) ? 0 : profilePic.hashCode());
		result = prime * result + ((registrationDt == null) ? 0 : registrationDt.hashCode());
		result = prime * result + ((roleCd == null) ? 0 : roleCd.hashCode());
		result = prime * result + ((securityAnswer == null) ? 0 : securityAnswer.hashCode());
		result = prime * result + ((securityQuestion == null) ? 0 : securityQuestion.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof UserBean))
			return false;
		UserBean other = (UserBean) obj;
		if (department == null) {
			if (other.department != null)
				return false;
		} else if (!department.equals(other.department))
			return false;
		if (fullName == null) {
			if (other.fullName != null)
				return false;
		} else if (!fullName.equals(other.fullName))
			return false;
		if (!Arrays.equals(password, other.password))
			return false;
		if (profilePic == null) {
			if (other.profilePic != null)
				return false;
		} else if (!profilePic.equals(other.profilePic))
			return false;
		if (registrationDt == null) {
			if (other.registrationDt != null)
				return false;
		} else if (!registrationDt.equals(other.registrationDt))
			return false;
		if (roleCd == null) {
			if (other.roleCd != null)
				return false;
		} else if (!roleCd.equals(other.roleCd))
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "UserBean [userName=" + userName + ", password=" + Arrays.toString(password) + ", securityQuestion="
		        + securityQuestion + ", securityAnswer=" + securityAnswer + ", roleCd=" + roleCd + ", registrationDt="
		        + registrationDt + ", department=" + department + ", profilePic=" + profilePic + ", fullName="
		        + fullName + "]";
	}

	/**
	 * Gets the email id.
	 *
	 * @return the email id
	 */
	public String getEmailId() {
		return emailId;
	}

	/**
	 * Sets the email id.
	 *
	 * @param emailId
	 *            the new email id
	 */
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	/**
	 * @return the encodedProfilePic
	 */
    public String getEncodedProfilePic() {
	    return encodedProfilePic;
    }

	/**
	 * @param encodedProfilePic the encodedProfilePic to set
	 */
    public void setEncodedProfilePic(String encodedProfilePic) {
	    this.encodedProfilePic = encodedProfilePic;
    }



	public String getValidationType() {
	    return validationType;
    }



	public void setValidationType(String validationType) {
	    this.validationType = validationType;
    }
}
