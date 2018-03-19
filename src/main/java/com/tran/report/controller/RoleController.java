package com.tran.report.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.entity.Permission;
import com.tran.report.entity.Role;
import com.tran.report.service.PermissionService;
import com.tran.report.service.RoleService;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 下午11:02:02   
* Description:  
*
*@param     
*/
@Controller
public class RoleController {
	private static final Logger logger = Logger.getLogger(RoleController.class);
	@Autowired
	PermissionService permissionService;
	@Autowired
	RoleService roleService;
	@RequestMapping(value="getAllRole")
	public ModelAndView getAllRole(){
		List<Role> roleList=roleService.getAllRole();
		return new ModelAndView("role").addObject("roleList", roleList);
	}
	
	@RequestMapping(value="getAllPermission")
	public ModelAndView getAllPermission(){
		List<Permission> roleList=permissionService.getAllPermission();
		return new ModelAndView("permission").addObject("permissionList", roleList);
	}

}
