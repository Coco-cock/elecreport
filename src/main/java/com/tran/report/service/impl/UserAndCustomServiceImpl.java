package com.tran.report.service.impl;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.tran.report.entity.Custom;
import com.tran.report.entity.User;
import com.tran.report.repository.CustomRepository;
import com.tran.report.repository.RoleRepository;
import com.tran.report.repository.UserRepository;
import com.tran.report.service.UserAndCustomService;
import com.tran.report.util.Status;
import com.tran.report.vo.CustomVO;
import com.tran.report.vo.UserAndCustomVO;
import com.tran.report.vo.UserVO;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月17日 下午3:51:37 Description:
 *
 * @param
 */
@Service
@Transactional
public class UserAndCustomServiceImpl implements UserAndCustomService {

	@Autowired
	UserRepository userRepository;
	@Autowired
	CustomRepository customRepository;
	@Autowired
	RoleRepository roleRepository;

	@Override
	public boolean findUser(User user) {
		User u = userRepository.findByUserName(user.getUserName());
		if (u != null && u.getPassword().equals(user.getPassword()))
			return true;
		return false;
	}

	@Override
	public UserAndCustomVO getUser(String userName, String password) {
		userName = userName.trim();
		password = password.trim();
		UserAndCustomVO vo = new UserAndCustomVO();
		User user = userRepository.findByUserName(userName);
		if (user == null || !user.getPassword().equals(password)) {
			return null;
		}
		vo.setUser(user);
		CustomVO customVO = this.getCustomVoById(user.getID());
		if (customVO != null) {
			vo.setCustomVO(customVO);
		}
		return vo;
	}

	@Override
	public boolean saveUser(UserVO userVO) {
		User user = new User();
		BeanUtils.copyProperties(userVO, user);

		user.setRole(roleRepository.findOne(userVO.getRoleId()));
		user.setEditTime(new Date());
		if (userRepository.save(user) != null) {
			return true;
		}
		return false;
	}

	@Override
	public boolean editUser(User user) {
		if (userRepository.exists(user.getID())) {
			userRepository.save(user);
			return true;
		}
		return false;
	}

	@Transactional
	@Override
	public boolean deleteUser(String userId) {
		userRepository.delete(userId);
		if (!userRepository.exists(userId)) {
			return true;
		}
		return false;
	}

	@Override
	public List<UserAndCustomVO> getAllUserAndCustomByRoleId(Integer roleId) {
		List<User> userList = userRepository.findByRole_idGreaterThan(roleId);
		List<UserAndCustomVO> list =new LinkedList<>();
		for (User user : userList) {
			UserAndCustomVO uac =new UserAndCustomVO();
			uac.setUser(user);
			if (StringUtils.isNotBlank(user.getID())) {
				CustomVO customVO = this.getCustomVoById(user.getID());
				uac.setCustomVO(customVO);
			}
			list.add(uac);
		}
		return list;
	}

	@Override
	public boolean saveUserAndCustom(UserVO userVO) {
		User user = new User();
		BeanUtils.copyProperties(userVO, user);
		user.setRole(roleRepository.findOne(userVO.getRoleId()));
		User u = userRepository.save(user);
		Custom custom = new Custom();
		BeanUtils.copyProperties(userVO, custom);
		custom.setEditTime(new Date(System.currentTimeMillis()));
		custom.setRegisterTime(new Date(System.currentTimeMillis()));
		custom.setUser(u);
		this.saveCustom(custom);
		return false;
	}

	@Override
	public List<User> getUserByRoleId(Integer roleId) {
		List<User> userList = userRepository.findByRole_idGreaterThan(roleId);
		for (User user : userList) {
			if (StringUtils.isNotBlank(user.getID())) {
				user.setCustom(customRepository.findOne(user.getID()));
			}
		}
		return userList;
	}
//-------------------------Custom part----------------------------------------------------

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
	public boolean saveCustom(Custom custom) {
		if(customRepository.save(custom)!=null)
			return true;
		return false;
	}

	@Override
	public boolean editCustom(Custom custom) {
		if(customRepository.findOne(custom.getID())!=null) {
			customRepository.save(custom);
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
