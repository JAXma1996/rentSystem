package com.zhizu.service.impl;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhizu.mapper.CommentMapper;
import com.zhizu.model.Comment;
import com.zhizu.model.Trade;
import com.zhizu.model.User;
import com.zhizu.service.CommentService;
@Service
@Transactional
public class CommentServiceImpl implements CommentService{
	
	private CommentMapper commentMapper;
	
	@Resource
	public void setCommentMapper(CommentMapper commentMapper){
		this.commentMapper=commentMapper;
	}
	

	//查找所有评论
	public List<Comment> findAll() {
		List<Comment> list=commentMapper.findAll();
		return list;
	}

	//根据商品id查询评论
	public List<Comment> findByTradeId(int tradeId) {
		List<Comment> list=commentMapper.findByTradeId(tradeId);
		return list;
	}

	//新增评论
	public void save(Comment comment) {
		commentMapper.save(comment);
		
	}

	//删除评论
	public void delete(int id) {
		commentMapper.delete(id);
		
	}

	@Override
	public List<Comment> findByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Comment> list = commentMapper.findByUserId(userId);
		return list;
	}

	@Override
	public Comment findByTradeIdAndUserId(int tradeId, int UserId) {
		// TODO Auto-generated method stub
		return commentMapper.findByTradeIdAndUserId(tradeId, UserId);
	}

	@Override
	public List<Comment> findByUserTrade(int userId) {
		// TODO Auto-generated method stub
		List<Comment> list = new ArrayList<Comment>();
		List<Comment> list1 = this.findAll();
		
		for (Comment comment : list1) {
			Trade trade = comment.getTrade();
			User user = trade.getUser();
			if(user.getUserId() == userId){
				list.add(comment);
			}
		}
		
		return list;
	}

	//修改评论
//	public void update(Comment comment) {
//		commentMapper.update(comment);
//		
//	}

}
