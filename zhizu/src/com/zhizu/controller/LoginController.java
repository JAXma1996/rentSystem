package com.zhizu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zhizu.cons.CommonConstant;
import com.zhizu.model.User;
import com.zhizu.service.UserService;

@Controller
public class LoginController extends BaseController {
	
	private UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	@RequestMapping(value="/doLogin.html",method=RequestMethod.GET)
	public ModelAndView userLogin(HttpServletRequest request){
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/login.jsp");
		return mav;
	}
	
	/**
	 * 用户登录
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(value="doLogin.html",method=RequestMethod.POST)
	public ModelAndView userLogin(HttpServletRequest request, User user){
		
		User dbUser = userService.findByUserName(user.getUserName());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("forward:/login.jsp");
		if (dbUser == null) {
			mav.addObject("errorMsg", "用户名不存在");
			//System.out.println("用户名不存在");
		} else if (!dbUser.getPassword().equals(user.getPassword())) {
			mav.addObject("errorMsg", "用户密码不正确");
			//System.out.println("用户密码不正确");
		} else {
			
			setSessionUser(request,dbUser);
			String toUrl = (String)request.getSession().getAttribute(CommonConstant.LOGIN_TO_URL);
			request.getSession().removeAttribute(CommonConstant.LOGIN_TO_URL);
			//如果当前会话中没有保存登录之前的请求URL，则直接跳转到主页
			if(StringUtils.isEmpty(toUrl)){
				toUrl = "redirect:trade/showAll";
			}
			
			//toUrl ="redirect:loginSuccess.jsp";
			mav.setViewName(toUrl);
		}
		return mav;
	}
	
	@RequestMapping(value="myHome")
	public ModelAndView myHome(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		User user = getSessionUser(request);
		mav.addObject("user", user);
		mav.setViewName("redirect:trade/showAll");
		return mav;
	}
	
	
	/* 登录注销
	 * @param session
	 * @return
	 */
	@RequestMapping("doLoginOut.html")
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute(CommonConstant.USER_CONTEXT);
		String toUrl = "myHome";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:trade/showAll");
		return mav;
	}
}
