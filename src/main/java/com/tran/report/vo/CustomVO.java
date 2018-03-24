package com.tran.report.vo;

import java.util.Date;

import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午2:35:32   
* Description:  
*
*@param     
*/
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
public class CustomVO{
	
	private String ID;
	private String customName;
	private String customPhone;
	private String customAddress;
	private String customStatus;
	private Date registerTime;
	private Date editTime;
	
	
}
