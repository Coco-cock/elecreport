package com.tran.report.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.pojo.LoadToRedis;
import com.tran.report.service.DynamicDataService;
import com.tran.report.service.UserAndCustomService;
import com.tran.report.vo.CustomVO;
/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月18日 下午10:19:11 Description:
 *
 * @param
 */
@Controller
public class DynamicDataController extends BaseController{
	private static final Logger logger = Logger.getLogger(DynamicDataController.class);
	@Autowired
	DynamicDataService DynamicDataService;
	@Autowired
	UserAndCustomService uacService;
	
	/**
	 * 携带customId转发到seeCustomDynamicData.jsp
	 * @param customId
	 * @return
	 */
	@RequestMapping(value = "goSeeCustomDynamicData/{customId}")
	public ModelAndView goSeeCustomDynamicData(@PathVariable("customId")String customId) {
		CustomVO customVO=uacService.getCustomVoById(customId);
		return new ModelAndView("seeCustomDynamicData").addObject("customVO", customVO);
	}
	
	/**
	 * 将Redis中的数据格式化后,传给页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "getDynamicData", method = RequestMethod.POST)
	public @ResponseBody Map<String, List<?>> getDynamicData(HttpSession session) {
		String customId = this.getSessionCustomId(session);
		if (StringUtils.isNotBlank(customId)) {
			List<LoadToRedis> datalist = DynamicDataService.getCustomLoadData(customId);
			Map<String, List<?>> map = new HashMap<>();
			List<String> time = new LinkedList<>();
			List<Double> Vdata = new LinkedList<>();
			List<Double> Adata = new LinkedList<>();
			List<Double> Pdata = new LinkedList<>();
			for (LoadToRedis ltr : datalist) {
				time.add(ltr.getCreateTime().substring(10, 19));
				logger.info(ltr.getLoad().getVoltage());
				Vdata.add(Double.valueOf(ltr.getLoad().getVoltage()));
				Adata.add(Double.valueOf(ltr.getLoad().getCurrent()));
				Pdata.add(Double.valueOf(ltr.getLoad().getPower()));
			}
			map.put("time", time);
			map.put("Vdata", Vdata);
			map.put("Adata", Adata);
			map.put("Pdata", Pdata);
			return map;
		}
		return new HashMap<>();
	}
	
	@RequestMapping(value = "getDynamicDataByCustomId/{customId}", method = RequestMethod.POST)
	public @ResponseBody Map<String, List<?>> getDynamicDataByCustomId(@PathVariable("customId")String customId) {

		if (StringUtils.isNotBlank(customId)) {
			List<LoadToRedis> datalist = DynamicDataService.getCustomLoadData(customId);
			Map<String, List<?>> map = new HashMap<>();
			List<String> time = new LinkedList<>();
			List<Double> Vdata = new LinkedList<>();
			List<Double> Adata = new LinkedList<>();
			List<Double> Pdata = new LinkedList<>();
			for (LoadToRedis ltr : datalist) {
				time.add(ltr.getCreateTime().substring(10, 19));
				logger.info(ltr.getLoad().getVoltage());
				Vdata.add(Double.valueOf(ltr.getLoad().getVoltage()));
				Adata.add(Double.valueOf(ltr.getLoad().getCurrent()));
				Pdata.add(Double.valueOf(ltr.getLoad().getPower()));
			}
			map.put("time", time);
			map.put("Vdata", Vdata);
			map.put("Adata", Adata);
			map.put("Pdata", Pdata);
			return map;
		}
		return new HashMap<>();
	}

}
