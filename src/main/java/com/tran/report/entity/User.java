package com.tran.report.entity;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月12日 下午2:55:27   
* Description:  
*
*@param     
*/
@ToString
@NoArgsConstructor
@Getter 
@Setter
@Entity
public class User extends BaseEntity{
	private static final long serialVersionUID = 1L;
	@Column(unique=true,nullable = false, length = 25)
	private String userName;
	@Column(nullable = false, length = 30)
    private String password;
    private String imgPath;
  	@OneToOne(cascade =CascadeType.REFRESH,fetch=FetchType.EAGER)
  	private Custom custom;
	@ManyToOne(cascade =CascadeType.REFRESH,fetch=FetchType.EAGER)
	@JoinColumn(nullable=false)
	private Role role;
	

}
