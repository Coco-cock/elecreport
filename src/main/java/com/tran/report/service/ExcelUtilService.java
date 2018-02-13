package com.tran.report.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

public interface ExcelUtilService {
	//导入excel文件，返回collection.
	Collection<Map> importExecl(String path);
	//
	void exportExecl( Map<String,String> map, Collection<Object> data,String outPath);
	void exportExecl( Map<String,String> map,  List<Map<String,Object>> list,String outPath);

}
