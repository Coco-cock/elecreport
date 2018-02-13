package com.tran.report.model;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午3:00:20   
* Description:  
*
*@param     
*/

public class CustomBill {
	/*
	 * Id   custom_id  elec_amount(用电量 单位千瓦时)    dey_date
	 */
	private int billId;
	private int customId;
	private double elecAmount;
	private String createTime;
	public int getBillId() {
		return billId;
	}
	public void setBillId(int billId) {
		this.billId = billId;
	}
	public int getCustomId() {
		return customId;
	}
	public void setCustomId(int customId) {
		this.customId = customId;
	}
	public double getElecAmount() {
		return elecAmount;
	}
	public void setElecAmount(double elecAmount) {
		this.elecAmount = elecAmount;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public CustomBill() {
	}
	public CustomBill(int billId, int customId, double elecAmount, String createTime) {
		super();
		this.billId = billId;
		this.customId = customId;
		this.elecAmount = elecAmount;
		this.createTime = createTime;
	}
	
}
