package com.tran.report.test;

import com.tran.report.dao.RedisDao;
import com.tran.report.model.Load;
import com.tran.report.model.LoadToRedis;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月16日 下午9:00:02   
* Description:  
*
*@param     
*/

public class RedisDaoTest {
	public static void main(String[] args) {
		Load load=new Load(220.0, 10, 2200);
		LoadToRedis node =new LoadToRedis(1, "1", load, "2018-02-15");
		RedisDao r=new RedisDao();
		//System.out.println(r.saveData(node));
		System.out.println(r.getAllData());
		//System.out.println(r.getDataById("1"));
		
	}

}
