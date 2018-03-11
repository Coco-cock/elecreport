package com.tran.report.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 上午2:47:35   
* Description:  
*
*@param     
*/
@NoArgsConstructor
@Getter 
@Setter
@Entity
public class Permission implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Integer id;
	/**
	 * 权限名
	 */
	@Column(unique = true, nullable = false,length=25)
	private String permissionName;
	/**
	 * 描述
	 */
    @Column(length=25)
	private String description;
    
    @ManyToOne(cascade =CascadeType.REFRESH)
    @JoinColumn(nullable=false)
   	private Role role;

}
