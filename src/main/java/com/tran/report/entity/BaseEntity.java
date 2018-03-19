package com.tran.report.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年3月11日 上午12:34:14 
 * Description:全局Id
 *
 * @param
 */
@ToString
@NoArgsConstructor
@Setter
@Getter
@MappedSuperclass
public abstract class BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(generator = "IDGenerator")
	@GenericGenerator(name = "IDGenerator", strategy = "uuid")
	@Column(name = "ID", nullable = false, length = 64)
	protected String ID;
	/**
	 * 时间戳
	 */
	@Column(nullable=false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	protected Date editTime=new Date(System.currentTimeMillis());
}
