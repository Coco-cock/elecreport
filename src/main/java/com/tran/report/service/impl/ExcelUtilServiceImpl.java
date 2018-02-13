package com.tran.report.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

import com.tran.report.excelUutil.ExcelLogs;
import com.tran.report.excelUutil.ExcelUtil;
import com.tran.report.service.ExcelUtilService;
@Service
public class ExcelUtilServiceImpl implements ExcelUtilService{

	@Override
	public Collection<Map> importExecl(String inpath)  {
				
		File file=new File(inpath);
	    InputStream inputStream = null;
	    Collection<Map> ie = null;
		try {
			
			inputStream = new FileInputStream(file);
			ExcelLogs logs =new ExcelLogs();
			 ie = ExcelUtil.importExcel(Map.class, inputStream, "yyyy/MM/dd HH:mm:ss", logs , 0);
			
			
		} catch (FileNotFoundException e) {
			System.out.println("excel文件路径错误！");
			e.printStackTrace();
		}finally {
			try {
				inputStream.close();
			} catch (IOException e) {
			
				e.printStackTrace();
			}
		}
		
		return ie;
			
	}

	@Override
	public void exportExecl(Map<String, String> map, Collection<Object> data,String outPath) {
		File f=new File(outPath);
        OutputStream out = null;
		try {
			out = new FileOutputStream(f);
			ExcelUtil.exportExcel(map, data, out);
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		}
        
        try {
			out.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		
	}

	@Override
	public void exportExecl(Map<String, String> map, List<Map<String, Object>> list,String outPath) {
		 File f= new File(outPath);
		    OutputStream out = null;
			try {
				out = new FileOutputStream(f);
				ExcelUtil.exportExcel(map,list, out );
			} catch (FileNotFoundException e) {
				
				e.printStackTrace();
			}finally {
				
				try {
					out.close();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
		
	}

}
