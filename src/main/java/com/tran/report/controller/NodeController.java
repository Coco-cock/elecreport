package com.tran.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.service.NodeService;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月13日 下午4:11:31   
* Description:  
*
*@param     
*/
@Controller
public class NodeController {
	
	@Autowired
	NodeService nodeService;
	
	@RequestMapping(value="getnodelist")
	public ModelAndView getNodeInfo() {	
		ModelAndView mav =new ModelAndView("nodeinfo");
		nodeService.getNodeInfo();
		mav.addObject("nodeinfo", nodeService.getNodeInfo());	
		return mav;
		
	}

}
