package com.tran.report.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tran.report.entity.User;
import com.tran.report.repository.UserRepository;
import com.tran.report.service.CustomService;
import com.tran.report.service.UserService;
import com.tran.report.vo.CustomVO;
import com.tran.report.vo.UserAndCustomVO;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月17日 下午3:51:37 Description:
 *
 * @param
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	UserRepository userRepository;
	@Autowired
	CustomService customService;

	@Override
	public boolean findUser(User user) {
		User u = userRepository.findByUserName(user.getUserName());
		if (u != null && u.getPassword().equals(user.getPassword()))
			return true;
		return false;
	}

	@Override
	public UserAndCustomVO getUser(String userName, String password) {
		UserAndCustomVO vo = new UserAndCustomVO();
		User user = userRepository.findByUserNameAndPassword(userName, password);
		String userId = user.getID();
		if (StringUtils.isEmpty(userId))
			return null;
		vo.setUser(user);
		CustomVO customVO = customService.getCustomVoById(userId);
		if (customVO != null)
			vo.setCustomVO(customVO);
		return vo;
	}

	@Override
	public boolean saveUser(User user) {
		if (userRepository.saveAndFlush(user) != null) {
			return true;
		}
		return false;
	}

	@Override
	public boolean editUser(User user) {
		if (userRepository.exists(user.getID())) {
			userRepository.saveAndFlush(user);
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteUser(String userId) {
		userRepository.delete(userId);
		if (!userRepository.exists(userId)) {
			return true;
		}
		return false;
	}

	@Override
	public List<UserAndCustomVO> getAllUserAndCustom() {
		return null;
	}

}
