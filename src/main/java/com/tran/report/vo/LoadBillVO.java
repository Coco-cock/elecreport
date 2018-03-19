package com.tran.report.vo;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 上午11:02:07   
* Description:  
*
*@param     
*/

import java.util.Date;

import com.tran.report.entity.Custom;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class LoadBillVO{
	private String ID;
	private String elecAmount;
	private Date editTime;
	private Custom custom;

}
