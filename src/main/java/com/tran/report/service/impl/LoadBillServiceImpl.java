package com.tran.report.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.tran.report.entity.DayLoadBill;
import com.tran.report.entity.MonthLoadBill;
import com.tran.report.entity.YearLoadBill;
import com.tran.report.repository.CustomRepository;
import com.tran.report.repository.DayLoadBillRepository;
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

	@Override
	public List<LoadBillVO> getDayBill() {
		List<DayLoadBill> dayList = dayLoadBillRepository.findAll();
		List<LoadBillVO> voList = Lists.transform(dayList, new Function<DayLoadBill, LoadBillVO>() {
			@Override
			public LoadBillVO apply(DayLoadBill bill) {
				LoadBillVO vo = new LoadBillVO();
				BeanUtils.copyProperties(bill, vo);
				return vo;
			}
		});
		return voList;
	}

	@Override
	public List<LoadBillVO> getMonthBill() {
		List<MonthLoadBill> billList=monthLoadBillRepository.findAll();
		List<LoadBillVO> voList = Lists.transform(billList, new Function<MonthLoadBill, LoadBillVO>() {
			@Override
			public LoadBillVO apply(MonthLoadBill bill) {
				LoadBillVO vo = new LoadBillVO();
				BeanUtils.copyProperties(bill, vo);
				return vo;
			}
		});
		return voList;
	}

	@Override
	public List<LoadBillVO> getYearBill() {
	  List<YearLoadBill> billList=yearLoadBillRepository.findAll();
		List<LoadBillVO> voList = Lists.transform(billList, new Function<YearLoadBill, LoadBillVO>() {
			@Override
			public LoadBillVO apply(YearLoadBill bill) {
				LoadBillVO vo = new LoadBillVO();
				BeanUtils.copyProperties(bill, vo);
				return vo;
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
	public List<LoadBillVO> getDayLoadByCustomId(String customId) {
		return null;// customBillMapper.getDayLoadByCustomId(customId);
	}

	@Override
	public List<LoadBillVO> getMonthLoadByCustomId(String customId) {
		return null;// customBillMapper.getMonthLoadByCustomId(customId);
	}

	@Override
	public List<LoadBillVO> getYearLoadByCustomId(String customId) {
		return null;// customBillMapper.getYearLoadByCustomId(customId);
	}

}
