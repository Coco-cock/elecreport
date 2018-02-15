package com.tran.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.tran.report.model.Custom;
import com.tran.report.service.CustomService;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月14日 下午1:47:28   
* Description:  
*
*@param     
*/
@Controller
public class InfoController {
	@Autowired
	CustomService customService;
	
	@RequestMapping(value="getallcustom")
public ModelAndView getCustomInfo() {
	
	ModelAndView mav =new ModelAndView("custominfo");
	List<Custom> customList=customService.getCustomInfo();
	mav.addObject("customList", customList);	
	return mav;
	}
	
	
	@RequestMapping(value="getcustombyid")
	public @ResponseBody Custom getCustomById() {
		return customService.getCustomInfoById("1");
		}


}
