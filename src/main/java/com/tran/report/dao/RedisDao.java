package com.tran.report.dao;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSON;
import com.tran.report.pojo.Load;
import com.tran.report.pojo.LoadToRedis;

import redis.clients.jedis.Jedis;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月5日 下午3:42:01 Description:
 *
 * @param
 */
@Repository
public class RedisDao {
	//时间序集合
	private static final String TIMELIST = "timeList";
	private static final String CUSTOMIDSET = "customIdSet";
	@Autowired
	RedisDB redisDB;

	/**
	 * 删除key-value
	 * 
	 * @param id
	 * @return
	 */
	public boolean del(String id) {
		Jedis jedis = redisDB.getJedis();

		return false;
	}

	public List getData() {

		return null;
	}

	public List<LoadToRedis> getAllData() {
		Jedis jedis = RedisDB.getJedis();
		List<LoadToRedis> loadData = new LinkedList<>();
		List<String> timeList = jedis.lrange(TIMELIST, 0, -1);
		Set<String> idList = jedis.zrange(CUSTOMIDSET, 0, -1);

		for (String id : idList) {
			for (String time : timeList) {
				LoadToRedis ltr = new LoadToRedis();
				ltr.setCustomId(id);
				ltr.setCreateTime(time);
				String loadJson = jedis.hget(id, time);
				Load load = JSON.parseObject(loadJson, Load.class);
				ltr.setLoad(load);
				loadData.add(ltr);
			}
		}
		jedis.close();
		return loadData;
	}
	
	
	/**
	 * 根据客户Id取动态负荷数据
	 * @param customId
	 * @return
	 */
	public List<LoadToRedis> getDataByCustomId(String customId) {
		Jedis jedis = RedisDB.getJedis();
		List<LoadToRedis> loadData = new LinkedList<>();
		List<String> timeList = jedis.lrange(TIMELIST+customId, 0, -1);
		String[] times = new String[timeList.size()];
		List<String> jsonList = jedis.hmget(customId, timeList.toArray(times));
		int i = 0;
		for (String loadJson : jsonList) {
			LoadToRedis ltr = new LoadToRedis();
			ltr.setCustomId(customId);
			ltr.setCreateTime(times[i++]);
			Load load = JSON.parseObject(loadJson, Load.class);
			ltr.setLoad(load);
			loadData.add(ltr);
		}
		jedis.close();
		return loadData;
	}

	/**
	 * 
	 * @param TimeData
	 * @return
	 */
	public boolean saveData(LoadToRedis load) {
		Jedis jedis = RedisDB.getJedis();
		String ID = load.getCustomId();
		String creatTime = load.getCreateTime();
		String loadinfo = JSON.toJSONString(load.getLoad());
		if (StringUtils.isEmpty(ID) || StringUtils.isEmpty(creatTime) || StringUtils.isEmpty(loadinfo))
			return false;
		jedis.zadd(CUSTOMIDSET, 1, ID);
		if (jedis.hset(ID, creatTime, loadinfo) > 0 && jedis.rpush(TIMELIST+ID, creatTime) > 0)
			return true;
		jedis.close();
		return false;
	}
	
	public boolean deleteData() {
		
		return false;
		
	}
	public boolean deleteDataByCustomId(String customId) {
		
		return false;
	}
}