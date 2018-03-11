package com.tran.report.vo;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 上午11:02:07   
* Description:  
*
*@param     
*/

import java.text.SimpleDateFormat;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.tran.report.entity.BaseLoadBillEntity;
import com.tran.report.entity.Custom;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class LoadBillVO extends BaseLoadBillEntity{
	private static final long serialVersionUID = 1L;
	private String ID;
	private String editTime;
	private String elecAmount;
	private Custom custom;

}
