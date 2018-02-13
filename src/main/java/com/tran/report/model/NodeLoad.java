package com.tran.report.model;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午2:42:37   
* Description:  
*
*@param     
*/

public class NodeLoad {
	/*
	 * Node_Id   node_voltage(节点电压)  node_current(节点电流)   date   time 可能加功率因素 电功率字段
	 */
	
	private int nodeId;
	private double nodeVoltage;
	private double nodeCurrent;
	private String createDate;
	private String createTime;
	public int getNodeId() {
		return nodeId;
	}
	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}
	public double getNodeVoltage() {
		return nodeVoltage;
	}
	public void setNodeVoltage(double nodeVoltage) {
		this.nodeVoltage = nodeVoltage;
	}
	public double getNodeCurrent() {
		return nodeCurrent;
	}
	public void setNodeCurrent(double nodeCurrent) {
		this.nodeCurrent = nodeCurrent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public NodeLoad() {
	}
	public NodeLoad(int nodeId, double nodeVoltage, double nodeCurrent, String createDate, String createTime) {
		super();
		this.nodeId = nodeId;
		this.nodeVoltage = nodeVoltage;
		this.nodeCurrent = nodeCurrent;
		this.createDate = createDate;
		this.createTime = createTime;
	}
	
}
