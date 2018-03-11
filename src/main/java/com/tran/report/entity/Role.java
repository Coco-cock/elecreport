package com.tran.report.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 上午2:10:34   
* Description:  
*
*@param     
*/
@NoArgsConstructor
@Getter 
@Setter
@Entity
public class Role implements Serializable{
	private static final long serialVersionUID = 1L;
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Integer id;
	/**
	 * 角色标识
	 */
    @Column(unique = true, nullable = false,length=10)
	private String role; 
	/**
	 * 描述
	 */
    @Column(length=25)
	private String description; 
	/**
	 * 是否可用
	 */
    @Column( nullable = false)
	private boolean available = true;
    /**
     * 一个角色对应多个权限
     */
    @OneToMany(targetEntity = Permission.class,mappedBy="role",fetch = FetchType.LAZY ,cascade = {CascadeType.PERSIST,CascadeType.REFRESH})
    private Set<Permission> permission =new HashSet<>();
    /**
     * 一个角色对应多个用户
     */
    @OneToMany(targetEntity = User.class, mappedBy = "role", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Role> user = new HashSet<>();
}
