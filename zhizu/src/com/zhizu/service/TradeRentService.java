package com.zhizu.service;

import java.util.List;

import com.zhizu.model.RentType;
import com.zhizu.model.TradeRent;

public interface TradeRentService {
	
	//查询订单状态
	public RentType findByRentTypeId(int rentTypeId);
	
	//查询买家分类的订单
	public List<TradeRent> findByBorIdAndTypeId(int rentTypeId,int borderId);
	
	//查询卖家分类的订单
	public List<TradeRent> findByRenterIdAndTypeId(int rentTypeId,int rentUserId);
	
	//查询用户租出商品的订单
	public List<TradeRent> findByRentUserId(int rentUserId);
	
	//查询用户租入商品的订单
	public List<TradeRent> findByBorderUserId(int borderUserId);
		
	//按订单ID查询订单
	public TradeRent findByRentId(int rentId);
	
	//查询用户所有订单
	public List<TradeRent> findAll(int userId);
	
	//生成订单
	public void save(TradeRent tradeRent);
		
	//删除订单
	public void delete(int rentId);
	
	//修改订单
	public void update(int id);
	
	//更新最迟归还时间
	public void updateLasetDate(int rentId);
	
	//更新订单状态
	public void updateRentType(int rentId,int typeId);
}
