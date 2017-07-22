package com.zhizu.model;

import java.util.Date;


/**
 * BlackList entity. @author MyEclipse Persistence Tools
 */

public class BlackList  implements java.io.Serializable {


    // Fields    

     /**
	 * 序列化值
	 */
	 private static final long serialVersionUID = 4404416973113744465L;
	 private Integer listId;               //拉黑表ID
     private User user;                    //拉黑对应用户ID
     private Date blackDate;               //拉黑时间
     private String blDescript;            //拉黑备注


    // Constructors

    /** default constructor */
    public BlackList() {
    }

    
    /** full constructor */
    public BlackList(User user, Date blackDate, String blDescript) {
        this.user = user;
        this.blackDate = blackDate;
        this.blDescript = blDescript;
    }

   
    // Property accessors

    public Integer getListId() {
        return this.listId;
    }
    
    public void setListId(Integer listId) {
        this.listId = listId;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public Date getBlackDate() {
        return this.blackDate;
    }
    
    public void setBlackDate(Date blackDate) {
        this.blackDate = blackDate;
    }

    public String getBlDescript() {
        return this.blDescript;
    }
    
    public void setBlDescript(String blDescript) {
        this.blDescript = blDescript;
    }
   


    





}