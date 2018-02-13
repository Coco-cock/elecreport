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

	private int userId;
	private String customName;
	private String customIphone;
	private String customAddress;
	private String registerTime;
	private String customStatus;
	private String remark;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getCustomStatus() {
		return customStatus;
	}
	public void setCustomStatus(String customStatus) {
		this.customStatus = customStatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Custom() {
	}
	public Custom(int userId, String customName, String customIphone, String customAddress, String registerTime,
			String customStatus, String remark) {
		this.userId = userId;
		this.customName = customName;
		this.customIphone = customIphone;
		this.customAddress = customAddress;
		this.registerTime = registerTime;
		this.customStatus = customStatus;
		this.remark = remark;
	}
	
}
