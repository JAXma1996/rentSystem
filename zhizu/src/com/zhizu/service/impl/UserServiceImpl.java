package com.zhizu.service.impl;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.zhizu.exception.UserExistException;
import com.zhizu.mapper.UserMapper;
import com.zhizu.model.User;
import com.zhizu.service.UserService;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class UserServiceImpl implements UserService {
	
	
	private UserMapper userMapper;
	
	@Resource
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	@Override
	public int save(User user) throws UserExistException {
		// TODO Auto-generated method stub
		User un = this.findByUserName(user.getUserName());
		
		if(un != null){
		    throw new UserExistException("用户名已经存在");
		}else{
		    user.setCreateDate(new Date());
		    
            return userMapper.save(user);
		}
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return userMapper.delete(id);
	}

	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return userMapper.update(user);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		List<User> users = new ArrayList<User>();
		users = userMapper.findAll();
		return users;
	}

	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		
		User user = new User();
		
		user = userMapper.findById(id);
		return user;
	}

	@Override
	public User findByUserName(String userName) {
		// TODO Auto-generated method stub
		User user = userMapper.findByUserName(userName);
		return user;
	}

	@Override
	public User updateSimpleInfo(User user) {
		// TODO Auto-generated method stub
		userMapper.updateSimpleInfo(user);
		user = userMapper.findById(user.getUserId());
		return user;
	}

	@Override
	public User updatePassword(int id,String newPassword) {
		// TODO Auto-generated method stub
		userMapper.updatePassword(id,newPassword);
		User user = userMapper.findById(id);
		return user;
	}

	@Override
	public String fileToImg(MultipartFile file, HttpServletRequest request) {
		// TODO Auto-generated method stub
		/* 1， 使用spring的MultipartFile获取jsp传过来的文件；
    	 * 2，设置需要存放文件的路径，文件名字，与后缀；
    	 *3，  file.transferTo(路径);进行xier
    	 * 
    	 * */
        //获得物理路径webapp所在路径  
        String pathRoot = request.getSession().getServletContext().getRealPath(""); 
        String path="";  
        if(!file.isEmpty()){  
            //生成uuid作为文件名称，防止直接使用名字出现重复  
            String uuid = UUID.randomUUID().toString().replaceAll("-","");  
            //获得文件类型 返回image/后缀
            String contentType=file.getContentType();  
            System.out.println(contentType);
            //获得文件后缀名称             
            String imageName=contentType.substring(contentType.indexOf("/")+1); 
            
            //String localpath="D:"+File.separator+"imagies"+File.separator+uuid+"."+imageName;
            path="imagies/1/"+uuid+"."+imageName;
            File file2=new File(pathRoot+path);
            //把图片存进指定目录；
            try {
				file.transferTo(file2);
			} catch (IllegalStateException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
    
        }  
        System.out.println(path);  
       
        return path;  
	}

	

}
