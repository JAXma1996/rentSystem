package com.zhizu.model;

import java.util.ArrayList;
import java.util.List;



/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class RentType {
	
	
	
	private Integer rentTypeId;                                //租赁订单状态ID
    private String rentTypeName;                               //租赁订单状态名称
    private List<TradeRent> tradeRents = new ArrayList<TradeRent>(0);       //租赁订单状态对应 的订单    RentType为一的一方，TradeRent为多的一方
    
    
    public RentType() {
	}
    
	public RentType(int rentTypeId,String rentTypeName) {
		this.rentTypeId=rentTypeId;
		this.rentTypeName = rentTypeName;
	}

	public Integer getRentTypeId() {
		return rentTypeId;
	}
	
	public void setRentTypeId(Integer rentTypeId) {
		this.rentTypeId = rentTypeId;
	}
	
	public String getRentTypeName() {
		return rentTypeName;
	}
	
	public void setRentTypeName(String rentTypeName) {
		this.rentTypeName = rentTypeName;
	}
	
	public List<TradeRent> getTradeRents() {
		return tradeRents;
	}
	
	public void setTradeRents(List<TradeRent> tradeRents) {
		this.tradeRents = tradeRents;
	}
    
    
}
