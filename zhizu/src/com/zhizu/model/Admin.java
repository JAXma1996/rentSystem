package com.zhizu.model;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */


public class Admin  implements java.io.Serializable {


    // Fields    

     /**
	 * 序列化值
	 */
	 private static final long serialVersionUID = 6621556497517148945L;
	 private Integer adminId;          //管理员ID
     private String adminName;         //管理员名称
     private String password;          //管理员密码


    // Constructors

    /** default constructor */
    public Admin() {
    }

    
    /** full constructor */
    public Admin(String adminName, String password) {
        this.adminName = adminName;
        this.password = password;
    }

   
    // Property accessors

    public Integer getAdminId() {
        return this.adminId;
    }
    
    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return this.adminName;
    }
    
    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
   
}