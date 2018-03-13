package com.tran.report.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.tran.report.service.CustomService;
import com.tran.report.service.UserService;
import com.tran.report.util.FileToAliOssUtil;
import com.tran.report.vo.SessionVO;
import com.tran.report.vo.UserAndCustomVO;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月17日 下午3:28:55 Description:
 *
 * @param
 */
@Controller
@SessionAttributes("sessionVO")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	CustomService customService;
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("userName") String userName,
			@RequestParam("password") String password, ModelMap modelMap) {
		String flag = "登陆失败！";
		String url="redirect:/login";
		if (StringUtils.isNotBlank(userName) && StringUtils.isNotBlank(password)) {
			UserAndCustomVO userVO = userService.getUser(userName, password);		
			if (userVO.getUser()!=null) {
				SessionVO sessionVO = new SessionVO();
				sessionVO.setUserAndCustomVO(userVO);
				modelMap.addAttribute("sessionVO", sessionVO);
				flag = "登陆成功！";
				url="redirect:/index";
			} 
		}
		return new ModelAndView(url).addObject("flag", flag);
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String loginOut(HttpSession session, ModelMap modelMap) {
		modelMap.remove("sessionVo");
		session.invalidate();
		return "login";
	}
	@RequestMapping(value = "goProfile", method = RequestMethod.GET)
	public ModelAndView goProfile() {
	
		return new ModelAndView("profile");
		
	}
	
	@PostMapping("/saveUser")
	public ModelAndView save(@RequestPart(value = "file") MultipartFile multipartFile) {
		// 上传图片返回访问地址
		String imgPath = FileToAliOssUtil.fileToAliOSS(multipartFile);
		
	
		
		return new ModelAndView("redirect:/getAllStudent");
	}
	
	@RequestMapping(value = "goAbout", method = RequestMethod.GET)
	public ModelAndView goAbout() {
	
		return new ModelAndView("about");
		
	}
		
}
