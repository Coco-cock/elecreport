package com.tran.report.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.tran.report.service.UserService;
import com.tran.report.vo.SessionVO;
import com.tran.report.vo.UserAndCustomVO;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月13日 下午11:02:07   
* Description:  
*
*@param     
*/
@Controller
@SessionAttributes("sessionVO")
public class MainController {
	private static final Logger logger = Logger.getLogger(MainController.class);
	@Autowired
	UserService userService;
	
	@RequestMapping(value="index")
	public String index() {		
		return "dynamicdata";	
	}
	
	/**
	 * 登陆验证
	 * @param userName
	 * @param password
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "loginVerify")
	public ModelAndView login(@RequestParam("userName") String userName,
			@RequestParam("password") String password, ModelMap modelMap) {
		String flag = "登陆失败！";
		String url="login";
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
		logger.info("用户登陆："+flag);
		return new ModelAndView(url).addObject("flag", flag);
	}
	
	/**
	 * 退出登陆，清空session
	 * @param session
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logOut(HttpSession session, ModelMap modelMap) {
		modelMap.remove("sessionVO");
		session.invalidate();
		logger.info("退出登陆，清空session");
		return "login";
	}
	
	/**
	 * 用户个人信息页面
	 * @return
	 */
	@RequestMapping(value = "goProfile", method = RequestMethod.GET)
	public ModelAndView goProfile() {
	
		return new ModelAndView("profile");
		
	}
	
	/**
	 * 关于页面
	 * @return
	 */
	@RequestMapping(value = "goAbout", method = RequestMethod.GET)
	public ModelAndView goAbout() {
	
		return new ModelAndView("about");
		
	}

}
