package com.tran.report.dao;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import redis.clients.jedis.Jedis;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月5日 下午3:42:01 Description:
 *
 * @param
 */

public class Dao {


	/**
	 * 删除key-value
	 * 
	 * @param id
	 * @return
	 */
	public boolean del(String id) {
		Jedis jedis = DB.getJedis();
		
		return false;
	}



}