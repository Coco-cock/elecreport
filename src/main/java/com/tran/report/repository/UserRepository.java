package com.tran.report.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tran.report.entity.User;


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
public interface UserRepository extends JpaRepository<User, String>{
	/**
	 * 根据用户名查询User
	 * @param userName
	 * @return
	 */
	User findByUserName(String userName);
	/**
	 * 根据用户名密码匹配User
	 * @param userName
	 * @param password
	 * @return
	 */
	User findByUserNameAndPassword(String userName,String password);
	/**
	 * 
	 * 更具角色获取User
	 * @param roleId
	 * @return
	 */
	List<User> findByRole_idGreaterThan(Integer roleId);
	/**
	 * 修改密码
	 * @param ID
	 * @param password
	 * @return
	 */
	@Modifying
	@Query(value="update User u set u.password =:password where u.ID=:ID")			
	Integer editPassword(@Param("ID")String ID ,  @Param("password")String password);
	/**
	 * 修改头像地址
	 * @param ID
	 * @param imgPath
	 * @return
	 */
	@Modifying
	@Query(value="update User u set u.imgPath =:imgPath where u.ID=:ID")			
	Integer editImgPath(@Param("ID")String ID ,  @Param("imgPath")String imgPath);
}
