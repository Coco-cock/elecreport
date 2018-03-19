package com.tran.report.service;

import java.util.List;

import com.tran.report.model.LoadToRedis;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月14日 下午11:12:19 Description:
 *
 * @param
 */

public interface DynamicDataService {
	List<LoadToRedis> getAllLoadData();

	List<LoadToRedis> getCustomLoadData(String customId);
	void doDataRedisToMysqlTask();

}
