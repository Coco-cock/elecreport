package com.tran.report.model;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午2:29:25   
* Description:  
*
*@param     
*/

public class Node {
	/**
	 * node_id  custom_id  node_address  node_status(状态 是否正常 1 or 0)
	 */
	private int nodeId;
	private String customName;
	private String nodeAddress;
	private String nodeStatus;

	
	public int getNodeId() {
		return nodeId;
	}


	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}


	public String getCustomName() {
		return customName;
	}


	public void setCustomName(String customName) {
		this.customName = customName;
	}


	public String getNodeAddress() {
		return nodeAddress;
	}


	public void setNodeAddress(String nodeAddress) {
		this.nodeAddress = nodeAddress;
	}


	public String getNodeStatus() {
		return nodeStatus;
	}


	public void setNodeStatus(String nodeStatus) {
		this.nodeStatus = nodeStatus;
	}


	public Node() {
	}

	
	
}
