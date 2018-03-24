package com.tran.report.util;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tran.report.dao.RedisDao;
import com.tran.report.pojo.Load;
import com.tran.report.pojo.LoadToRedis;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月16日 下午10:03:46   
* Description:  
*
*@param     
*/
@Component
public class CreateData extends TimerTask {
	private static final Logger logger = Logger.getLogger(CreateData.class);
	@Autowired
	RedisDao redisDao=new RedisDao();
	@Override
	public void run() {
		this.createDate();
	}
	
	void createDate(){
		Random random = new Random();
		int current=random.nextInt(10);
		int voltage=random.nextInt(10)+215;
	    Load load =new Load(voltage, current, current*voltage);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createTime= sdf.format(new Date());		   
		LoadToRedis nodeLoad =new LoadToRedis("1", load, createTime);
		LoadToRedis nodeLoad2 =new LoadToRedis("2", load, createTime);
		boolean flag=redisDao.saveData(nodeLoad);
		boolean flag2=redisDao.saveData(nodeLoad2);
		logger.info("CreateData-->createDate() 保存数据："+"1"+flag);
		logger.info("CreateData-->createDate() 保存数据："+"2"+flag2);
	}
	

}
