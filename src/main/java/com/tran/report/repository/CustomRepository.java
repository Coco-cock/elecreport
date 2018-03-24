package com.tran.report.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tran.report.entity.Custom;

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
public interface CustomRepository extends JpaRepository<Custom, String>{
	@Modifying
	@Query(value="update Custom  set customName =:customName , customAddress=:customAddress ,custom=:customPhone,editTime=:editTime where ID=:ID")			
	void editCustom(@Param("customName")String customName,@Param("customAddress")String customAddress,@Param("customPhone")String customPhone,@Param("editTime")Date editTime,@Param("ID")String ID);

}
