package com.tran.report.controller;


import java.util.List;

import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.tran.report.entity.Custom;
import com.tran.report.service.UserAndCustomService;
import com.tran.report.util.FileToAliOssUtil;
import com.tran.report.vo.CustomVO;
import com.tran.report.vo.SessionVO;
import com.tran.report.vo.UserAndCustomVO;
import com.tran.report.vo.UserVO;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月17日 下午3:28:55 Description:
 *
 * @param
 */
@Controller
public class UserAndCustomController {
	private static final Logger logger = Logger.getLogger(UserAndCustomController.class);
	@Autowired
	UserAndCustomService uacService;
	
	@RequestMapping("/saveUserAndCustom")
	public ModelAndView saveUserAndCustom(@RequestPart(value = "imgFile") MultipartFile multipartFile,UserVO vo) {
		// 上传图片,返回访问地址
		String imgPath = FileToAliOssUtil.fileToAliOSS(multipartFile);
		vo.setImgPath(imgPath);
		vo.setRoleId(3);//设为默认值,3:客户角色Id	
		uacService.saveUserAndCustom(vo);
		return new ModelAndView("redirect:/getAllCustom");
	}
	
	@RequestMapping(value = "/deleteUser/{id}")
	public @ResponseBody boolean deleteUser(@PathVariable("id") String userId) {
		return uacService.deleteUser(userId);
	}
	
	@RequestMapping(value = "getAllCustom")
	public ModelAndView getAllCustom() {
		ModelAndView mav = new ModelAndView("customInfo");
		List<CustomVO> customList = uacService.getCustomInfo();
		mav.addObject("customList", customList);
		return mav;
	}
	
	@RequestMapping(value = "saveCustom")
	public @ResponseBody boolean saveCustom(CustomVO vo) {
		    Custom custom =new Custom();
		      if( uacService.saveCustom(custom)){
		    	  return true;
		      }
		return false;
	}


	@RequestMapping(value = "goEditCustomForm/{customId}")
	public ModelAndView goEditCustomForm(@PathVariable("customId")String customId) {
		UserAndCustomVO uacVO=uacService.getUserAndCustomById(customId);
		return new ModelAndView("editCustomForm").addObject("userAndCustomVO", uacVO);
	}
	@RequestMapping("editUserAndCustom")
	public ModelAndView editUserAndCustom(UserVO vo) {
		logger.info(vo);
		uacService.editUserAndCustom(vo);
		return new ModelAndView("redirect:/getUserByRoleId");
	}
	
	/**
	 * 根据用户拥有的角色,查询用户信息,返回权限较低的用户信息
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "getUserByRoleId")
	public ModelAndView  getUserByRoleId(HttpSession session) {
		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		Integer roleId = null;
		if (sessionVO != null) {
			roleId = sessionVO.getUserAndCustomVO().getUser().getRole().getId();
			logger.info("getDynamicData-->roleId"+roleId);
		}
		List<UserAndCustomVO> userAndCustomList =uacService.getAllUserAndCustomByRoleId(roleId);
		logger.info(userAndCustomList);
		return new ModelAndView("customList").addObject("userAndCustomList", userAndCustomList);
	}
		
}
