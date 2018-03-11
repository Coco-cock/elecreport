package com.tran.report.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tran.report.entity.Permission;
import com.tran.report.repository.PermissionRepository;
import com.tran.report.service.PermissionService;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年3月11日 下午8:30:54 Description:
 *
 * @param
 */
@Service
@Transactional
public class PermissionServiceImpl implements PermissionService {
	@Autowired
	PermissionRepository permissionRepository;

	@Override
	public List<Permission> getAllPermission() {
		return permissionRepository.findAll();
	}

	@Override
	public Permission getPermissionById(String permissionId) {
		return permissionRepository.findOne(permissionId);
	}

	@Override
	public boolean savePermission(Permission permission) {
		if (permissionRepository.saveAndFlush(permission) != null)
			return true;
		return false;
	}

	@Override
	public boolean editPermission(Permission permission) {
		if (permissionRepository.exists(String.valueOf(permission.getId()))) {
			permissionRepository.saveAndFlush(permission);
			return true;
		}
		return false;
	}

	@Override
	public boolean deletePermission(String permissionId) {
		permissionRepository.delete(permissionId);
		if (!permissionRepository.exists(permissionId))
			return true;
		return false;
	}

}
