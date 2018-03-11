package com.tran.report.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月15日 下午2:43:11   
* Description:  
*
*@param     
*/
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Load {
	private double voltage;
	private double current;
	private double power;
}
