package com.tran.report.model;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午2:59:50   
* Description:  
*
*@param     
*/

public class NodeBill {
	private int billId;
	private int nodeId;
	private double elecAmount;
	private String createTime;
	public int getBillId() {
		return billId;
	}
	public void setBillId(int billId) {
		this.billId = billId;
	}
	public int getNodeId() {
		return nodeId;
	}
	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
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
	
	public NodeBill() {
	}
	public NodeBill(int billId, int nodeId, double elecAmount, String createTime) {
		super();
		this.billId = billId;
		this.nodeId = nodeId;
		this.elecAmount = elecAmount;
		this.createTime = createTime;
	}
	

}
