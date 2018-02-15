package com.tran.report.model;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午2:35:32   
* Description:  
*
*@param     
*/

public class Custom {
	/*
	 * user_id  custom_name  custom_ipone  custom_address  register_time(注册时间)  custom_status(状态)  remark（备注  备用字段）
	 */

	private String customId;
	private String customName;
	private String customIphone;
	private String customAddress;
	private String customStatus;
	private String registerTime;
	private String editTime;
	public String getCustomId() {
		return customId;
	}
	public void setCustomId(String customId) {
		this.customId = customId;
	}
	public String getCustomName() {
		return customName;
	}
	public void setCustomName(String customName) {
		this.customName = customName;
	}
	public String getCustomIphone() {
		return customIphone;
	}
	public void setCustomIphone(String customIphone) {
		this.customIphone = customIphone;
	}
	public String getCustomAddress() {
		return customAddress;
	}
	public void setCustomAddress(String customAddress) {
		this.customAddress = customAddress;
	}
	public String getCustomStatus() {
		return customStatus;
	}
	public void setCustomStatus(String customStatus) {
		this.customStatus = customStatus;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getEditTime() {
		return editTime;
	}
	public void setEditTime(String editTime) {
		this.editTime = editTime;
	}
	
}
