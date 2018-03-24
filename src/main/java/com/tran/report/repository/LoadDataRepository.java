package com.tran.report.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.tran.report.entity.LoadData;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月22日 下午10:25:51   
* Description:  
*
*@param     
*/

@Repository
public interface LoadDataRepository extends JpaRepository<LoadData, String>{
	List<LoadData>  findAllByCustom_ID(String customId);
}
