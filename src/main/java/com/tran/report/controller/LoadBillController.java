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
import com.tran.report.service.DynamicDataService;
import com.tran.report.service.LoadBillService;
import com.tran.report.vo.LoadBillVO;
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
public class LoadBillController {
	@Autowired
	LoadBillService customBillService;
	@Autowired
	DynamicDataService DynamicDataService;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="historyload")
	public ModelAndView historyLoad() {
		ModelAndView mav = new ModelAndView("historydata");
		
		List<LoadBillVO> daybill =customBillService.getDayBill();
		List<LoadBillVO> monthbill =customBillService.getMonthBill();
		List<LoadBillVO> yearbill = customBillService.getYearBill();
	
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
			System.out.println("--------------------------------#####"+customBill);
			daydata.add(Double.parseDouble(customBill.getElecAmount()));
		}
		mav.addObject("daydata", daydata);
		
		for(LoadBillVO customBill:monthbill) {
			System.out.println("--------------------------------#####"+customBill);
			monthdata.add(Double.parseDouble(customBill.getElecAmount()));
		}		
		mav.addObject("monthdata", monthdata);
		
		for(LoadBillVO customBill:yearbill) {
			System.out.println("--------------------------------#####"+customBill);
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
		SessionVo sessionVo=(SessionVo) session.getAttribute("sessionVo");
		mav.addObject("dayloadlist", customBillService.getDayLoadByCustomId(sessionVo.getUserVO().getCustomVO().getID()));
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
		mav.addObject("monthloadlist", customBillService.getMonthLoadByCustomId(sessionVo.getUserVO().getCustomVO().getID()));
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
		mav.addObject("yearloadlist", customBillService.getYearLoadByCustomId(sessionVo.getUserVO().getCustomVO().getID()));
		return mav;	
	}
	
	@RequestMapping(value="getdaybill")
	public @ResponseBody List<LoadBillVO> getDayBill(){
		return customBillService.getDayBill();
		
	}
	
	@RequestMapping(value="getmonthbill")
	public @ResponseBody List<Double> getMonthBill(){
		List<LoadBillVO> list =customBillService.getMonthBill();
		List<Double> vo= new LinkedList<>();
		for(LoadBillVO customBill:list) {
			vo.add(Double.valueOf(customBill.getElecAmount()));
		}
		
		return vo;
	}
	@RequestMapping(value="getyearbill")
	public @ResponseBody List<LoadBillVO> getYearBill(){
		return customBillService.getYearBill();
		
	}
	@RequestMapping(value="getmonthbillbycustomId")
	public @ResponseBody List<LoadBillVO> getmonthBillByCustomId(){
		return customBillService.getMonthBillByCustomId(1, "2017", "2018");
		
	}

}
