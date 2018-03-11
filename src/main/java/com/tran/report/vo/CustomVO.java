package com.tran.report.vo;

import javax.persistence.Entity;

import com.tran.report.util.Status;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午2:35:32   
* Description:  
*
*@param     
*/
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
public class CustomVO{
	
	private String ID;
	private String customName;
	private String customIphone;
	private String customAddress;
	private String customStatus;
	private String registerTime;
	private String editTime;
	
	
}
