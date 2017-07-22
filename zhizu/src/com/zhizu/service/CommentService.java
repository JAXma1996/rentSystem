package com.zhizu.service;

import java.util.List;

import com.zhizu.model.Comment;

public interface CommentService {
	
    //查找所有评论
	public List<Comment> findAll();
	
	//根据商品id查询评论
	public List<Comment> findByTradeId(int tradeId);
	
	//根据商品id查询评论
	public List<Comment> findByUserTrade(int userId);
	
	//根据评论人id查询评论
	public List<Comment> findByUserId(int userId);
	
	//根据商品id和评论人id查询评论
	public Comment findByTradeIdAndUserId(int tradeId, int UserId);
	
	//新增评论
	public void save(Comment comment);
	
	//删除评论
	public void delete(int id);
	
	//修改评论
	//public void update(Comment comment);

}
