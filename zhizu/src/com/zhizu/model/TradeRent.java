package com.zhizu.model;


import java.util.Date;


/**
 * TradeRent entity. @author MyEclipse Persistence Tools
 */

public class TradeRent  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	 private static final long serialVersionUID = -981395268728425663L;
	 private Integer rentId;                  //租赁订单ID
     private Trade trade;                     //租赁订单商品
     private User rentUser;                   //租出人
     private User borderUser;                 //租入人
     private Integer rentNum;                 //租赁数量
     private Date rentSubmitDate;             //租赁订单提交时间，将订单提交给卖家为订单提交
     private Date rentEndDate;                //租赁订单完成时间，卖家确认/拒绝订单为订单完成，买家取消订单为订单完成
     private RentType rentType;               //租赁订单状态，1：提交未完成，2：提交并完成，3，租赁订单完成并且归还，4，租赁订单完成但未归还并且超期
     private Date returnLastDate;             //租赁订单最迟归还时间
     private Date returnRealDate;             //租赁订单用户归还时间
     private UserAddress userAddress;         //订单对应地址

    // Constructors

    /** default constructor */
    public TradeRent() {
    }

    
    /** full constructor */
    public TradeRent( Trade trade, User rentUser, User borderUser, Integer rentNum, Date rentSubmitDate,
			Date rentEndDate, RentType rentType, Date returnLastDate, Date returnRealDate,UserAddress userAddress) {
		this.trade = trade;
		this.rentUser = rentUser;
		this.borderUser = borderUser;
		this.rentNum = rentNum;
		this.rentSubmitDate = rentSubmitDate;
		this.rentEndDate = rentEndDate;
		this.rentType = rentType;
		this.returnLastDate = returnLastDate;
		this.returnRealDate = returnRealDate;
		this.userAddress = userAddress;
	}

   
    // Property accessors

    public Integer getRentId() {
        return this.rentId;
    }
    
    

	public void setRentId(Integer rentId) {
        this.rentId = rentId;
    }

    public Trade getTrade() {
        return this.trade;
    }
    
    public void setTrade(Trade trade) {
        this.trade = trade;
    }

    

    public User getRentUser() {
		return rentUser;
	}


	public void setRentUser(User rentUser) {
		this.rentUser = rentUser;
	}


	public User getBorderUser() {
		return borderUser;
	}


	public void setBorderUser(User borderUser) {
		this.borderUser = borderUser;
	}


	public RentType getRentType() {
		return rentType;
	}


	public void setRentType(RentType rentType) {
		this.rentType = rentType;
	}


	public Date getRentSubmitDate() {
        return this.rentSubmitDate;
    }
    
    public void setRentSubmitDate(Date rentSubmitDate) {
        this.rentSubmitDate = rentSubmitDate;
    }

    public Date getRentEndDate() {
        return this.rentEndDate;
    }
    
    public void setRentEndDate(Date rentEndDate) {
        this.rentEndDate = rentEndDate;
    }

    public Date getReturnLastDate() {
        return this.returnLastDate;
    }
    
    public void setReturnLastDate(Date returnLastDate) {
        this.returnLastDate = returnLastDate;
    }

    public Date getReturnRealDate() {
        return this.returnRealDate;
    }
    
    public void setReturnRealDate(Date returnRealDate) {
        this.returnRealDate = returnRealDate;
    }

    public Integer getRentNum() {
        return this.rentNum;
    }
    
    public void setRentNum(Integer rentNum) {
        this.rentNum = rentNum;
    }


	public UserAddress getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}


	


	

}