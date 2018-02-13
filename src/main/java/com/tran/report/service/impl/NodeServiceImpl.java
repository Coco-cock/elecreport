package com.tran.report.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tran.report.mapper.NodeMapper;
import com.tran.report.model.Node;
import com.tran.report.service.NodeService;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月13日 下午4:07:37   
* Description:  
*
*@param     
*/

@Service
public class NodeServiceImpl implements NodeService{
	
	@Autowired
	NodeMapper nodeMapper;

	@Override
	public List<Node> getNodeInfo() {
		
		return nodeMapper.getNodeInfo();
	}

}
