package com.tran.report.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tran.report.model.LoadToRedis;
import com.tran.report.service.DynamicDataService;
import com.tran.report.vo.SessionVO;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月18日 下午10:19:11 Description:
 *
 * @param
 */
@Controller
public class DynamicDataController {
	@Autowired
	DynamicDataService DynamicDataService;
	
	/**
	 * 将Redis中的数据格式化后,传给页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "getDynamicData", method = RequestMethod.POST)
	public @ResponseBody Map<String, List<?>> getDynamicData(HttpSession session, Model modelMap) {
		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		
		String customID = null;
		if (sessionVO != null) {
			customID = sessionVO.getUserAndCustomVO().getCustomVO().getID();
			System.out.println(customID);
		}
		if (StringUtils.isNotBlank(customID)) {
			List<LoadToRedis> datalist = DynamicDataService.getCustomLoadData(customID);
			Map<String, List<?>> map = new HashMap<>();
			List<String> time = new LinkedList<>();
			List<Double> Vdata = new LinkedList<>();
			List<Double> Adata = new LinkedList<>();
			List<Double> Pdata = new LinkedList<>();
			for (LoadToRedis ltr : datalist) {
				time.add(ltr.getCreateTime().substring(10, 19));
				Vdata.add(ltr.getLoad().getVoltage());
				Adata.add(ltr.getLoad().getCurrent());
				Pdata.add(ltr.getLoad().getPower());
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
