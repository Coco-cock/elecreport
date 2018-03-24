package com.tran.report.service.impl;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.tran.report.entity.DayLoadBill;
import com.tran.report.entity.LoadData;
import com.tran.report.entity.MonthLoadBill;
import com.tran.report.entity.YearLoadBill;
import com.tran.report.repository.CustomRepository;
import com.tran.report.repository.DayLoadBillRepository;
import com.tran.report.repository.LoadDataRepository;
import com.tran.report.repository.MonthLoadBillRepository;
import com.tran.report.repository.YearLoadBillRepository;
import com.tran.report.service.LoadBillService;
import com.tran.report.vo.LoadBillVO;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月12日 下午5:10:21 Description:
 *
 * @param
 */
@Service
@Transactional
public class LoadBillServiceImpl implements LoadBillService {

	@Autowired
	CustomRepository customRepository;
	@Autowired
	DayLoadBillRepository dayLoadBillRepository;
	@Autowired
	MonthLoadBillRepository monthLoadBillRepository;
	@Autowired
	YearLoadBillRepository yearLoadBillRepository;
	@Autowired
	LoadDataRepository loadDataRepository;

	@Override
	public List<Map<String,String>> getDayBill() {
		List<DayLoadBill> billList = dayLoadBillRepository.findAll();
		//Collections.sort(billList);//按照时间排序
		//Collections.reverse(billList);
		List<Map<String,String>> voList = Lists.transform(billList,
				new Function<DayLoadBill, Map<String, String>>() {
					@Override
					public Map<String, String> apply(DayLoadBill bill) {
						Map<String, String> voMap = new HashMap<>();				
						String date = new SimpleDateFormat("yyyy-MM-dd").format(bill.getEditTime());
						String elecAmount = bill.getElecAmount();
						voMap.put("time", date);
						voMap.put("elecAmount", elecAmount);
						return voMap;
					}
				});
		return voList;
	}

	@Override
	public List<Map<String, String>> getMonthBill() {
		List<MonthLoadBill> billList = monthLoadBillRepository.findAll();
	
		List<Map<String,String>> voList = Lists.transform(billList,
				new Function<MonthLoadBill, Map<String, String>>() {
					@Override
					public Map<String, String> apply(MonthLoadBill bill) {
						Map<String, String> voMap = new HashMap<>();				
						String date =new SimpleDateFormat("yyyy-MM").format(bill.getEditTime());
						String elecAmount = bill.getElecAmount();
						voMap.put("time", date);
						voMap.put("elecAmount", elecAmount);
						return voMap;
					}
				});
		return voList;
	}

	@Override
	public List<Map<String,String>> getYearBill() {
		List<YearLoadBill> billList = yearLoadBillRepository.findAll();

		List<Map<String,String>> voList = Lists.transform(billList,
				new Function<YearLoadBill, Map<String, String>>() {
					@Override
					public Map<String, String> apply(YearLoadBill bill) {
						Map<String, String> voMap = new HashMap<>();				
						String date = new SimpleDateFormat("yyyy").format(bill.getEditTime());
						String elecAmount = bill.getElecAmount();
						voMap.put("time", date);
						voMap.put("elecAmount", elecAmount);
						return voMap;
					}
				});
		return voList;
	}

	@Override
	public List<LoadBillVO> getDayBillByCustomId(int CustomId, String startTime, String endTime) {
		return null; // customBillMapper.getDayBillByCustomId(CustomId, startTime, endTime);
	}

	@Override
	public List<LoadBillVO> getMonthBillByCustomId(int CustomId, String startTime, String endTime) {

		return null;// customBillMapper.getMonthBillByCustomId(CustomId, startTime, endTime);
	}

	@Override
	public List<LoadBillVO> getYearBillByCustomId(int CustomId, String startTime, String endTime) {
		return null;// customBillMapper.getYearBillByCustomId(CustomId, startTime, endTime);
	}

	@Override
	public List<Map<String,String>> getDayLoadByCustomId(String customId) {
		List<DayLoadBill> billList=dayLoadBillRepository.findAllByCustom_ID(customId);
		List<Map<String,String>> voList = Lists.transform(billList,
				new Function<DayLoadBill, Map<String, String>>() {
					@Override
					public Map<String, String> apply(DayLoadBill bill) {
						Map<String, String> voMap = new HashMap<>();				
						String date = new SimpleDateFormat("yyyy-MM-dd").format(bill.getEditTime());
						String elecAmount = bill.getElecAmount();
						voMap.put("time", date);
						voMap.put("elecAmount", elecAmount);
						return voMap;
					}
				});
		return voList;
	}

	@Override
	public List<Map<String, String>> getMonthLoadByCustomId(String customId) {
		List<MonthLoadBill> billList = monthLoadBillRepository.findAllByCustom_ID(customId);
		
		List<Map<String,String>> voList = Lists.transform(billList,
				new Function<MonthLoadBill, Map<String, String>>() {
					@Override
					public Map<String, String> apply(MonthLoadBill bill) {
						Map<String, String> voMap = new HashMap<>();				
						String date =new SimpleDateFormat("yyyy-MM").format(bill.getEditTime());
						String elecAmount = bill.getElecAmount();
						voMap.put("time", date);
						voMap.put("elecAmount", elecAmount);
						return voMap;
					}
				});

		return voList;
	}

	@Override
	public List<Map<String, String>> getYearLoadByCustomId(String customId) {
		List<YearLoadBill> billList = yearLoadBillRepository.findAllByCustom_ID(customId);

		List<Map<String,String>> voList = Lists.transform(billList,
				new Function<YearLoadBill, Map<String, String>>() {
					@Override
					public Map<String, String> apply(YearLoadBill bill) {
						Map<String, String> voMap = new HashMap<>();				
						String date = new SimpleDateFormat("yyyy").format(bill.getEditTime());
						String elecAmount = bill.getElecAmount();
						voMap.put("time", date);
						voMap.put("elecAmount", elecAmount);
						return voMap;
					}
				});
		return voList;
	}

	@Override
	public List<Map<String, String>> getLoadDate() {
		loadDataRepository.findAll();
		return null;
	}

	@Override
	public List<LoadData> getLoadDataByCustomId(String customId) {
		
		return loadDataRepository.findAllByCustom_ID(customId);
	}

}
