package com.tran.report.vo;

import javax.persistence.Column;

import com.tran.report.entity.Role;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月13日 下午10:47:30   
* Description:  
*
*@param     
*/
@AllArgsConstructor
@NoArgsConstructor
@Getter 
@Setter
public class UserVO {
	private String ID;
	private String userName;
    private String password;
    private String imgPath;
}
