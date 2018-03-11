package com.tran.report.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.service.CustomService;
import com.tran.report.service.UserService;
import com.tran.report.vo.CustomVO;
import com.tran.report.vo.SessionVo;
import com.tran.report.vo.UserAndCustomVO;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月17日 下午3:28:55 Description:
 *
 * @param
 */
@Controller
@SessionAttributes("sessionVo")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	CustomService customService;
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("userName") String userName,
			@RequestParam("userPassword") String password, ModelMap modelMap) {
		String flag = "登陆失败！";
		String url="redirect:/login";
		if (StringUtils.isNotBlank(userName) && StringUtils.isNotBlank(password)) {
			UserAndCustomVO userVO = userService.getUser(userName, password);		
			if (userVO.getUser()!=null) {
				/*CustomVO customVO=customService.getCustomInfoById(userVO.getUser().getID());
				System.out.println(customVO+"#############################################");
				if(customVO!=null) {
					userVO.setCustomVO(customVO);	
				}*/
				SessionVo sessionVo = new SessionVo();
				sessionVo.setUserVO(userVO);
				modelMap.addAttribute("sessionVo", sessionVo);
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
	@RequestMapping(value = "getuserinfo", method = RequestMethod.GET)
	public ModelAndView getUserInfo(HttpSession session) {
		SessionVo sessionVo =(SessionVo) session.getAttribute("sessionVo");
		return new ModelAndView("profile").addObject("user");
		
	}
		
}
