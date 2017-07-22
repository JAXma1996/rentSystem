package com.zhizu.model;

import java.util.Date;

/**
 * UserReport entity. @author MyEclipse Persistence Tools
 */

public class UserReport  implements java.io.Serializable {


    // Fields    

     /**
	 * 序列化值
	 */
	 private static final long serialVersionUID = -8209425752907203699L;
	 private Integer reportId;                    //用户举报信息ID
     private Trade trade;                         //举报对应商品
     private User user;                           //举报人
     private String rpDescript;                   //举报信息
     private Boolean rpType;                      //举报状态  0：未处理，1：已处理
     private Date reportDate;                     //举报时间

    // Constructors

    /** default constructor */
    public UserReport() {
    }

    
    /** full constructor */
    public UserReport(Trade trade, User user, String rpDescript, Boolean rpType, Date reportDate) {
		super();
		this.trade = trade;
		this.user = user;
		this.rpDescript = rpDescript;
		this.rpType = rpType;
		this.reportDate = reportDate;
	}

   
    // Property accessors

    public Integer getReportId() {
        return this.reportId;
    }
    
    


	public void setReportId(Integer reportId) {
        this.reportId = reportId;
    }

    public Trade getTrade() {
        return this.trade;
    }
    
    public void setTrade(Trade trade) {
        this.trade = trade;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public String getRpDescript() {
        return this.rpDescript;
    }
    
    public void setRpDescript(String rpDescript) {
        this.rpDescript = rpDescript;
    }

    public Boolean getRpType() {
        return this.rpType;
    }
    
    public void setRpType(Boolean rpType) {
        this.rpType = rpType;
    }


	public Date getReportDate() {
		return reportDate;
	}


	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
   








}