package com.zhizu.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zhizu.model.Comment;
import com.zhizu.model.Trade;
import com.zhizu.model.TradeRent;
import com.zhizu.model.User;
import com.zhizu.service.CommentService;
import com.zhizu.service.TradeRentService;
import com.zhizu.service.TradeService;



@Controller

public class CommentController extends BaseController{
	
	private CommentService commentService;
	
	private TradeService tradeService;
	
	private TradeRentService tradeRentService;
	
	@Autowired	
	public void setTradeRentService(TradeRentService tradeRentService) {
		this.tradeRentService = tradeRentService;
	}
	
	@Autowired
	public void setCommentService(CommentService commentService){
		this.commentService=commentService;
	}
	
	@Autowired
	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}
	
    //查找所有评论
	@RequestMapping("showAllComment")
	public ModelAndView findAll(HttpServletRequest request){
		int id = getSessionUser(request).getUserId();
		List<Comment> commentAll = commentService.findByUserId(id);
		
		List<Comment> commentAllByBuyer = commentService.findByUserTrade(id);
		//System.out.println(commentAll.get(0));
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("commentAll", commentAll);
		modelAndView.addObject("commentAllByBuyer", commentAllByBuyer);
		modelAndView.setViewName("userComment");    //xxxxx 为跳转到的页面，后面再加
		return modelAndView;
	}
	
	//根据商品id查询评论
	@RequestMapping("/showCommentAllByTradeId")
	public ModelAndView findByTradeId(int tradeId){
		List<Comment> commentAllByTradeId = commentService.findByTradeId(tradeId);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("commentAllByTradeId", commentAllByTradeId);
		modelAndView.setViewName("xxxxx");    //xxxxx 为跳转到的页面，后面再加
		return modelAndView;
	}
	
	//新增评论
	@RequestMapping(value="userComment")
	public ModelAndView userComment(HttpServletRequest request,
			@RequestParam(value = "tradeId", required = false) int tradeId,
			@RequestParam(value = "comment", required = false) String comment,
			@RequestParam(value = "commentSorce", required = false) String commentScore){
		ModelAndView mav = new ModelAndView();
		
		User user = getSessionUser(request);
		Trade trade = tradeService.findByTradeId(tradeId);
		Date createDate = new Date();
		float f = Float.valueOf(commentScore);
		Comment com =new Comment(user, trade, comment, f, createDate);
		
		
		
		commentService.save(com);
		
		mav.setViewName("redirect:showAllComment");
		return mav;
	}
	
	
	//根据商品id删除评论
	@RequestMapping("/deleteComment")
	public ModelAndView delete(HttpServletRequest request,int tradeId){
		ModelAndView modelAndView=new ModelAndView();
		commentService.delete(tradeId);
		modelAndView.setViewName("xxxxx");    //xxxxx 为跳转到的页面，后面再加
		return modelAndView;
	}
	
	
	@RequestMapping("commentOrder-{rentId}")
	public ModelAndView commentOrder(@PathVariable("rentId") Integer rentId,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		TradeRent tradeRent = tradeRentService.findByRentId(rentId);
		
		int borderUserId = tradeRent.getBorderUser().getUserId();
		int tradeId = tradeRent.getTrade().getTradeId();
		
		Comment com = commentService.findByTradeIdAndUserId(tradeId, borderUserId);
		if(com == null){
			Trade trade = tradeRent.getTrade();
			mav.addObject("trade", trade);
			mav.setViewName("commentList");
		}else{
			String toUrl = "showAllComment";
			mav.setViewName("redirect:"+toUrl);
		}
		return mav;
		
	}
	
}
