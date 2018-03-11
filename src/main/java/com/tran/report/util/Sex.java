package com.tran.report.util;
/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年2月25日 上午12:08:25   
* Description:  
*
*@param     
*/

public enum Sex {
	MALE("男",0),FENMALE("女",1); 
	private String name;  
    private Integer index;  
    // 构造方法  
    private Sex(String name, Integer index) {  
        this.name = name;  
        this.index = index;  
    }  
    // 普通方法  
    public static String getName(Integer index) {  
        for (Sex s : Sex.values()) {  
            if (s.getIndex() == index) {  
                return s.name;  
            }  
        }  
        return null;  
    }
    public static Integer getIndex(String name) {  
        for (Sex s : Sex.values()) {  
            if (s.getName() == name) {  
                return s.index;  
            }  
        }  
        return 1;  
    }
    // get set 方法  
    public String getName() {  
        return name;  
    }  
    public void setName(String name) {  
        this.name = name;  
    }  
    public Integer getIndex() {  
        return index;  
    }  
    public void setIndex(Integer index) {  
        this.index = index;  
    } 
   

}
