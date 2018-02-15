package com.tran.report.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tran.report.dao.RedisDao;
import com.tran.report.service.DynamicDataService;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月14日 下午11:15:16   
* Description:  
*
*@param     
*/

public class DynamicDataServiceImpl implements DynamicDataService {
	@Autowired
	RedisDao redisDao;
	@Override
	public String getAllLoadData() {
		
		return redisDao.get("studentid");
	}

	@Override
	public List getCustomLoadData() {
		return null;
	}

}
