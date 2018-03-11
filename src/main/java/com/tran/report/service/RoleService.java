package com.tran.report.service;

import java.util.List;

import com.tran.report.entity.Role;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 下午8:24:59   
* Description:  
*
*@param     
*/

public interface RoleService {
	List<Role> getAllRole();
	Role getRoleById(String roleId);
	boolean saveRole(Role role);
	boolean editRole(Role role);
	boolean deleteRole(String roleId);
	

}
