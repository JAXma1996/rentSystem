package com.zhizu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zhizu.model.UserReport;
import com.zhizu.service.UserReportService;
@Controller
@RequestMapping("userReport")
public class UserReportController extends BaseController{

	private UserReportService userReportService;
	
	@Autowired
	public void setReportService(UserReportService userReportService) {
		this.userReportService = userReportService;
	}

	//查找所有举报
	@RequestMapping("/showReportAll")
	public ModelAndView findAll(){
		List<UserReport> userReportAll = userReportService.findAll();
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("userReportAll", userReportAll);
		modelAndView.setViewName("xxxxx");    //xxxxx 为跳转到的页面，后面再加
		return modelAndView;
	}
	
	//新增举报
	@RequestMapping("/saveUserReport")
	public ModelAndView save(HttpServletRequest request, UserReport userReport){
		ModelAndView modelAndView=new ModelAndView();
		userReportService.save(userReport);
		modelAndView.setViewName("xxxxx");    //xxxxx 为跳转到的页面，后面再加
		return modelAndView;
	}
	
	//查找所有举报
	@RequestMapping("/showUserReportAll")
	public ModelAndView findAllReportByUserId(HttpServletRequest request,int userId){
		List<UserReport> userReportByUserId = userReportService.findAllByUserId(userId);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("userReportAll", userReportByUserId);
		modelAndView.setViewName("xxxxx");    //xxxxx 为跳转到的页面，后面再加
		return modelAndView;
	}
	
}
