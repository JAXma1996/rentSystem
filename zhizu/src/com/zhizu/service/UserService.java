package com.zhizu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.zhizu.exception.UserExistException;
import com.zhizu.model.User;

public interface UserService {
	
	//插入用户
	public int save(User user) throws UserExistException;
	//删除用户
	public int delete(int id);
	//更新用户所有信息
	public int update(User user);
	//更新用户基本信息
	public User updateSimpleInfo(User user);
	//查找所有用户
	public List<User> findAll();
	//按用户ID查找用户
	public User findById(int id);
	//按用户名查找用户
	public User findByUserName(String userName);

	public User updatePassword(int id, String newPassword);

	//上传商品图片
	public String fileToImg(MultipartFile file,HttpServletRequest request);
	
}
