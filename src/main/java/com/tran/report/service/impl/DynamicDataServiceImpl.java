package com.tran.report.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.tran.report.dao.RedisDao;
import com.tran.report.entity.LoadData;
import com.tran.report.pojo.LoadToRedis;
import com.tran.report.repository.CustomRepository;
import com.tran.report.repository.LoadRepository;
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
@Service
public class DynamicDataServiceImpl implements DynamicDataService {
	private static final Logger logger = Logger.getLogger(DynamicDataServiceImpl.class);
	@Autowired
	RedisDao redisDao;
	@Autowired
	LoadRepository loadRepository;
	@Autowired
	CustomRepository customRepository;
	@Override
	public List<LoadToRedis> getAllLoadData() {
		return redisDao.getAllData();		
	}

	@Override
	public List<LoadToRedis> getCustomLoadData(String customId) {
		return redisDao.getDataByCustomId(customId);

	}

	@Override
	public void doDataRedisToMysqlTask() {
		List<LoadToRedis> redisDataList=redisDao.getAllData();
		
		List<LoadData> mysqlDataList=Lists.transform(redisDataList,
				new Function<LoadToRedis, LoadData>() {

					@Override
					public LoadData apply(LoadToRedis ltr) {
						LoadData loadData =new LoadData();
						loadData.setCurrent(String.valueOf(ltr.getLoad().getCurrent()));
						loadData.setVoltage(String.valueOf(ltr.getLoad().getVoltage()));
						loadData.setPowerValue(String.valueOf(ltr.getLoad().getPower()));
						try {
							Date editTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ltr.getCreateTime());
							loadData.setEditTime(editTime);
						} catch (ParseException e) {
							logger.error("doDataRedisToMysqlTask:日期转换失败！"+e);
						}
						loadData.setCustom(customRepository.findOne(ltr.getCustomId()));
						return loadData;
					}
		});	
		if(!loadRepository.save(mysqlDataList).isEmpty()) {
			logger.info("Redis数据迁移到Mysql成功!");
		}else{
			logger.error("Redis数据迁移到Mysql失败!");
		};
	}

}
