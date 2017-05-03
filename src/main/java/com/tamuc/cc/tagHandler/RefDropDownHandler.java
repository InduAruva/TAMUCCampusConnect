/**
 * 
 */
package com.tamuc.cc.tagHandler;

import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.tags.form.SelectTag;
import org.springframework.web.servlet.tags.form.TagWriter;

import com.tamuc.cc.bean.CategoryBean;
import com.tamuc.cc.bean.ReferenceTableBean;
import com.tamuc.cc.bean.UserBean;
import com.tamuc.cc.constants.GlobalConstants;
import com.tamuc.cc.service.ReferenceDataService;

// TODO: Auto-generated Javadoc
/**
 * The Class RefDropDownHandler.
 *
 * @author TAMUCCampusConnect
 */
@Component
public class RefDropDownHandler extends SelectTag {

  /** The Constant serialVersionUID. */
  private static final long serialVersionUID = -7119317573220797215L;

  /** The reference table name. */
  private String referenceTableName;

  /** The element name. */
  private String elementName; // In case of USER, values will be lead, sublead, manager

  /** The place holder. */
  private String placeHolder;

  /** The code. */
  private String code;
  
  

  /**
   * Gets the reference table name.
   *
   * @return the referenceTableName
   */
  public String getReferenceTableName() {
    return referenceTableName;
  }

  /**
   * Gets the element name.
   *
   * @return the element name
   */
  public String getElementName() {
    return elementName;
  }

  /**
   * Sets the element name.
   *
   * @param elementName the new element name
   */
  public void setElementName(String elementName) {
    this.elementName = elementName;
  }

  /**
   * Gets the place holder.
   *
   * @return the place holder
   */
  public String getPlaceHolder() {
    return placeHolder;
  }

  /**
   * Sets the place holder.
   *
   * @param placeHolder the new place holder
   */
  public void setPlaceHolder(String placeHolder) {
    this.placeHolder = placeHolder;
  }

  /**
   * Sets the reference table name.
   *
   * @param referenceTableName the referenceTableName to set
   */
  public void setReferenceTableName(String referenceTableName) {
    this.referenceTableName = referenceTableName;
  }



  /**
   * Gets the code.
   *
   * @return the code
   */
  public String getCode() {
    return code;
  }

  /**
   * Sets the code.
   *
   * @param code the code to set
   */
  public void setCode(String code) {
    this.code = code;
  }

  /*
   * (non-Javadoc)
   * 
   * @see
   * org.springframework.web.servlet.tags.form.SelectTag#writeTagContent(org.springframework.web
   * .servlet.tags.form.TagWriter)
   */
  @Override
	protected int writeTagContent(TagWriter tagWriter) throws JspException {
		List<ReferenceTableBean> refData = null;
		tagWriter.startTag("select");
		tagWriter.writeAttribute("name", this.elementName);
		tagWriter.writeAttribute("id", this.elementName);
		tagWriter.writeAttribute("path", this.elementName);
		tagWriter.writeAttribute("class", "form-control");
		tagWriter.startTag("option");
		tagWriter.writeAttribute("value", "");
		tagWriter.appendValue(this.placeHolder);
		tagWriter.endTag();

		if ("USER".equalsIgnoreCase(this.referenceTableName)) {
			Map<String, UserBean> userMap = ReferenceDataService.getUserMap();
			for (String key : userMap.keySet()) {
				if (userMap.get(key) != null) {
					tagWriter.startTag("option");
					tagWriter.writeAttribute("value", key);
					if (this.code != null && !this.code.isEmpty() && key.equals(this.code)) {
						tagWriter.writeAttribute("selected", "selected");
					}
					tagWriter.appendValue(userMap.get(key) != null ? userMap.get(key).getFullName() : "");
					tagWriter.endTag();
				}

			}
		} else if ("CATEGORY".equalsIgnoreCase(this.referenceTableName)) {
			Map<String, CategoryBean> categoryMap= ReferenceDataService.getCategoryMap();
			if (categoryMap != null) {
				for (String key : categoryMap.keySet()) {
					if (categoryMap.get(key) != null
					        && GlobalConstants.YES.equalsIgnoreCase(categoryMap.get(key).getActive()))
					tagWriter.startTag("option");
					tagWriter.writeAttribute("value", key);
					if (this.code != null && !this.code.isEmpty() && key.equals(this.code)) {
						tagWriter.writeAttribute("selected", "selected");
					}
					tagWriter.appendValue(categoryMap.get(key) != null ? categoryMap.get(key).getCategoryName() : "");
					tagWriter.endTag();
				}
			}
		} else {
			refData = ReferenceDataService.getReferenceData(this.referenceTableName);
			if (refData != null) {
				for (ReferenceTableBean bean : refData) {
					tagWriter.startTag("option");
					tagWriter.writeAttribute("value", bean.getCode());
					if (this.code != null && !this.code.isEmpty() && bean.getCode().equals(this.code)) {
						tagWriter.writeAttribute("selected", "selected");
					}
					tagWriter.appendValue(bean.getDescription());
					tagWriter.endTag();
				}
			}
		}

		tagWriter.endTag();
		return 1;
	}
}
