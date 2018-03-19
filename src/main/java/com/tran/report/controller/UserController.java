package com.tran.report.controller;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.tran.report.service.CustomService;
import com.tran.report.service.UserService;
import com.tran.report.util.FileToAliOssUtil;
import com.tran.report.vo.UserVO;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月17日 下午3:28:55 Description:
 *
 * @param
 */
@Controller
public class UserController {
	private static final Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	UserService userService;
	@Autowired
	CustomService customService;
	
	@PostMapping("/saveUser")
	public ModelAndView saveUser(@RequestPart(value = "imgFile") MultipartFile multipartFile,UserVO vo) {
		// 上传图片返回访问地址
		String imgPath = FileToAliOssUtil.fileToAliOSS(multipartFile);
		vo.setImgPath(imgPath);
		userService.saveUser(vo);
		return new ModelAndView("redirect:/getAllStudent");
	}
	
	@RequestMapping(value = "/deleteUser/{id}")
	public @ResponseBody boolean deleteUser(@PathVariable("id") String userId) {
		return userService.deleteUser(userId);
	}
	
	
		
}
