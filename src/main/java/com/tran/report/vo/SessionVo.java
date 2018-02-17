package com.tran.report.vo;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月17日 下午5:27:11   
* Description:  
*
*@param     
*/

public class SessionVo {
	private String userName;
	private String customId;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCustomId() {
		return customId;
	}
	public void setCustomId(String customId) {
		this.customId = customId;
	}
	public SessionVo() {
		super();
	}
	public SessionVo(String userName, String customId) {
		super();
		this.userName = userName;
		this.customId = customId;
	}
	

}
