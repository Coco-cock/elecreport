package com.tran.report.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.service.CustomService;
import com.tran.report.service.UserService;
import com.tran.report.service.impl.DynamicDataServiceImpl;
import com.tran.report.vo.CustomVO;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月14日 下午1:47:28 Description:
 *
 * @param
 */
@Controller
public class CustomController {
	private static final Logger logger = Logger.getLogger(CustomController.class);
	@Autowired
	CustomService customService;
	@Autowired
	UserService userService;
	@RequestMapping(value = "getAllCustom")
	public ModelAndView getAllCustom() {
		ModelAndView mav = new ModelAndView("customInfo");
		List<CustomVO> customList = customService.getCustomInfo();
		mav.addObject("customList", customList);
		return mav;
	}
	
	@RequestMapping(value = "saveCustom")
	public @ResponseBody boolean saveCustom(CustomVO vo) {			
		      if( customService.saveCustom(vo)){
		    	  return true;
		      }
		return false;
	}


	@RequestMapping(value = "getCustomById")
	public @ResponseBody CustomVO getCustomById() {
		return customService.getCustomVoById("1");
	}

}
