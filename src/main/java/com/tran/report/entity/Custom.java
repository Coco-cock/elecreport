package com.tran.report.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
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
public class Custom extends BaseEntity {
	private static final long serialVersionUID = 1L;
	/**
	 * 客户名
	 */
	@Column(nullable = false, length = 25)
	private String customName;
	/**
	 * 联系电话
	 */
	@Column(length = 25)
	private String customIphone;
	/**
	 * 地址
	 */
	@Column(length = 25)
	private String customAddress;
	@Column(nullable = false, length = 25)
	/**
	 * 状态   可以/不可用
	 */
	private boolean customStatus;
	@Column(nullable = false, length = 25)
	/**
	 * 注册时间
	 */
	private Date registerTime;

	/**
	 * 一个客户对应一个user
	 * 一对一 单向 关联
	 * 共享user的主键
	 */
	// @JoinColumn(name="userId")
	@OneToOne(cascade = CascadeType.ALL)
    @PrimaryKeyJoinColumn(referencedColumnName="ID")
	private User user;
	/**
	 * 一对多 一个客户对应多张负荷单
	 */
	@OneToMany(targetEntity = DayLoadBill.class, mappedBy = "custom", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<DayLoadBill> dayLoadBill=new HashSet<>();
	
	@OneToMany(targetEntity = DayLoadBill.class, mappedBy = "custom", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<DayLoadBill> mothLoadBill=new HashSet<>();
	
	@OneToMany(targetEntity = YearLoadBill.class, mappedBy = "custom", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<YearLoadBill> yearLoadBill=new HashSet<>();
	
	@OneToMany(targetEntity = LoadData.class, mappedBy = "custom", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<LoadData> loadData=new HashSet<>();
	
}
