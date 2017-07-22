package com.zhizu.mapper;

import java.util.List;

import com.zhizu.model.UserAddress;

public interface UserAddressMapper {
	
	//查找所有地址
	public List<UserAddress> findAll();
	//根据地址ID查找地址
	public UserAddress findById(int id);
	//根据用户ID查找地址
	public List<UserAddress> findByUserId(int userId);
	//插入用户地址
	public void save(UserAddress userAddress);
	//根据地址ID删除地址
	public void delete(int id);
	//更新地址
	public void update(UserAddress userAddress);
	//设置默认地址
	public void updateDefaultAddress(int addressId);
	//设置默认地址之前先将所有地址置为非默认
	public void defaultAddress(int userId);
	//根据userId找地址条数
	public int findCoutByUserId(int userId);
	
}
