package com.zhizu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhizu.mapper.UserReportMapper;
import com.zhizu.model.UserReport;
import com.zhizu.service.UserReportService;

@Service
@Transactional
public class UserReportServiceImpl implements UserReportService {

	private UserReportMapper userReportMapper;
	
	@Resource
	public void setUserReportMapper(UserReportMapper userReportMapper){
		this.userReportMapper=userReportMapper;
	}
	//查找所有举报
	public List<UserReport> findAll() {
		List<UserReport> list=userReportMapper.findAll();
		return list;
	}

	//新增举报
	public void save(UserReport userReport) {
		userReportMapper.save(userReport);
		
	}

	//删除举报
	public void delete(int id) {
		userReportMapper.delete(id);
		
	}
	
	@Override
	public List<UserReport> findAllByUserId(int userId) {
		// TODO Auto-generated method stub
		List<UserReport> list=userReportMapper.findAllByUserId(userId);
		return list;
	}
	
	@Override
	public List<UserReport> findAllByTradeId(int tradeId) {
		// TODO Auto-generated method stub
		List<UserReport> list=userReportMapper.findAllByTradeId(tradeId);
		return list;
	}
	

}
