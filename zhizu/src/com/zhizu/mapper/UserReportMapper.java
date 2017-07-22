package com.zhizu.mapper;

import java.util.List;


import com.zhizu.model.UserReport;

public interface UserReportMapper {
	//查找所有举报
	public List<UserReport> findAll();
	
	//新增举报
	public void save(UserReport userReport);
	
	//删除举报
	public void delete(int id);
	
	//根据用户ID查找举报内容
	public List<UserReport> findAllByUserId(int userId);
	
	//根据商品ID查找举报
	public List<UserReport> findAllByTradeId(int tradeId);
	
	//public void update(UserReport userReport);
}
