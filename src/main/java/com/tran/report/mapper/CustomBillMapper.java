package com.tran.report.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
@Repository
public interface CustomBillMapper {
	List<CustomBill> getDayBill();
	List<CustomBill> getMonthBill();
	List<CustomBill> getYearBill();
	List<CustomBill> getDayBillByCustomId(@Param("CustomId")int CustomId,@Param("startTime")String startTime,@Param("endTime")String endTime);
	List<CustomBill> getMonthBillByCustomId(@Param("CustomId")int CustomId,@Param("startTime")String startTime,@Param("endTime")String endTime);
	List<CustomBill> getYearBillByCustomId(@Param("CustomId")int CustomId,@Param("startTime")String startTime,@Param("endTime")String endTime);
	List<CustomBill> getDayLoadByCustomId(@Param("customId")String customId);
	List<CustomBill> getMonthLoadByCustomId(@Param("customId")String customId);
	List<CustomBill> getYearLoadByCustomId(@Param("customId")String customId);
}
