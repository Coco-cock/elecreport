package com.tran.report.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tran.report.entity.Custom;
import com.tran.report.vo.CustomVO;


/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午3:10:26   
* Description:  
*
*@param     
*/
@Service
public interface CustomService {
	List<CustomVO> getCustomInfo();
	CustomVO getCustomVoById(String customid);
	Custom getCustomByUserId(String userId);
	boolean saveCustom(CustomVO customVO);
	boolean editCustom(CustomVO customVO);
	boolean deleteCustom(String customId);
}
