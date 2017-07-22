package com.zhizu.model;

import java.util.ArrayList;

import java.util.List;



/**
 * TradeType entity. @author MyEclipse Persistence Tools
 */

public class TradeType  implements java.io.Serializable {


    /**
	 * 序列化值
	 */
	private static final long serialVersionUID = 5144732155901563264L;
	// Fields    

     private Integer typeId;                     //商品类别ID
     private String typeName;                    //商品分类名称
     private List<Trade> trades = new ArrayList<Trade>(0);         //商品分类对应商品    一对多，此为一的一方


    // Constructors

    /** default constructor */
    public TradeType() {
    }
    
    
    /** full constructor */
    public TradeType(String typeName) {
        this.typeName = typeName;
    }
    
    /**
     * 测试所用构造方法
     * @param typeId
     * @param typeName
     */
    public TradeType(int typeId,String typeName){
    	this.typeId = typeId;
    	this.typeName = typeName;
    }
   
    // Property accessors

    public Integer getTypeId() {
        return this.typeId;
    }
    
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return this.typeName;
    }
    
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }


	public List<Trade> getTrades() {
		return trades;
	}


	public void setTrades(List<Trade> trades) {
		this.trades = trades;
	}








}