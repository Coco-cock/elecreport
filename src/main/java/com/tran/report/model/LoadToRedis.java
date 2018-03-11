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
* Create at:   2018年3月11日 下午9:50:05   
* Description:  
*
*@param     
*/
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class LoadToRedis{
	private int nodeId;
	private String customId;
	private Load load;
	private String createTime;	
}
