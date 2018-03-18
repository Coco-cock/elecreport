package com.tran.report.dao;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSON;
import com.tran.report.model.Load;
import com.tran.report.model.LoadToRedis;

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
	private static final String TIMEDATA="timeData";
	private static final String CUSTOMID="customId";
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
    public List getData(){
    	
    	
		return null;   	
    }
    
    
	public List<LoadToRedis> getAllData() {
		Jedis jedis = redisDB.getJedis();
		List<LoadToRedis> loadData= new LinkedList<>();
		List<String> timeList=jedis.lrange(TIMEDATA, 0, -1);		
		Set<String> idList=jedis.zrange(CUSTOMID, 0, -1);
		
		for(String id:idList) {
			for(String time:timeList) {
				LoadToRedis ltr=new LoadToRedis();
				ltr.setCustomId(id);
				ltr.setCreateTime(time);
				String loadJson=jedis.hget(id,time);
				Load load=JSON.parseObject(loadJson, Load.class);
				ltr.setLoad(load);
				loadData.add(ltr);
			}
		}
		jedis.close();
		return loadData;
	}
	
	
	
	public List<LoadToRedis> getDataById(String customId) {
		Jedis jedis = redisDB.getJedis();
		List<LoadToRedis> loadData= new LinkedList<>();
		List<String> timeList=jedis.lrange(TIMEDATA, 0, -1);
		String[] times=new String[timeList.size()];
		List<String> jsonList = jedis.hmget(customId,timeList.toArray(times));
		
	/*	for(String time:timeList) {
			NodeLoad nodeLoad=new NodeLoad();
			nodeLoad.setCustomId(customId);
			nodeLoad.setCreateTime(time);
			String loadJson=jedis.hget(customId,time);
			Load load=JSON.parseObject(loadJson, Load.class);
			nodeLoad.setLoad(load);
			loadData.add(nodeLoad);
		}*/
		
		int i=0;
		for(String loadJson:jsonList) {
			LoadToRedis ltr=new LoadToRedis();
			ltr.setCustomId(customId);
			ltr.setCreateTime(times[i++]);
			Load load=JSON.parseObject(loadJson, Load.class);
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
	public boolean  saveData(LoadToRedis nodeLoad) {
		Jedis jedis = redisDB.getJedis();
		String ID=nodeLoad.getCustomId();
		String creatTime=nodeLoad.getCreateTime();
		String loadinfo=JSON.toJSONString(nodeLoad.getLoad());
		if(StringUtils.isEmpty(ID)||StringUtils.isEmpty(creatTime)||StringUtils.isEmpty(loadinfo))
			return false;
		jedis.zadd(CUSTOMID, 1, ID);
		if(jedis.hset(ID, creatTime, loadinfo)>0 && jedis.rpush(TIMEDATA, creatTime)>0)
		return true;
		jedis.close();
		return false;
	}

}