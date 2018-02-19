package com.tran.report.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.model.CustomBill;
import com.tran.report.service.CustomBillService;
import com.tran.report.service.DynamicDataService;
import com.tran.report.vo.SessionVo;

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
public class HistoryDataController {
	@Autowired
	CustomBillService customBillService;
	@Autowired
	DynamicDataService DynamicDataService;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="historyload")
	public ModelAndView loadLine() {
		ModelAndView mav = new ModelAndView("historydata");
		
		List<CustomBill> daybill =customBillService.getDayBill();
		List<CustomBill> monthbill =customBillService.getMonthBill();
		List<CustomBill> yearbill = customBillService.getYearBill();
	
		List<Double> daydata = new LinkedList<>();
		List<Double> monthdata = new LinkedList<>();
		List<Double> yeardata = new LinkedList<>();
		
		for(CustomBill customBill:daybill) {
			//System.out.println(customBill.getCreateTime().substring(5, 7));
			daydata.add(customBill.getElecAmount());
		}
		mav.addObject("daydata", daydata);
		
		for(CustomBill customBill:monthbill) {
			monthdata.add(customBill.getElecAmount());
		}		
		mav.addObject("monthdata", monthdata);
		
		for(CustomBill customBill:yearbill) {
			yeardata.add(customBill.getElecAmount());
		}
		mav.addObject("yeardata", yeardata);
		
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
		
		List<CustomBill> daybill =customBillService.getDayLoadByCustomId(customId);
		List<CustomBill> monthbill =customBillService.getMonthLoadByCustomId(customId);
		List<CustomBill> yearbill = customBillService.getYearLoadByCustomId(customId);
	
		List<Double> daydata = new LinkedList<>();
		List<Double> monthdata = new LinkedList<>();
		List<Double> yeardata = new LinkedList<>();
		
		for(CustomBill customBill:daybill) {
			//System.out.println(customBill.getCreateTime().substring(5, 7));
			daydata.add(customBill.getElecAmount());
		}
		mav.addObject("daydata", daydata);
		
		for(CustomBill customBill:monthbill) {
			monthdata.add(customBill.getElecAmount());
		}		
		mav.addObject("monthdata", monthdata);
		
		for(CustomBill customBill:yearbill) {
			yeardata.add(customBill.getElecAmount());
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
		SessionVo sessionVo=(SessionVo) session.getAttribute("sessionVo");
		mav.addObject("dayloadlist", customBillService.getDayLoadByCustomId(sessionVo.getCustomId()));
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
		SessionVo sessionVo=(SessionVo) session.getAttribute("sessionVo");
		mav.addObject("monthloadlist", customBillService.getMonthLoadByCustomId(sessionVo.getCustomId()));
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
		SessionVo sessionVo=(SessionVo) session.getAttribute("sessionVo");
		mav.addObject("yearloadlist", customBillService.getYearLoadByCustomId(sessionVo.getCustomId()));
		return mav;	
	}
	
	@RequestMapping(value="getdaybill")
	public @ResponseBody List<CustomBill> getDayBill(){
		return customBillService.getDayBill();
		
	}
	
	@RequestMapping(value="getmonthbill")
	public @ResponseBody List<Double> getMonthBill(){
		List<CustomBill> list =customBillService.getMonthBill();
		List<Double> vo= new LinkedList<>();
		for(CustomBill customBill:list) {
			vo.add(customBill.getElecAmount());
		}
		
		return vo;
	}
	@RequestMapping(value="getyearbill")
	public @ResponseBody List<CustomBill> getYearBill(){
		return customBillService.getYearBill();
		
	}
	@RequestMapping(value="getmonthbillbycustomId")
	public @ResponseBody List<CustomBill> getmonthBillByCustomId(){
		return customBillService.getMonthBillByCustomId(1, "2017", "2018");
		
	}

}
