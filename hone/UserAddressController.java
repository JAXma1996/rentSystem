package com.zhizu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zhizu.model.User;
import com.zhizu.model.UserAddress;
import com.zhizu.service.UserAddressService;

@Controller
@RequestMapping("address")
public class UserAddressController extends BaseController {
	
	private UserAddressService userAddressService;
	
	@Autowired
	public void setUserAddressService(UserAddressService userAddressService) {
		this.userAddressService = userAddressService;
	}
	
	@RequestMapping(value="myAddress")
	public ModelAndView userAddress(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		User user = getSessionUser(request);
		int userId = user.getUserId();
		List<UserAddress> userAddresses = userAddressService.findByUserId(userId);
		mav.addObject("userAddresses", userAddresses);
		mav.setViewName("userAddress");
		return mav;
	}
	
	
	@RequestMapping(value="defaultAddress-{addressId}")
	public ModelAndView defaultAddress(HttpServletRequest request
			,@PathVariable("addressId") Integer addressId){
		ModelAndView mav = new ModelAndView();
		User user = getSessionUser(request);
		int userId = user.getUserId();
		userAddressService.updateDefaultAddress(userId, addressId);
		
		mav.setViewName("redirect:myAddress");
		return mav;
	}
	
	@RequestMapping("addAddress")
	public ModelAndView addAddress(HttpServletRequest request,UserAddress userAddress) {
	
		ModelAndView mav = new ModelAndView();
		User user = getSessionUser(request);
		userAddress.setUser(user);
		userAddress.setAddressType(false);
		userAddressService.save(userAddress);
		mav.setViewName("redirect:myAddress");
		return mav;
	}
	
	
	@RequestMapping("deleteAddress-{addressId}")
	public ModelAndView deleteAddress(@PathVariable("addressId") Integer addressId,
			HttpServletRequest request) {
	
		ModelAndView mav = new ModelAndView();
		
		userAddressService.delete(addressId);
		mav.setViewName("redirect:myAddress");
		return mav;
	}
	
	@RequestMapping(value="updateAddress-{addressId}",method = RequestMethod.GET)
	public ModelAndView updateAddress(@PathVariable("addressId") Integer addressId,
			HttpServletRequest request) {
	
		ModelAndView mav = new ModelAndView();
		UserAddress userAddress = userAddressService.findById(addressId);
		Boolean addressType = userAddress.getAddressType();
		mav.addObject("addr", userAddress);
		mav.addObject("addressId", addressId);
		mav.addObject("addressType", addressType);
		mav.setViewName("forward:myAddress");
		return mav;
	}
	
	@RequestMapping(value="updateAddress",method = RequestMethod.POST)
	public ModelAndView updateAddress(UserAddress userAddress,
			@RequestParam(value = "addressId", required = false) Integer addressId,
			HttpServletRequest request) {
	
		ModelAndView mav = new ModelAndView();
		User user =getSessionUser(request);
		userAddress.setUser(user);
		userAddressService.update(userAddress);
		
		mav.setViewName("redirect:myAddress");
		return mav;
	}
}
