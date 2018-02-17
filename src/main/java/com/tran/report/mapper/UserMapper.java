package com.tran.report.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tran.report.model.Custom;
import com.tran.report.model.User;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午3:09:36   
* Description:  
*
*@param     
*/

public interface UserMapper {
	List<User> getAllUser();  	
	User findUserByName(@Param("userName") String userName);
	Custom findCustom(User user);
	Custom getCustomByuserId(@Param("userId") String userId);
	boolean add(User user);	
	boolean update(User user);
	boolean delete(Integer id);  
	User findByID(Integer id);	

}
