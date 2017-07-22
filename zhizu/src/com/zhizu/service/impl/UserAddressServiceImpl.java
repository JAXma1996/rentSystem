package com.zhizu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhizu.mapper.UserAddressMapper;
import com.zhizu.model.UserAddress;
import com.zhizu.service.UserAddressService;


@Service
@Transactional
public class UserAddressServiceImpl implements UserAddressService {
	
	private UserAddressMapper userAddressMapper;
	
	@Resource
	public void setUserAddressMapper(UserAddressMapper userAddressMapper){
		this.userAddressMapper=userAddressMapper;
	}
	
	@Override
	public List<UserAddress> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserAddress findById(int id) {
		// TODO Auto-generated method stub
		return userAddressMapper.findById(id);
	}

	@Override
	public List<UserAddress> findByUserId(int userId) {
		// TODO Auto-generated method stub
		List<UserAddress> list = userAddressMapper.findByUserId(userId);
		return list;
	}

	@Override
	public void save(UserAddress userAddress) {
		// TODO Auto-generated method stub
		userAddressMapper.save(userAddress);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		userAddressMapper.delete(id);
	}

	@Override
	public void update(UserAddress userAddress) {
		// TODO Auto-generated method stub
		userAddressMapper.update(userAddress);
	}

	@Override
	public void updateDefaultAddress(int userId,int addressId) {
		// TODO Auto-generated method stub
		
		this.defaultAddress(userId);
		userAddressMapper.updateDefaultAddress(addressId);
	}

	@Override
	public void defaultAddress(int userId) {
		// TODO Auto-generated method stub
		userAddressMapper.defaultAddress(userId);
	}

	@Override
	public int findCoutByUserId(int userId) {
		// TODO Auto-generated method stub
		return userAddressMapper.findCoutByUserId(userId);
	}

}
