package com.tran.report.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tran.report.mapper.UserMapper;
import com.tran.report.model.Custom;
import com.tran.report.model.User;
import com.tran.report.service.UserService;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月17日 下午3:51:37   
* Description:  
*
*@param     
*/
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	@Override
	public Custom getCustomByuserId(String userId) {
		Custom custom=userMapper.getCustomByuserId(userId);
		//StringUtils.isEmpty(custom.getCustomId())
		
		
		return custom;
	}
	@Override
	public String findUser(User user) {
		User u =userMapper.findUserByName(user.getUserName());
		if(u!=null&&u.getUserPassword().equals(user.getUserPassword()))
			return u.getUserId()+"";
		return null;
	}
	

}
