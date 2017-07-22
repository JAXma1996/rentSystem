package com.zhizu.model;


import java.util.ArrayList;
import java.util.Date;

import java.util.List;



/**
 * Trade entity. @author MyEclipse Persistence Tools
 */

public class Trade  implements java.io.Serializable {


    // Fields    

     /**
	 * 序列化值
	 */
	 private static final long serialVersionUID = -899356797834040487L;
	 private Integer tradeId;                       //商品ID
     private String tradeName;                      //商品名称
     private TradeType tradeType;                   //商品类别
     private User user;                             //商品所有人
     private Double price;                          //商品价格
     private String trDescript;                     //商品详情
     private int tradeNum;                          //商品数量
     private String photo;                          //商品图片
     private Date createDate;                       //商品上架时间
     private Double tradeDeposit;                   //商品押金
     private List<TradeRent> tradeRents = new ArrayList<TradeRent>(0);          //商品对应订单  一对多，此为一的一方
     private List<UserReport> userReports = new ArrayList<UserReport>(0);       //商品对应举报  一对多，此为一的一方
     private List<Comment> comments =new ArrayList<Comment>(0);                 //商品对应评价 一对多，此为一的一方


    // Constructors

    /** default constructor */
    public Trade() {
    }

    public Trade(int tradeId,String tradeName) {
		this.tradeId=tradeId;
    	this.tradeName=tradeName;
	}
    
    /** full constructor */
    public Trade(String tradeName, TradeType tradeType, User user, Double price, String trDescript, int tradeNum,
			String photo, Date createDate, Double tradeDeposit) {
		this.tradeName = tradeName;
		this.tradeType = tradeType;
		this.user = user;
		this.price = price;
		this.trDescript = trDescript;
		this.tradeNum = tradeNum;
		this.photo = photo;
		this.createDate = createDate;
		this.tradeDeposit = tradeDeposit;
	}

   
    // Property accessors

    
    @Override
	public String toString() {
		return "Trade [tradeId=" + tradeId + ", tradeName=" + tradeName + ", tradeType=" + tradeType + ", user=" + user
				+ ", price=" + price + ", trDescript=" + trDescript + ", tradeNum=" + tradeNum + ", photo=" + photo
				+ ", createDate=" + createDate + "]";
	}
    


	public Integer getTradeId() {
        return this.tradeId;
    }
    

	
	public void setTradeId(Integer tradeId) {
        this.tradeId = tradeId;
    }

    public TradeType getTradeType() {
        return this.tradeType;
    }
    
    public void setTradeType(TradeType tradeType) {
        this.tradeType = tradeType;
    }

    public String getTradeName() {
        return this.tradeName;
    }
    
    public void setTradeName(String tradeName) {
        this.tradeName = tradeName;
    }

    public Double getPrice() {
        return this.price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }

    public String getTrDescript() {
        return this.trDescript;
    }
    
    public void setTrDescript(String trDescript) {
        this.trDescript = trDescript;
    }

    public String getPhoto() {
        return this.photo;
    }
    
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


	


	public List<TradeRent> getTradeRents() {
		return tradeRents;
	}

	public void setTradeRents(List<TradeRent> tradeRents) {
		this.tradeRents = tradeRents;
	}

	public List<UserReport> getUserReports() {
		return userReports;
	}

	public void setUserReports(List<UserReport> userReports) {
		this.userReports = userReports;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public int getTradeNum() {
		return tradeNum;
	}


	public void setTradeNum(int tradeNum) {
		this.tradeNum = tradeNum;
	}

	public Double getTradeDeposit() {
		return tradeDeposit;
	}

	public void setTradeDeposit(Double tradeDeposit) {
		this.tradeDeposit = tradeDeposit;
	}

  
    






}