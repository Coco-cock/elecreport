package com.tran.report.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tran.report.mapper.CustomBillMapper;
import com.tran.report.model.CustomBill;
import com.tran.report.service.CustomBillService;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午5:10:21   
* Description:  
*
*@param     
*/
@Service
public class CustomBillServiceImpl implements CustomBillService {
	@Autowired
	CustomBillMapper customBillMapper;
	@Override
	public List<CustomBill> getDayBill() {
		return customBillMapper.getDayBill();
	}

	@Override
	public List<CustomBill> getMonthBill() {
		return customBillMapper.getMonthBill();
	}

	@Override
	public List<CustomBill> getYearBill() {
		return customBillMapper.getYearBill();
	}

	@Override
	public List<CustomBill> getDayBillByCustomId(int CustomId, String startTime, String endTime) {
		return customBillMapper.getDayBillByCustomId(CustomId, startTime, endTime);
	}

	@Override
	public List<CustomBill> getMonthBillByCustomId(int CustomId, String startTime, String endTime) {
	
		return customBillMapper.getMonthBillByCustomId(CustomId, startTime, endTime);
	}

	@Override
	public List<CustomBill> getYearBillByCustomId(int CustomId, String startTime, String endTime) {
		return customBillMapper.getYearBillByCustomId(CustomId, startTime, endTime);
	}

	@Override
	public List<CustomBill> getDayLoadByCustomId(String customId) {
		return customBillMapper.getDayLoadByCustomId(customId);
	}

	@Override
	public List<CustomBill> getMonthLoadByCustomId(String customId) {
		return customBillMapper.getMonthLoadByCustomId(customId);
	}

	@Override
	public List<CustomBill> getYearLoadByCustomId(String customId) {
		return customBillMapper.getYearLoadByCustomId(customId);
	}

}
