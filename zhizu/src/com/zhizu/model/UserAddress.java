package com.zhizu.model;

public class UserAddress {
	private int addressId;                   //地址编号
	private User user;                       //地址对应用户
	private String addressInfo;              //地址详情
	private Boolean addressType;             //地址类型
	private String userName;                 //收货人
	private String userPhone;                //手机号码
	
	public UserAddress(){ 
		
	}
	
	
	public UserAddress(User user, String addressInfo, Boolean addressType, String userName, String userPhone) {
		this.user = user;
		this.addressInfo = addressInfo;
		this.addressType = addressType;
		this.userName = userName;
		this.userPhone = userPhone;
	}
	
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public String getAddressInfo() {
		return addressInfo;
	}
	public void setAddressInfo(String addressInfo) {
		this.addressInfo = addressInfo;
	}
	
	public Boolean getAddressType() {
		return addressType;
	}
	public void setAddressType(Boolean addressType) {
		this.addressType = addressType;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	
	
}
