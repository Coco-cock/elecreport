package com.tran.report.test;

import com.tran.report.service.CustomBillService;
import com.tran.report.service.impl.CustomBillServiceImpl;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午5:06:45   
* Description:  
*
*@param     
*/

public class Test {

	void testone(){
		CustomBillService customBillService=new CustomBillServiceImpl();
		System.out.println(customBillService.getDayBill());
		
	}

}
