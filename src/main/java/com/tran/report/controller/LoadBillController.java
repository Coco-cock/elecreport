package com.tran.report.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.service.DynamicDataService;
import com.tran.report.service.LoadBillService;
import com.tran.report.vo.LoadBillVO;
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
	@Autowired
	LoadBillService customBillService;
	@Autowired
	DynamicDataService DynamicDataService;
	//private static final Logger log = LoggerFactory.getLogger(LoadBillController.class);
	public Map<String,Double> getData(List<?> list){
		for(Object o:list) {
			
		}
		
		
		return null;
		
	}
	@RequestMapping(value="historyload")
	public ModelAndView historyLoad() {
		ModelAndView mav = new ModelAndView("historydata");
		/*
		List<LoadBillVO> daybill =customBillService.getDayBill();
		List<LoadBillVO> monthbill =customBillService.getMonthBill();
		List<LoadBillVO> yearbill = customBillService.getYearBill();
	
		List<Double> daydata = new LinkedList<>();
		List<Double> monthdata = new LinkedList<>();
		List<Double> yeardata = new LinkedList<>();
		//List<Double> daydata = new LinkedList<>(); 
		Map<String,Double> map = new HashMap<>();
		for(LoadBillVO customBill:daybill) {
			
			//map.put(customBill.getEditTime(), customBill.getElecAmount());
		}
		
		for(LoadBillVO customBill:daybill) {
			
			customBill.getEditTime();
			daydata.add(Double.parseDouble(customBill.getElecAmount()));
		}
		mav.addObject("daydata", daydata);
		
		for(LoadBillVO customBill:monthbill) {
			monthdata.add(Double.parseDouble(customBill.getElecAmount()));
		}		
		mav.addObject("monthdata", monthdata);
		
		for(LoadBillVO customBill:yearbill) {
			yeardata.add(Double.parseDouble(customBill.getElecAmount()));
		}
		mav.addObject("yeardata", yeardata);*/
		
		return mav;		
	}
	
	
	/**
	 * 
	 * @param customId
	 * @return
	 */
	@RequestMapping(value="historyloadbyid/{customId}")
	public ModelAndView historyLoadById(@PathVariable("customId")String customId) {
		ModelAndView mav = new ModelAndView("historydata");
		
		List<LoadBillVO> daybill =customBillService.getDayLoadByCustomId(customId);
		List<LoadBillVO> monthbill =customBillService.getMonthLoadByCustomId(customId);
		List<LoadBillVO> yearbill = customBillService.getYearLoadByCustomId(customId);
	
		List<Double> daydata = new LinkedList<>();
		List<Double> monthdata = new LinkedList<>();
		List<Double> yeardata = new LinkedList<>();
		
		for(LoadBillVO customBill:daybill) {
			daydata.add(Double.parseDouble(customBill.getElecAmount()));
		}
		mav.addObject("daydata", daydata);
		
		for(LoadBillVO customBill:monthbill) {
			monthdata.add(Double.parseDouble(customBill.getElecAmount()));
		}		
		mav.addObject("monthdata", monthdata);
		
		for(LoadBillVO customBill:yearbill) {
			yeardata.add(Double.parseDouble(customBill.getElecAmount()));
		}
		mav.addObject("yeardata", yeardata);
		
		return mav;		
	}
	
	
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="dayloadtable")
	public ModelAndView getDayDataByCustomId(HttpSession session){
		ModelAndView mav = new ModelAndView("dayloadtable");
		SessionVO sessionVo=(SessionVO) session.getAttribute("sessionVo");
		mav.addObject("dayloadlist", customBillService.getDayLoadByCustomId(sessionVo.getUserAndCustomVO().getCustomVO().getID()));
		return mav;	
	}
	
	
	/**
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="monthloadtable")
	public ModelAndView getMonthDataByCustomId(HttpSession session){
		ModelAndView mav = new ModelAndView("monthloadtable");
		SessionVO sessionVo=(SessionVO) session.getAttribute("sessionVo");
		mav.addObject("monthloadlist", customBillService.getMonthLoadByCustomId(sessionVo.getUserAndCustomVO().getCustomVO().getID()));
		return mav;	
	}
	
	/**
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="yearloadtable")
	public ModelAndView getYearDataByCustomId(HttpSession session){
		ModelAndView mav = new ModelAndView("yearloadtable");
		SessionVO sessionVo=(SessionVO) session.getAttribute("sessionVo");
		mav.addObject("yearloadlist", customBillService.getYearLoadByCustomId(sessionVo.getUserAndCustomVO().getCustomVO().getID()));
		return mav;	
	}
	
	@RequestMapping(value="getDayBill")
	public @ResponseBody List<Map<String, String>> getDayBill(){
		return customBillService.getDayBill();
		
	}
	
	@RequestMapping(value="getMonthBill")
	public @ResponseBody List<Map<String, String>> getMonthBill(){
		List<Map<String, String>> list =customBillService.getMonthBill();
		return list;
	}
	@RequestMapping(value="getYearBill")
	public @ResponseBody List<Map<String, String>> getYearBill(){
		return customBillService.getYearBill();
		
	}
	
	
	
	@RequestMapping(value="getmonthbillbycustomId")
	public @ResponseBody List<LoadBillVO> getmonthBillByCustomId(){
		return customBillService.getMonthBillByCustomId(1, "2017", "2018");		
	}

}
