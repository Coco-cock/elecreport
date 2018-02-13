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

}
