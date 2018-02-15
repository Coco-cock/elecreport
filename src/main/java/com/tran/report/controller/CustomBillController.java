package com.tran.report.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.dao.RedisDao;
import com.tran.report.model.CustomBill;
import com.tran.report.service.CustomBillService;

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
public class CustomBillController {
	@Autowired
	CustomBillService customBillService;
	@RequestMapping(value="loadline")
	public ModelAndView loadLine() {
		ModelAndView mav = new ModelAndView("loadline");
		
		List<CustomBill> daybill =customBillService.getDayBill();
		List<CustomBill> monthbill =customBillService.getMonthBill();
		List<CustomBill> yearbill = customBillService.getYearBill();
		
		List<Double> daydata = new LinkedList<>();
		List<Double> monthdata = new LinkedList<>();
		List<Double> yeardata = new LinkedList<>();
		
		for(CustomBill customBill:daybill) {
			System.out.println(customBill.getCreateTime().substring(5, 7));
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
		RedisDao r=new RedisDao();
		System.out.println(r.get("studentid"));	
		
		
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
