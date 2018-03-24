package com.tran.report.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.tran.report.vo.SessionVO;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月24日 上午11:04:19   
* Description:  
*
*@param     
*/

public class BaseController {
	private static final Logger logger = Logger.getLogger(BaseController.class);
	public String getSessionCustomId(HttpSession session){
		SessionVO sessionVO=(SessionVO) session.getAttribute("sessionVO");
		if(sessionVO==null) {
			logger.error("getSessionCustomId-->seesionVO为空!");
			return null;
		}
		return sessionVO.getUserAndCustomVO().getCustomVO().getID();
	}
	public Integer getSessionUserRoleId(HttpSession session){
		SessionVO sessionVO=(SessionVO) session.getAttribute("sessionVO");
		if(sessionVO==null) {
			logger.error("getSessionUserRoleId-->seesionVO为空!");
			return null;
		}
		return sessionVO.getUserAndCustomVO().getUser().getRole().getId();
	}
}
