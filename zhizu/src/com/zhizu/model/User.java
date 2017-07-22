package com.zhizu.model;

import java.util.ArrayList;
import java.util.Date;

import java.util.List;




/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {


    // Fields    

     /**
	 * 序列化值
	 */
	 private static final long serialVersionUID = -4111152886748923337L;
	 
	 
	 private Integer userId;                      //用户ID
     private String userName;                     //用户真实姓名
     private String nickName;                     //用户登陆昵称
     private String password;                     //用户密码
     private String sex;                          //用户性别
     private Integer age;                         //用户年龄
     private Date createDate;                     //用户注册时间
     private Date birthday;                       //用户生日
     private String idCard;                       //用户身份证
     private String iphone;                       //用户联系方式
     private String address;                      //用户地址
     private String photo;                        //用户图像
     private List<UserReport> userReports =  new ArrayList<UserReport>();       //用户举报信息 一对多，此为一的一方
     private List<Comment> comment = new ArrayList<Comment>();                  //用户评论信息 一对多，此为一的一方
     private List<TradeRent> tradeRents = new ArrayList<TradeRent>();           //用户租赁信息 一对多，此为一的一方
     private List<UserAddress> userAddresses = new ArrayList<UserAddress>();    //用户地址信息 一对多，此未一的一方
     
    // Constructors
     public User() {
		
	}
     
    /** 
     * 测试用例构造方法
     * @param nickName
     * @param userName
     * @param password 
     * @param userId
     */
    public User(int userId, String userName, String nickName, String password) {
    	this.userId=userId;
    	this.userName = userName;
    	this.nickName = nickName;
    	this.password = password;
    }
    
    /**
     * 用户注册时所需构造函数
     * @param userName
     * @param nickName
     * @param password
     */
    public User(String userName, String nickName, String password) {
		// TODO Auto-generated constructor stub
    	this.userName = userName;
		this.nickName = nickName;
		this.password = password;
	}
    
    /**
     * 测试用例构造方法
     * @param userId
     * @param userName
     */
    public User(int userId,String userName){
    	this.userId=userId;
    	this.userName=userName;
    }
    
    
    
    
    
    /** full constructor */
    public User(String userName, String nickName, String password, String sex, Integer age, Date createDate,
			Date birthday, String idCard, String iphone, String address, String photo) {
		this.userName = userName;
		this.nickName = nickName;
		this.password = password;
		this.sex = sex;
		this.age = age;
		this.createDate = createDate;
		this.birthday = birthday;
		this.idCard = idCard;
		this.iphone = iphone;
		this.address = address;
		this.photo = photo;
	}

   
    // Property accessors
    

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", nickName=" + nickName + ", password=" + password
				+ ", sex=" + sex + ", age=" + age + ", createDate=" + createDate + ", birthday=" + birthday
				+ ", idCard=" + idCard + ", iphone=" + iphone + ", address=" + address + ", photo=" + photo + "]";
	}

	public Integer getUserId() {
        return this.userId;
    }
    
    


	public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNickName() {
        return this.nickName;
    }
    
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return this.age;
    }
    
    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getBirthday() {
        return this.birthday;
    }
    
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getIdCard() {
        return this.idCard;
    }
    
    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getIphone() {
        return this.iphone;
    }
    
    public void setIphone(String iphone) {
        this.iphone = iphone;
    }

    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return this.photo;
    }
    
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    
	
	public List<UserReport> getUserReports() {
		return userReports;
	}

	public void setUserReports(List<UserReport> userReports) {
		this.userReports = userReports;
	}

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

	public List<TradeRent> getTradeRents() {
		return tradeRents;
	}

	public void setTradeRents(List<TradeRent> tradeRents) {
		this.tradeRents = tradeRents;
	}

	public List<UserAddress> getUserAddresses() {
		return userAddresses;
	}

	public void setUserAddresses(List<UserAddress> userAddresses) {
		this.userAddresses = userAddresses;
	}
    
    
}