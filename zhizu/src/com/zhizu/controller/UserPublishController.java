package com.zhizu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zhizu.model.TradeRent;
import com.zhizu.model.User;
import com.zhizu.service.TradeRentService;


@Controller
@RequestMapping("publish")
public class UserPublishController extends BaseController {
	
	private TradeRentService tradeRentService;
	
	@Autowired	
	public void setTradeRentService(TradeRentService tradeRentService) {
		this.tradeRentService = tradeRentService;
	}
	
	@RequestMapping("showAllPublish")
	public ModelAndView showAllPublish(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		User user = getSessionUser(request);
		int rentUserId = user.getUserId();
		List<TradeRent> tradeRents = tradeRentService.findByRentUserId(rentUserId);
		List<TradeRent> tradeRents1 = tradeRentService.findByRenterIdAndTypeId(1,rentUserId);
		List<TradeRent> tradeRents2 = tradeRentService.findByRenterIdAndTypeId(2,rentUserId);
		List<TradeRent> tradeRents3 = tradeRentService.findByRenterIdAndTypeId(3,rentUserId);
		List<TradeRent> tradeRents4 = tradeRentService.findByRenterIdAndTypeId(4,rentUserId);

		mav.addObject("tradeRents", tradeRents);
		mav.addObject("tradeRents1", tradeRents1);
		mav.addObject("tradeRents2", tradeRents2);
		mav.addObject("tradeRents3", tradeRents3);
		mav.addObject("tradeRents4", tradeRents4);
		mav.setViewName("userPublish");
		return mav;
		
	}
	
	@RequestMapping("agreeOrder-{rentId}")
	public ModelAndView agreeOrder(@PathVariable("rentId") Integer rentId
			,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		tradeRentService.updateRentType(rentId, 2);
		//mav.addObject("tradeRents", tradeRents);
		
		mav.setViewName("redirect:showAllPublish");
		return mav;
		
	}
	
	
	@RequestMapping("deleteOrder-{rentId}")
	public ModelAndView deleteOrder(@PathVariable("rentId") Integer rentId
			,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		tradeRentService.delete(rentId);
		
		mav.setViewName("redirect:showAllPublish");
		return mav;
		
	}
}
