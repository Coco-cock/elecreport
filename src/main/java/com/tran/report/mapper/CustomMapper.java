package com.tran.report.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tran.report.model.Custom;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午3:10:26   
* Description:  
*
*@param     
*/
@Repository
public interface CustomMapper {
	List<Custom> getCustomInfo();
	
	Custom getCustomById(@Param("customId") String customId);

}
