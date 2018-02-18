package com.tran.report.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tran.report.model.NodeLoad;
import com.tran.report.service.DynamicDataService;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月18日 下午10:19:11   
* Description:  
*
*@param     
*/
@Controller
public class DynamicDataController {
	@Autowired
	DynamicDataService DynamicDataService;
	
	@RequestMapping(value="index")
	public String index() {		
		return "dynamicdata";	
	}
	@RequestMapping(value="getdynamicdata")
	public @ResponseBody Map<String,List<?>> getDynamicData(){
		List<NodeLoad> datalist=DynamicDataService.getCustomLoadData("1");
		Map<String,List<?>>map= new HashMap<>();
		List<String> time = new LinkedList<>();
		List<Double> Vdata = new LinkedList<>();
		List<Double> Adata = new LinkedList<>();
		List<Double> Pdata = new LinkedList<>();
     for(NodeLoad node:datalist) {
			
			time.add(node.getCreateTime().substring(10, 19));
			Vdata.add(node.getLoad().getVoltage());
			Adata.add(node.getLoad().getCurrent());
			Pdata.add(node.getLoad().getPower());
		}
	     map.put("time", time);
	     map.put("Vdata", Vdata);
		 map.put("Adata", Adata);
		 map.put("Pdata", Pdata);
		return map;
		
	}

}
