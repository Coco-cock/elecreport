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
	private String customId;
	private Load load;
	private String createTime;
	public int getNodeId() {
		return nodeId;
	}
	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}
	public String getCustomId() {
		return customId;
	}
	public void setCustomId(String customId) {
		this.customId = customId;
	}
	public Load getLoad() {
		return load;
	}
	public void setLoad(Load load) {
		this.load = load;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public NodeLoad() {
		super();
	}
	public NodeLoad(int nodeId, String customId, Load load, String createTime) {
		super();
		this.nodeId = nodeId;
		this.customId = customId;
		this.load = load;
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "NodeLoad [nodeId=" + nodeId + ", customId=" + customId + ", load=" + load + ", createTime=" + createTime
				+ "]";
	}

	
}
