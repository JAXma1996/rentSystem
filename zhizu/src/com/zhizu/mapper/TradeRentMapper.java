package com.zhizu.mapper;

import java.util.Date;
import java.util.List;

import com.zhizu.model.RentType;
import com.zhizu.model.TradeRent;

public interface TradeRentMapper {
	//根据用户租出人id查询相应商品是否有提交的租借申请订单，返回；(租借申请提交并)；
	//返回类型未知֪
	public RentType findByRentTypeId(int rentTypeId);
	   
	//查询买家分类的订单
	public List<TradeRent> findByBorderIdAndTypeId(int rentTypeId,int borderUserId);
	
	//查询卖家分类的订单
	public List<TradeRent> findByRenterIdAndTypeId(int rentTypeId,int rentUserId);
	
	//查询用户租出商品的订单
	public List<TradeRent> findByRentUserId(int rentUserId);
	
	//查询租入用户租入商品的订单
	public List<TradeRent> findByBorderUserId(int borderUserId);
	
	//根据订单ID查询订单
	public TradeRent findByRentId(int rentId);
	
	//查询用户所有订单
	public List<TradeRent> findAll(int userId);
	//查询用户租进商品的订单
	
	//更新订单最迟归还时间
	public void updateLastDate(int rentId);
	
	//生成订单
	public int save(TradeRent tradeRent);
		
	//删除订单
	public int delete(int rentId);
	
	//修改订单
	public int update(int id);
	
	//更新订单状态
	public void updateRentType(int rentId,int typeId,Date rentEndDate);
	
}
