/**
 * 
 * 
 */
package com.tamuc.cc.utilities;



// TODO: Auto-generated Javadoc
/**
 * The Class MessageHelper.
 */
public class MessageHelper {

  /** The msg type. */
  private String msgType;

  /** The msg desc. */
  private String msgDesc;

  /**
   * Gets the msg type.
   *
   * @return the msgType
   */
  public String getMsgType() {
    return msgType;
  }

  /**
   * Sets the msg type.
   *
   * @param msgType the msgType to set
   */
  public void setMsgType(String msgType) {
    this.msgType = msgType;
  }

  /**
   * Gets the msg desc.
   *
   * @return the msgDesc
   */
  public String getMsgDesc() {
    return msgDesc;
  }

  /**
   * Sets the msg desc.
   *
   * @param msgDesc the msgDesc to set
   */
  public void setMsgDesc(String msgDesc) {
    this.msgDesc = msgDesc;
  }

  /**
   * Sets the message details.
   *
   * @param msgType the msg type
   * @param msgDesc the msg desc
   */
  public void setMessageDetails(String msgType, String msgDesc) {
    setMsgType(msgType);
    setMsgDesc(msgDesc);
  }
}
