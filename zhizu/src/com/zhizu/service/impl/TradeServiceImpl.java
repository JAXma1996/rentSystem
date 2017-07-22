package com.zhizu.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.zhizu.mapper.TradeMapper;
import com.zhizu.model.PageUtil;
import com.zhizu.model.Trade;

import com.zhizu.service.TradeService;

@Service
@Transactional
public class TradeServiceImpl implements TradeService {
	
	
	private TradeMapper tradeMapper;
	
	@Resource
	public void setTradeMapper(TradeMapper tradeMapper) {
		this.tradeMapper = tradeMapper;
	}

	@Override
	public List<Trade> findByTradeName(String tradeName) {
		// TODO Auto-generated method stub
		return tradeMapper.findByTradeName(tradeName);
	}

	@Override
	public List<Trade> findByTypeId(int typeId) {
		// TODO Auto-generated method stub
		return tradeMapper.findByTypeId(typeId);
	}

	@Override
	public List<Trade> findByUserId(int id) {
		// TODO Auto-generated method stub
		return  tradeMapper.findByUserId(id);
	}

	@Override
	public Trade findByReportId(int id) {
		// TODO Auto-generated method stub
		return  tradeMapper.findByReportId(id);
	}

	@Override
	public Trade findByRentId(int id) {
		// TODO Auto-generated method stub
		return tradeMapper.findByRentId(id);
	}

	@Override
	public List<Trade> findAll() {
		// TODO Auto-generated method stub
		return  tradeMapper.findAll();
	}

	@Override
	public Trade findByTradeId(int id) {
		// TODO Auto-generated method stub
		return tradeMapper.findByTradeId(id);
	}

	@Override
	public int save(Trade trade) {
		// TODO Auto-generated method stub
		return tradeMapper.save(trade);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return  tradeMapper.delete(id);
	}

	@Override
	public int update(Trade trade) {
		// TODO Auto-generated method stub
		return tradeMapper.update(trade);
	}

	@Override
	public String fileToImg(MultipartFile file,HttpServletRequest request) {
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
            //System.out.println(contentType);
            //获得文件后缀名称             
            String imageName=contentType.substring(contentType.indexOf("/")+1); 
            
            //String localpath="D:"+File.separator+"imagies"+File.separator+uuid+"."+imageName;
            path="imagies/2/"+uuid+"."+imageName;
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
        //System.out.println(path);  
       
        return path;  
	}

	//查找商品总数
	@Override
	public int findCount() {
		return tradeMapper.findCount();
	}

	//查找商品总数
	@Override
	public int findCountByTypeId(int typeId){
		return tradeMapper.findCountByTypeId(typeId);
	}
		
	
	//@SuppressWarnings("null")
	//分页查询
	@Override
	public PageUtil<Trade> pageFind(int index, int pageSize) {
		PageUtil<Trade> pageUtil= new PageUtil<Trade>();
		List<Trade> list =tradeMapper.pageFind(index, pageSize);
		int ind=index%pageSize+1;
		int count=findCount();
		int pageNumber;
		if(count%pageSize==0){
			pageNumber=count/pageSize;
		}else{
			pageNumber=count/pageSize+1;
		}
		pageUtil.setIndex(ind);
		pageUtil.setPageSize(pageSize);
		pageUtil.setCount(count);
		pageUtil.setPageNumber(pageNumber);
		pageUtil.setList(list);
		return pageUtil;
	}

	//按分类分页查询
	@Override
	public PageUtil<Trade> pageFindByTypeId(Map<String, Object> map) {
		
		PageUtil<Trade> pageUtil= new PageUtil<Trade>();
		List<Trade> list =tradeMapper.pageFindByTypeId(map);
		int ind=(Integer)map.get("index") / (Integer)map.get("pageSize")+1;
		int count=findCountByTypeId(Integer.valueOf((String) map.get("typeId")));
		int pageNumber;
		if(count%(Integer)map.get("pageSize")==0){
			pageNumber=count/(Integer)map.get("pageSize");
		}else{
			pageNumber=count/(Integer)map.get("pageSize")+1;
		}
		pageUtil.setIndex(ind);
		pageUtil.setPageSize((Integer)map.get("pageSize"));
		pageUtil.setCount(count);
		pageUtil.setPageNumber(pageNumber);
		pageUtil.setList(list);
		return pageUtil;
	}

	@Override
	public PageUtil<Trade> pageFindByTradeName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		PageUtil<Trade> pageUtil= new PageUtil<Trade>();
		List<Trade> list =tradeMapper.pageFindByTradeName(map);
		int ind=(Integer)map.get("index") / (Integer)map.get("pageSize")+1;
		int count=findCount();
		int pageNumber;
		if(count%(Integer)map.get("pageSize")==0){
			pageNumber=count/(Integer)map.get("pageSize");
		}else{
			pageNumber=count/(Integer)map.get("pageSize")+1;
		}
		pageUtil.setIndex(ind);
		pageUtil.setPageSize((Integer)map.get("pageSize"));
		pageUtil.setCount(count);
		pageUtil.setPageNumber(pageNumber);
		pageUtil.setList(list);
		return pageUtil;
	}

	@Override
	public void updateSimpleTrade(Trade trade) {
		// TODO Auto-generated method stub
		tradeMapper.updateSimpleTrade(trade);
	}

	
}
