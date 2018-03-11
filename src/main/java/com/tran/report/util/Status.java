package com.tran.report.util;

/**   
* @version 1.0   
* @author TianMengJun
* @since JDK 1.8.0_20
* Create at:   2018年3月11日 下午3:12:10   
* Description:  
*
*@param     
*/

public enum Status {
	ENMAL("正常",true),DISABLE("禁用",false);
	private String name;
	private boolean index;
	
	// 构造方法  
    private Status(String name, boolean index) {  
        this.name = name;  
        this.index = index;  
    }  
    // 普通方法  
    public static String getName(boolean index) {  
        for (Status s : Status.values()) {  
            if (s.index == index) {  
                return s.name;  
            }  
        }  
        return null;  
    }
    public static boolean getIndex(String name) {  
        for (Status s : Status.values()) {  
            if (s.name == name) {  
                return s.index;  
            }  
        }  
        return false;  
    }
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isIndex() {
		return index;
	}
	public void setIndex(boolean index) {
		this.index = index;
	}
		   
    
}
