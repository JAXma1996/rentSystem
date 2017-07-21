package com.zhizu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zhizu.exception.UserExistException;
import com.zhizu.model.User;
import com.zhizu.service.UserService;

@Controller
public class RegisterController extends BaseController {
	
	private UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	/**
	 * 用户注册GET
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/doRegister.html",method = RequestMethod.GET)
	public ModelAndView userRegister(HttpServletRequest request){
		
		
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:/register.jsp");
		return view;
	}
	
	/**
	 * 用户注册POST
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/doRegister.html",method = RequestMethod.POST)
	public ModelAndView userRegister(HttpServletRequest request, User user){
		
		
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:trade/showAll");
		try {
			userService.save(user);
		} catch (UserExistException e) {
			view.addObject("errorMsg", "用户名已经存在，请选择其它的名字。");
			view.setViewName("forward:/register.jsp");
		}
		setSessionUser(request,user);
		return view;
	}
	
}
