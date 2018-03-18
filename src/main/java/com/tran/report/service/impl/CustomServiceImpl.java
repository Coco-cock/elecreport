package com.tran.report.service.impl;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月14日 下午1:43:04   
* Description:  
*
*@param     
*/

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.tran.report.entity.Custom;
import com.tran.report.repository.CustomRepository;
import com.tran.report.service.CustomService;
import com.tran.report.util.Status;
import com.tran.report.vo.CustomVO;
@Service
@Transactional
public class CustomServiceImpl implements CustomService{
	@Autowired
	CustomRepository customRepository;
	@Override
	public List<CustomVO> getCustomInfo() {
		List<Custom> customList=customRepository.findAll();
		List<CustomVO> voList = Lists.transform(customList, new Function<Custom, CustomVO>() {
			@Override
			public CustomVO apply(Custom custom) {
				CustomVO vo = new CustomVO();		
				BeanUtils.copyProperties(custom, vo);		
				vo.setCustomStatus(Status.getName(custom.isCustomStatus()));
				return vo;
			}
		});
		return voList;
	}

	@Override
	public CustomVO getCustomVoById(String customid) {
		Custom custom =customRepository.findOne(customid);
		if(custom==null)
			return null;
		CustomVO vo = new CustomVO();
		BeanUtils.copyProperties(custom, vo);
		vo.setCustomStatus(Status.getName(custom.isCustomStatus()));
		return vo;
	}

	@Override
	public Custom getCustomByUserId(String userId) {
		Custom custom=customRepository.findOne(userId);
		return custom;
	}

	@Override
	public boolean saveCustom(CustomVO customVO) {
		Custom custom = new Custom();
		BeanUtils.copyProperties(customVO, custom);
		
		if(customRepository.saveAndFlush(custom)!=null)
			return true;
		return false;
	}

	@Override
	public boolean editCustom(CustomVO customVO) {
		if(customRepository.findOne(customVO.getID())!=null) {
			Custom custom =new Custom();
			BeanUtils.copyProperties(customVO, custom);
			customRepository.saveAndFlush(custom);
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteCustom(String customId) {
		customRepository.delete(customId);
		if(customRepository.findOne(customId)==null)
			return true;
		return false;
	}

}
