package com.tran.report.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月15日 下午2:43:11   
* Description:  
*
*@param     
*/
@NoArgsConstructor
@Getter 
@Setter
@Entity
public class LoadData extends BaseEntity{
	private static final long serialVersionUID = 1L;
	@Column(nullable = false, length = 25)
	private String voltage;
	
	@Column(nullable = false, length = 25)
	private String current;
	/**
	 * 注意：power是MySQL的一个人函数, load也是MySQL的关键字。
	 * 功率：powerValue
	 */
	@Column(nullable = false, length = 25)
	private String powerValue;
	
	@ManyToOne(cascade =CascadeType.REFRESH)
	@JoinColumn(nullable=false)
	private Custom custom;
	
	
}
