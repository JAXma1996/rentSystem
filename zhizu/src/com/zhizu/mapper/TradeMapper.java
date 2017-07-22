package com.zhizu.mapper;

import java.util.List;
import java.util.Map;

import com.zhizu.model.Trade;
import com.zhizu.model.TradeType;


 
public interface TradeMapper {
	
	//按商品名称查找商品
	public List<Trade> findByTradeName(String tradeName);
	
	//按商品类型查找商品
	public List<Trade> findByTypeId(int typeId);
	
	//根据用户id查询相关的商品信息
	public List<Trade> findByUserId(int id);
	
	
	
	//根据拉黑记录的id查询对应的商品信息
	public Trade findByReportId(int id);
	
	//根据租借表订单记录的id查询对应的商品信息
	public Trade findByRentId(int id);
	
	//查找所有商品
	public List<Trade> findAll();
	
	//按商品ID查找商品
	public Trade findByTradeId(int id);
	
	//按商品ID查找商品
	public Trade findById(int id);
	
	//增加商品
	public int save(Trade trade);
	
	//删除商品
	public int delete(int id);
	
	//修改商品
	public int update(Trade trade);
	
	//按商品分类ID寻找商品分类名
	public List<TradeType> findByTypeIdforT(int typeId);
	
	//查找商品的总数
	public int findCount();
	
	//查找商品的总数
	public int findCountByTypeId(int typeId);
	
	//分页查询
	public List<Trade> pageFind(int index,int pageSize);
	
	//按类型分页查询
	public List<Trade> pageFindByTypeId(Map<String, Object> map);
	
	//按类型分页查询
	public List<Trade> pageFindByTradeName(Map<String, Object> map);

	public void updateSimpleTrade(Trade trade);
	
	
}
