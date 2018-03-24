package com.tran.report.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午3:00:20   
* Description:  
*
*@param     
*/
@ToString
@NoArgsConstructor
@Setter
@Getter
@MappedSuperclass
public abstract class BaseLoadBillEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 用电量 KW·H
	 */
	@Column(nullable=false)
	private String elecAmount;
	
	@ManyToOne(cascade =CascadeType.REFRESH)
	@JoinColumn(nullable=false)
	private Custom custom;
}
