package com.tran.report.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tran.report.entity.Role;
import com.tran.report.repository.RoleRepository;
import com.tran.report.service.RoleService;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 下午8:29:46   
* Description:  
*
*@param     
*/
@Service
@Transactional
public class RoleServiceImpl implements RoleService{
	@Autowired
	RoleRepository roleRepository;

	@Override
	public List<Role> getAllRole() {
	
		return roleRepository.findAll();
	}

	@Override
	public Role getRoleById(String roleId) {
		return roleRepository.findOne(roleId);
	}

	@Override
	public boolean saveRole(Role role) {
		if(roleRepository.saveAndFlush(role)!=null)
		return true;
		return false;
	}

	@Override
	public boolean editRole(Role role) {
		if(roleRepository.exists(String.valueOf(role.getId()))) {
			roleRepository.saveAndFlush(role);
			return true;		
		}
		return false;
	}

	@Override
	public boolean deleteRole(String roleId) {
		roleRepository.delete(roleId);
		if(!roleRepository.exists(String.valueOf(roleId)))
			return true;
		return false;
	}

}
