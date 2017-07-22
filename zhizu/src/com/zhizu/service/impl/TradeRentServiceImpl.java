package com.zhizu.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhizu.mapper.TradeRentMapper;
import com.zhizu.model.RentType;
import com.zhizu.model.TradeRent;
import com.zhizu.service.TradeRentService;


@Service
@Transactional
public class TradeRentServiceImpl implements TradeRentService {

	private TradeRentMapper tradeRentMapper;
	
	@Resource
	public void setTradeRentMapper(TradeRentMapper tradeRentMapper) {
		this.tradeRentMapper = tradeRentMapper;
	}
	
	@Override
	public RentType findByRentTypeId(int rentTypeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TradeRent> findByRentUserId(int rentUserId) {
		// TODO Auto-generated method stub
		return tradeRentMapper.findByRentUserId(rentUserId);
	}
	
	@Override
	public List<TradeRent> findByBorderUserId(int borderUserId) {
		// TODO Auto-generated method stub
		return tradeRentMapper.findByBorderUserId(borderUserId);
	}

	
	@Override
	public void save(TradeRent tradeRent) {
		// TODO Auto-generated method stub
		tradeRentMapper.save(tradeRent);
	}

	@Override
	public void delete(int rentId) {
		// TODO Auto-generated method stub
		tradeRentMapper.delete(rentId);
	}

	@Override
	public void update(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<TradeRent> findAll(int userId) {
		// TODO Auto-generated method stub
		return tradeRentMapper.findAll(userId);
	}

	@Override
	public void updateLasetDate(int rentId) {
		// TODO Auto-generated method stub
		tradeRentMapper.updateLastDate(rentId);
	}

	

	@Override
	public List<TradeRent> findByBorIdAndTypeId(int rentTypeId, int borderId) {
		// TODO Auto-generated method stub
		List<TradeRent> list = tradeRentMapper.findByBorderIdAndTypeId(rentTypeId, borderId);
		return list;
	}

	@Override
	public List<TradeRent> findByRenterIdAndTypeId(int rentTypeId, int rentUserId) {
		// TODO Auto-generated method stub
		List<TradeRent> list = tradeRentMapper.findByRenterIdAndTypeId(rentTypeId, rentUserId);
		return list;
	}

	@Override
	public void updateRentType(int rentId, int typeId) {
		// TODO Auto-generated method stub
		Date date = new Date();
		
		tradeRentMapper.updateRentType(rentId, typeId,date);
	}

	@Override
	public TradeRent findByRentId(int rentId) {
		// TODO Auto-generated method stub
		return tradeRentMapper.findByRentId(rentId);
	}

	
	

}
