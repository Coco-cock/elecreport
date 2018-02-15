package com.tran.report.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tran.report.model.CustomBill;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午3:11:03   
* Description:  
*
*@param     
*/


public interface CustomBillService {
	List<CustomBill> getDayBill();
	List<CustomBill> getMonthBill();
	List<CustomBill> getYearBill();
	List<CustomBill> getDayBillByCustomId(int CustomId,String startTime,String endTime);
	List<CustomBill> getMonthBillByCustomId(int CustomId,String startTime,String endTime);
	List<CustomBill> getYearBillByCustomId(int CustomId,String startTime,String endTime);


}
