package com.tran.report.test;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import com.tran.report.util.CreateData;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月16日 下午11:17:32   
* Description:  
*
*@param     
*/

public class CreateDataTest {
	public static void main(String[] args) {
	    Calendar calendar = Calendar.getInstance();
	    calendar.set(Calendar.HOUR_OF_DAY, 11); // 控制时
	    calendar.set(Calendar.MINUTE, 25);    // 控制分
	    calendar.set(Calendar.SECOND, 0);    // 控制秒
	    Date time = calendar.getTime();     // 得出执行任务的时间,此处为今天的12：00：00
	    CreateData cd=new CreateData();
	    Timer timer = new Timer();
	    timer.scheduleAtFixedRate(cd
	   , time, 1000 * 60);// 一分钟一次
	  }

}
