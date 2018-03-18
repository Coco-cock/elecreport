package com.tran.report.entity;

import java.io.Serializable;
import javax.persistence.Entity;
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
@Getter 
@Setter
@Entity
public class DayLoadBill extends BaseLoadBillEntity {
	private static final long serialVersionUID = 1L;

}
