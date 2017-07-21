package com.zhizu.controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zhizu.model.User;
import com.zhizu.service.UserService;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {
	
	private UserService userService;

	
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	
	
	@RequestMapping(value="userInfo",method = RequestMethod.GET)
	public ModelAndView userInfo(HttpServletRequest request){
		
		User user = getSessionUser(request);
		ModelAndView mav = new ModelAndView();
		
		if(user==null){
			mav.setViewName("redirect:/login.jsp");
		}else{
			
			mav.addObject("user", user);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
			if(user.getBirthday() != null ){
				String str=sdf.format(user.getBirthday());  
				mav.addObject("birthDate", str);
			}
			mav.setViewName("userInfo");
			
		}
		return mav;
		
	}
	
	
	@RequestMapping(value="userInfo",method = RequestMethod.POST)
	public ModelAndView userInfo(HttpServletRequest request,User user,
			@RequestParam(value = "file", required = false) MultipartFile file
			,@RequestParam(value = "birthDate", required = false) String birthday){
		
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		Date birthDate = new Date();
		try {
			birthDate = sdf.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		user.setBirthday(birthDate);
		String img = userService.fileToImg(file, request);
		user.setPhoto(img);
		user = userService.updateSimpleInfo(user);
		setSessionUser(request,user);

		mav.setViewName("redirect:userInfo");
		return mav;
		
	}
	
	
	@RequestMapping(value="myPassword")
	public ModelAndView userPassword(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userPassword");
		return mav;
	}
	
	@RequestMapping(value="updatePassword")
	public ModelAndView updatePassword(HttpServletRequest request,
			@RequestParam(value = "newPassword", required = false) String newPassword){
		ModelAndView mav = new ModelAndView();
		int id = getSessionUser(request).getUserId();
		User user = userService.updatePassword(id,newPassword);
		
		setSessionUser(request,user);
		mav.setViewName("userPassword");
		return mav;
	}
	
	
	
	
	
	
}
