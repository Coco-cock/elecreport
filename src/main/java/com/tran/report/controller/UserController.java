package com.tran.report.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tran.report.model.Custom;
import com.tran.report.model.User;
import com.tran.report.service.UserService;
import com.tran.report.vo.SessionVo;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月17日 下午3:28:55   
* Description:  
*
*@param     
*/
@Controller
@SessionAttributes("sessionVo") 
public class UserController {
	@Autowired
	UserService userService;
	@RequestMapping(value ="login", method = RequestMethod.POST)
	public ModelAndView login(User user,ModelMap modelMap) {	
	ModelAndView mav =new ModelAndView("redirect:/index");
		String userId =userService.findUser(user);
		if(StringUtils.isNotEmpty(userId)){
			SessionVo sessionVo =new SessionVo();
			sessionVo.setUserName(user.getUserName());
			Custom custom=userService.getCustomByuserId(userId);
			System.out.println(custom);
			String customId=custom.getCustomId();
			if(StringUtils.isNotEmpty(customId)) {
				sessionVo.setCustomId(customId);
			}
			modelMap.addAttribute("sessionVo", sessionVo);
			mav.addObject("flag", "登陆成功！");
		}else {
			mav.setViewName("login");
			mav.addObject("flag", "登陆失败！");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
    public String loginOut( HttpSession session,ModelMap modelMap) {
      modelMap.remove("sessionVo");
      session.invalidate();	    
        return "login" ;

    }

}
