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
@RequestMapping("order")
public class UserOrderController extends BaseController {
	
	private TradeRentService tradeRentService;
	
	
	@Autowired	
	public void setTradeRentService(TradeRentService tradeRentService) {
		this.tradeRentService = tradeRentService;
	}
	

	
	
	@RequestMapping("showAllOrder")
	public ModelAndView showAllOrder(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		User user = getSessionUser(request);
		int borderUserId = user.getUserId();
		List<TradeRent> tradeRents = tradeRentService.findByBorderUserId(borderUserId);
		List<TradeRent> tradeRents1 = tradeRentService.findByBorIdAndTypeId(1,borderUserId);
		List<TradeRent> tradeRents2 = tradeRentService.findByBorIdAndTypeId(2,borderUserId);
		List<TradeRent> tradeRents3 = tradeRentService.findByBorIdAndTypeId(3,borderUserId);
		List<TradeRent> tradeRents4 = tradeRentService.findByBorIdAndTypeId(4,borderUserId);
		mav.addObject("tradeRents", tradeRents);
		mav.addObject("tradeRents1", tradeRents1);
		mav.addObject("tradeRents2", tradeRents2);
		mav.addObject("tradeRents3", tradeRents3);
		mav.addObject("tradeRents4", tradeRents4);
		mav.setViewName("userOrder");
		return mav;
		
	}
	
	@RequestMapping("deleteOrder-{rentId}")
	public ModelAndView deleteOrder(@PathVariable("rentId") Integer rentId,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		tradeRentService.delete(rentId);
		
		//mav.addObject("tradeRents", tradeRents);
		
		mav.setViewName("redirect:showAllOrder");
		return mav;
		
	}
	
	@RequestMapping("returnOrder-{rentId}")
	public ModelAndView returnOrder(@PathVariable("rentId") Integer rentId,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		tradeRentService.updateRentType(rentId, 3);
		
		//mav.addObject("tradeRents", tradeRents);
		
		mav.setViewName("userPublish");
		return mav;
		
	}
	
	
}
