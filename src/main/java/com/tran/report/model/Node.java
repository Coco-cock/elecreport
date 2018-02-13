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
	private int customId;
	private String nodeAddress;
	private String nodeStatus;
	public int getNodeId() {
		return nodeId;
	}
	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}
	public int getCustomId() {
		return customId;
	}
	public void setCustomId(int customId) {
		this.customId = customId;
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
	public Node(int nodeId, int customId, String nodeAddress, String nodeStatus) {
		super();
		this.nodeId = nodeId;
		this.customId = customId;
		this.nodeAddress = nodeAddress;
		this.nodeStatus = nodeStatus;
	}
	
	
}
