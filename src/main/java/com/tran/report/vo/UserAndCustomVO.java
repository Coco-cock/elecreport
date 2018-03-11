package com.tran.report.vo;

import com.tran.report.entity.Custom;
import com.tran.report.entity.User;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 下午4:08:32   
* Description:  
*
*@param     
*/
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserAndCustomVO {
	private User user;
	private CustomVO customVO;

}
