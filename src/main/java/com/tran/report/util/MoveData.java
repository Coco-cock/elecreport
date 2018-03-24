package com.tran.report.util;

import java.util.Date;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tran.report.service.DynamicDataService;
import com.tran.report.service.impl.DynamicDataServiceImpl;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月19日 下午5:19:48   
* Description:  
*
*@param     
*/
@Component
public class MoveData extends TimerTask {
	private static final Logger logger = Logger.getLogger(MoveData.class);
	@Autowired
	DynamicDataService dynamicDataService;
	@Override
	public void run() {
		logger.info("MoveData-->开始:"+new Date(System.currentTimeMillis()));
		dynamicDataService.doDataRedisToMysqlTask();
		logger.info("MoveData-->结束:"+new Date(System.currentTimeMillis()));
	}

}
