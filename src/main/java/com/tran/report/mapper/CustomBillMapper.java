package com.tran.report.mapper;

import java.util.List;

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

public interface CustomBillMapper {
	List<CustomBill> getDayBill();
	List<CustomBill> getMonthBill();
	List<CustomBill> getYearBill();

}
