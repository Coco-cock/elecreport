package com.tran.report.controller;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tran.report.service.ExcelUtilService;
@Controller
public class ExcelController {
	
	@Autowired
	ExcelUtilService excelUtilService;
	@RequestMapping(value="getexceldata")
	@ResponseBody
	public Collection<Map> getExcelData() {
				
		return excelUtilService.importExecl("E:/demo.xls");
	}

}
