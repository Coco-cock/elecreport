package com.tran.report.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.service.DynamicDataService;
import com.tran.report.service.LoadBillService;
import com.tran.report.service.UserAndCustomService;
import com.tran.report.vo.CustomVO;

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
public class LoadBillController extends BaseController{
	private static final Logger logger = Logger.getLogger(LoadBillController.class);
	@Autowired
	LoadBillService loadBillService;
	@Autowired
	DynamicDataService DynamicDataService;
	@Autowired
	UserAndCustomService uacService;
	
	@RequestMapping(value="historyload")
	public ModelAndView historyLoad() {
		return new ModelAndView("historydata");		
	}

	/**
	 * 携带customId转发到seeCustomHistoryData.jsp
	 * @param customId
	 * @return
	 */
	@RequestMapping(value = "goSeeCustomHistoryData/{customId}")
	public ModelAndView goSeeCustomHistoryData(@PathVariable("customId")String customId) {
		CustomVO customVO=uacService.getCustomVoById(customId);
		return new ModelAndView("seeCustomHistoryData").addObject("customVO", customVO);		
	}
	
	
	//------------------用户获取负荷表数据，以List形式返回------------
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
	

    //------------用户获取负荷信息--------曲线-------------
	/**
	 * Ajax,通过用户ID获取日负荷信息,用户登录后,ID从Session中获取.
	 * @param customId
	 * @return
	 */
	@RequestMapping(value="getDayBillByCustomId")
	public @ResponseBody List<Map<String, String>> getDayBillByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		if(customId.isEmpty()) {
			logger.error("getDayBillByCustomId ->cutomId为空!");
			return new ArrayList<Map<String, String>>();
		}
		return loadBillService.getDayLoadByCustomId(customId);
	}
	/**
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="getMonthBillByCustomId")
	public @ResponseBody List<Map<String, String>> getMonthBillByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		if(customId.isEmpty()) {
			logger.error("getMonthBillByCustomId ->cutomId为空!");
			return new ArrayList<Map<String, String>>();
		}
		return loadBillService.getMonthLoadByCustomId(customId);
	}
	/**
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="getYearBillByCustomId")
	public @ResponseBody List<Map<String, String>> getYearBillByCustomId(HttpSession session){
		String customId= this.getSessionCustomId(session);
		if(customId.isEmpty()) {
			logger.error("getYearBillByCustomId ->cutomId为空!");
			return new ArrayList<Map<String, String>>();
		}
		return loadBillService.getYearLoadByCustomId(customId);
	}
	
	//-------------------管理员查看用户负荷信息--------------------------
	/**
	 * Ajax,通过用户ID获取日负荷信息,ID从URL传入
	 * @param customId
	 * @return
	 */
	@RequestMapping(value="seeDayBillByCustomId/{customId}")
	public @ResponseBody List<Map<String, String>> seeDayLoadByCustomId(@PathVariable("customId")String customId){
		return loadBillService.getDayLoadByCustomId(customId);
	}
	/**
	 * 
	 * @param customId
	 * @return
	 */
	@RequestMapping(value="seeMonthBillByCustomId/{customId}")
	public @ResponseBody List<Map<String, String>> seeMonthBillByCustomId(@PathVariable("customId")String customId){
		return loadBillService.getMonthLoadByCustomId(customId);
	}
	
	/**
	 * 
	 * @param customId
	 * @return
	 */
	@RequestMapping(value="seeYearBillByCustomId/{customId}")
	public @ResponseBody List<Map<String, String>> seeYearBillByCustomId(@PathVariable("customId")String customId){
		return loadBillService.getYearLoadByCustomId(customId);
	}
	

	
	
	//--------------------获取所有负荷数据，Json返回，以下方法保留-------------------
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

}
