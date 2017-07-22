package com.zhizu.mapper;

import java.util.List;

import com.zhizu.model.User;

public interface UserMapper {
   
	//查找所有用户
	public List<User> findAll();
	//按用户ID查找用户
	public User findById(int id);
	//按用户名查找用户
	public User findByUserName(String userName);
	
	//新增用户
	public int save(User user);
	//删除用户
	public int delete(int id);
	//修改用户
	public int update(User user);
	//修改用户基本信息
	public int updateSimpleInfo(User user);
	
	//判断用户是否被拉黑，使用输入的用户名查询他的id再
	//与拉黑表匹配，返回被拉黑的User；
	public User judgeBlack(String userName);
	//修改用户密码
	public void updatePassword(int id, String newPassword);
   
}
