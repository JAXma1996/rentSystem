package com.zhizu.model;

import java.util.Date;


/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comment  implements java.io.Serializable {


    // Fields    

     /**
	 * 序列化值
	 */
	 private static final long serialVersionUID = -8748778804988650748L;
	 private Integer commentId;                //评论ID
     private User user;                        //评论人
     private Trade trade;                      //评论对应商品
     private String comment;                   //评论内容
     private Float commentScore;               //评分
     private Date createDate;                  //评论时间


    // Constructors

    /** default constructor */
    public Comment() {
    }

    
    /** full constructor */
    public Comment(User user, Trade trade, String comment, Float commentScore, Date createDate) {
        this.user = user;
        this.trade = trade;
        this.comment = comment;
        this.commentScore = commentScore;
        this.createDate = createDate;
    }

   
    // Property accessors

    public Integer getCommentId() {
        return this.commentId;
    }
    
    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public Trade getTrade() {
        return this.trade;
    }
    
    public void setTrade(Trade trade) {
        this.trade = trade;
    }

    public String getComment() {
        return this.comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }

    public Float getCommentScore() {
		return commentScore;
	}


	public void setCommentScore(Float commentScore) {
		this.commentScore = commentScore;
	}
    
    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", user=" + user + ", trade=" + trade + ", comment=" + comment
				+ ", commentScore=" + commentScore + ", createDate=" + createDate + "]";
	}


	
   








}