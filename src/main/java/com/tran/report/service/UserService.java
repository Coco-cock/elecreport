package com.tran.report.service;

import java.util.List;

import com.tran.report.entity.User;
import com.tran.report.vo.UserAndCustomVO;
import com.tran.report.vo.UserVO;

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
	List<UserAndCustomVO> getAllUserAndCustom();
	boolean findUser(User user);
	UserAndCustomVO getUser(String userName,String password);
	boolean saveUser(UserVO userVO);
	boolean editUser(User user);
	boolean deleteUser(String userId);

}
