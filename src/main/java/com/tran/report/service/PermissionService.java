package com.tran.report.service;

import java.util.List;

import com.tran.report.entity.Permission;
import com.tran.report.entity.Role;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 下午8:25:34   
* Description:  
*
*@param     
*/

public interface PermissionService {
	List<Permission> getAllPermission();
	Permission getPermissionById(String permissionId);
	boolean savePermission(Permission permission);
	boolean editPermission(Permission permission);
	boolean deletePermission(String permissionId);
	

}
