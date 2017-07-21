package com.zhizu.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/file") 
public class uploadController {
	   
    @RequestMapping(value="/upload",method=RequestMethod.POST)  
    private String fildUpload(@RequestParam(value="file",required=false) MultipartFile file,
    		@RequestParam(value="name",required=false) String userName,
    		@RequestParam(value="password",required=false) String password,
            HttpServletRequest request)throws Exception{  
    	
    	/* 1， 使用spring的MultipartFile获取jsp传过来的文件；
    	 * 2，设置需要存放文件的路径，文件名字，与后缀；
    	 *3，  file.transferTo(路径);进行xier
    	 * 
    	 * */
        List list=new ArrayList();
        list.add(userName);
        list.add(password);
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
            
            String localpath="D:"+File.separator+"imagies"+File.separator+uuid+"."+imageName;
            path="/imagies/1/"+uuid+"."+imageName;
            File file2=new File(pathRoot+path);
            //把图片存进指定目录；
            file.transferTo(file2);
    
        }  
        System.out.println(path);  
        list.add(path);
        request.setAttribute("list", list);  
        return "succes";  
    }  
  
}
