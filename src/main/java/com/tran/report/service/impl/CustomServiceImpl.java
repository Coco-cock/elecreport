package com.tran.report.service.impl;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月14日 下午1:43:04   
* Description:  
*
*@param     
*/

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tran.report.mapper.CustomMapper;
import com.tran.report.model.Custom;
import com.tran.report.service.CustomService;
@Service
public class CustomServiceImpl implements CustomService{
	@Autowired
	CustomMapper customMapper;
	@Override
	public List<Custom> getCustomInfo() {
		
		return customMapper.getCustomInfo();
	}

	@Override
	public Custom getCustomInfoById(String customid) {
		
		return customMapper.getCustomById(customid);
	}

}
