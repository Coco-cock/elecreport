package com.tran.report.service;

import com.tran.report.model.Custom;
import com.tran.report.model.User;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月17日 下午3:50:59   
* Description:  
*
*@param     
*/

public interface UserService {
	Custom getCustomByuserId(String userId);
	String findUser(User user);

}
