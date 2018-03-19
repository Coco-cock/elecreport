package com.tran.report.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.service.DynamicDataService;
import com.tran.report.service.LoadBillService;
import com.tran.report.vo.SessionVO;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午3:11:03   
* Description:  
*
*@param     
*/

@Controller
public class LoadBillController {
	private static final Logger logger = Logger.getLogger(LoadBillController.class);
	@Autowired
	LoadBillService loadBillService;
	@Autowired
	DynamicDataService DynamicDataService;
	
	@RequestMapping(value="historyload")
	public ModelAndView historyLoad() {
		
		return new ModelAndView("historydata");		
	}
	
	
	/**
	 * 
	 * @param customId
	 * @return
	 */
	@RequestMapping(value="historyloadbyid/{customId}")
	public ModelAndView historyLoadById(@PathVariable("customId")String customId) {
		ModelAndView mav = new ModelAndView("historydata");
		if(StringUtils.isNotBlank(customId)) {
			loadBillService.getDayLoadByCustomId(customId);
			loadBillService.getMonthLoadByCustomId(customId);
			loadBillService.getYearLoadByCustomId(customId);	
		}

		
		return mav;		
	}
	
	
	
	@RequestMapping(value="getDynamicLoadtableByCustomId")
	public ModelAndView getDynamicLoadtableByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		return new ModelAndView("dynamicloadtable").addObject("LoadDataList", loadBillService.getLoadDataByCustomId(customId));	
	}
	@RequestMapping(value="getDayLoadTableByCustomId")
	public ModelAndView getDayLoadTableByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		return new ModelAndView("dayloadtable").addObject("dayLoadList", loadBillService.getDayLoadByCustomId(customId));	
	}
	
	@RequestMapping(value="getMonthLoadTableByCustomId")
	public ModelAndView getMonthLoadTableByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		return new ModelAndView("monthloadtable").addObject("monthLoadList", loadBillService.getMonthLoadByCustomId(customId));	
	}
	@RequestMapping(value="getYearLoadTableByCustomId")
	public ModelAndView getYearLoadTableByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		return new ModelAndView("yearloadtable").addObject("yearLoadList", loadBillService.getYearLoadByCustomId(customId));	
	}
	
	
	@RequestMapping(value="getDayBill")
	public @ResponseBody List<Map<String, String>> getDayBill(){
		return loadBillService.getDayBill();
	}
	
	@RequestMapping(value="getMonthBill")
	public @ResponseBody List<Map<String, String>> getMonthBill(){
		List<Map<String, String>> list =loadBillService.getMonthBill();
		return list;
	}
	@RequestMapping(value="getYearBill")
	public @ResponseBody List<Map<String, String>> getYearBill(){
		logger.info("getYearBill()");
		return loadBillService.getYearBill();
	}
	
	@RequestMapping(value="getDayBillByCustomId")
	public @ResponseBody List<Map<String, String>> getDayBillByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		if(customId.isEmpty()) {
			logger.error("getDayBillByCustomId ->cutomId为空!");
			return new ArrayList<Map<String, String>>();
		}
		return loadBillService.getDayLoadByCustomId(customId);
	}
	@RequestMapping(value="getMonthBillByCustomId")
	public @ResponseBody List<Map<String, String>> getMonthBillByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		if(customId.isEmpty()) {
			logger.error("getMonthBillByCustomId ->cutomId为空!");
			return new ArrayList<Map<String, String>>();
		}
		return loadBillService.getMonthLoadByCustomId(customId);
	}
	@RequestMapping(value="getYearBillByCustomId")
	public @ResponseBody List<Map<String, String>> getYearBillByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		if(customId.isEmpty()) {
			logger.error("getYearBillByCustomId ->cutomId为空!");
			return new ArrayList<Map<String, String>>();
		}
		return loadBillService.getYearLoadByCustomId(customId);
	}
	
	public String getSessionCustomId(HttpSession session){
		SessionVO sessionVO=(SessionVO) session.getAttribute("sessionVO");
		if(sessionVO==null) {
			logger.error("getSessionCustomId-->seesionVO为空!");
			return null;
		}
		return sessionVO.getUserAndCustomVO().getCustomVO().getID();
	}

}
