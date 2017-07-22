package com.zhizu.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zhizu.model.RentType;
import com.zhizu.model.Trade;
import com.zhizu.model.TradeRent;
import com.zhizu.model.User;
import com.zhizu.model.UserAddress;
import com.zhizu.service.TradeRentService;
import com.zhizu.service.TradeService;
import com.zhizu.service.UserAddressService;

@Controller
@RequestMapping("tradeRent")
public class TradeRentController extends BaseController{
	private UserAddressService userAddressService;
	private TradeService tradeService;
	private TradeRentService tradeRentService;
	@Autowired
	public void setUserAddressService(UserAddressService userAddressService) {
		this.userAddressService = userAddressService;
	}
	@Autowired
	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}
	@Autowired
	public void setTradeRentService(TradeRentService tradeRentService) {
		this.tradeRentService = tradeRentService;
	}
	
	@RequestMapping(value="userRent.html")
	public ModelAndView userRent(HttpServletRequest request,@RequestParam("tradeId") String tradeId){
		ModelAndView mav = new ModelAndView();
		User user = getSessionUser(request);
		int userId = user.getUserId();
		
		Trade trade=new Trade();
		trade=tradeService.findByTradeId(Integer.parseInt(tradeId));
		
		List<UserAddress> userAddresses = userAddressService.findByUserId(userId);
		int count =userAddressService.findCoutByUserId(userId);
		
		mav.addObject("trade", trade);
		mav.addObject("userAddresses", userAddresses);
		mav.addObject("count", count);
		mav.setViewName("pay");
		
		return mav;
	}
	
	@RequestMapping(value="addRent.html")
	public ModelAndView addRent(HttpServletRequest request,@RequestParam("rentTradeId") String rentTradeId,
			@RequestParam("rentUserId") String rentUserId,@RequestParam("rentNum") String rentNum,
			@RequestParam("price") String price,@RequestParam("addressId") String addressId,
			@RequestParam("typeId") String typeId,@RequestParam("userName") String userName,
			@RequestParam("userPhone") String userPhone,@RequestParam("addressInfo") String addressInfo){
		
		ModelAndView mav = new ModelAndView();
		User borderUser = getSessionUser(request);
		User rentUser=new User();
		rentUser.setUserId(Integer.parseInt(rentUserId));
		Trade rentTrade=new Trade();
		rentTrade.setTradeId(Integer.parseInt(rentTradeId));
		RentType rentType=new RentType();
		rentType.setRentTypeId(1);
		UserAddress userAddress=new UserAddress();
		userAddress.setAddressId(Integer.parseInt(addressId));
		
		TradeRent tradeRent=new TradeRent();
		tradeRent.setTrade(rentTrade);
		tradeRent.setRentUser(rentUser);
		tradeRent.setBorderUser(borderUser);
		tradeRent.setRentNum(Integer.parseInt(rentNum));
		tradeRent.setRentSubmitDate(new Date());
		tradeRent.setRentType(rentType);
		tradeRent.setUserAddress(userAddress);
		
		tradeRentService.save(tradeRent);
		
		mav.addObject("typeId", typeId);
		mav.addObject("price",price);
		mav.addObject("userName",userName);
		mav.addObject("userPhone",userPhone);
		mav.addObject("addressInfo",addressInfo);
		mav.setViewName("success");
		
		return mav;
	}

}
