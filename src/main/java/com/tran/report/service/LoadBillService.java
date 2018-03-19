package com.tran.report.service;

import java.util.List;
import java.util.Map;

import com.tran.report.entity.LoadData;
import com.tran.report.vo.LoadBillVO;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午3:11:03   
* Description:  
*
*@param     
*/


public interface LoadBillService {
	List<Map<String,String>> getDayBill();
	List<Map<String,String>> getMonthBill();
	List<Map<String,String>> getYearBill();
	List<Map<String,String>> getLoadDate();
	List<LoadBillVO> getDayBillByCustomId(int CustomId,String startTime,String endTime);
	List<LoadBillVO> getMonthBillByCustomId(int CustomId,String startTime,String endTime);
	List<LoadBillVO> getYearBillByCustomId(int CustomId,String startTime,String endTime);
	List<Map<String,String>> getDayLoadByCustomId(String customId);
	List<Map<String,String>> getMonthLoadByCustomId(String customId);
	List<Map<String,String>> getYearLoadByCustomId(String customId);
	List<LoadData> getLoadDataByCustomId(String customId);

}
