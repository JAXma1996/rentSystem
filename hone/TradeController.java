package com.zhizu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zhizu.model.Comment;
import com.zhizu.model.PageUtil;
import com.zhizu.model.Trade;
import com.zhizu.model.TradeType;
import com.zhizu.model.User;
import com.zhizu.service.CommentService;
import com.zhizu.service.TradeService;

@Controller
@RequestMapping("trade")
public class TradeController extends BaseController {
	
	
	private TradeService tradeService;
	
	@Autowired
	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}
	
	private CommentService commentService;
	
	@Autowired
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
	@RequestMapping("showAll")
	public ModelAndView findAll(HttpServletRequest request) {
		HttpSession session=request.getSession();
		System.out.println();
		//首页所需要的数据：五个分类的商品。
		List<Trade> guessULike=tradeService.findAll();
		List<Trade> tradeType1 = tradeService.findByTypeId(1);		
		//System.out.println(tradeType1.get(1));
		List<Trade> tradeType2 = tradeService.findByTypeId(2);
		List<Trade> tradeType3 = tradeService.findByTypeId(3);
		List<Trade> tradeType4 = tradeService.findByTypeId(4);
		List<Trade> tradeType5 = tradeService.findByTypeId(5);
        List list=new ArrayList<>();
        list.add(tradeType1);
        list.add(tradeType2);
        list.add(tradeType3);
        list.add(tradeType4);
        list.add(tradeType5);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("home");
//		view.addObject("tradeType1",tradeType1 );
//		view.addObject("tradeType2", tradeType3);
//		view.addObject("tradeType3", tradeType2);	
//		view.addObject("tradeType4", tradeType4);	
//		view.addObject("tradeType5", tradeType5);
		mav.addObject("list",list);
		mav.addObject("guessULike",guessULike);
		return mav;
	}

	@RequestMapping("findByName")
	public ModelAndView findByName(@RequestParam("tradename") String tradename) {
		List<Trade> tradeByName = tradeService.findByTradeName(tradename);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("showTrade");
		mav.addObject("tradeByName", tradeByName);
		
		return mav;
	}
	@RequestMapping("findByType")
	public ModelAndView findByType(@RequestParam("tradeType") int tradeType){
		
		List<Trade> tradeByType=tradeService.findByTypeId(tradeType);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("showTrade");
		mav.addObject("tradeByType", tradeByType);
		return mav;
	}
	
   //很用心的注释：显示商品详情

	@RequestMapping("introduction")
	public ModelAndView showItem(@RequestParam("tradeId") int tradeId){
		List<Comment> listcom=commentService.findByTradeId(tradeId);
		//System.out.println(listcom.get(0).toString());
		Trade trade=tradeService.findByTradeId(tradeId);
		ModelAndView mav=new ModelAndView();
		//用itemDetail.jsp页面进行商品详情显示；
		mav.setViewName("introduction");
		mav.addObject("trade", trade);
		mav.addObject("listcom",listcom);
		return mav;
	}
	
	
   //上架商品
   @RequestMapping("itemSave")
   public ModelAndView saveItem(HttpServletRequest request,Trade trade,
		   @RequestParam(value="file",required=false) MultipartFile file,
		   @RequestParam(value="tradeTypeId",required=false) int tradeTypeId
		   ){
	   
	   User user = getSessionUser(request);
	   TradeType tradeType=new TradeType();
	   tradeType.setTypeId(tradeTypeId);
	   String img=tradeService.fileToImg(file,request);
	   //插入页面没有的数据
	   trade.setCreateDate(new Date());
	   trade.setPhoto(img);
       trade.setTradeType(tradeType);
       
       trade.setUser(user);
       
	   //System.out.println(trade);
	   tradeService.save(trade);
	   ModelAndView mav=new ModelAndView();
	   mav.setViewName("redirect:showAll");
	   return mav;
   }
   
   
   //发布商品
   @RequestMapping("publishItem")
   public ModelAndView publishItem(HttpServletRequest request){
	   ModelAndView mav=new ModelAndView();
       mav.setViewName("insertTrade");
	   return mav;
   }
   
   
   //跳转到编辑商品页面
   @RequestMapping("/toupdate")
   public ModelAndView toUpdate(@RequestParam(value="tradeId") int tradeId){
	   Trade trade=tradeService.findByTradeId(tradeId);
	   ModelAndView view=new ModelAndView();
	   view.setViewName("insertTrade");
	   view.addObject("trade",trade);
	   
	   return view;
   }
   //接受重新编辑的商品，进行更新；
   @RequestMapping("itemupdate")
   public ModelAndView updateTrade(HttpServletRequest request,Trade trade,
		   @RequestParam(value="file",required=false) MultipartFile file,
		   @RequestParam(value="tradeTypeId",required=false) int tradeTypeId
		   ){
	   User user=new User();
	   user=getSessionUser(request);
	   String img=tradeService.fileToImg(file,request);
	   TradeType tradeType=new TradeType();
	   trade.setUser(user);
	   trade.setPhoto(img);
	   tradeType.setTypeId(tradeTypeId); 
       trade.setTradeType(tradeType);
	   tradeService.updateSimpleTrade(trade);
	   ModelAndView view=new ModelAndView();
       view.setViewName("redirect:showAll");
	   return view;
	
   }
   
   
   
   
    //按类型分页查询
 	@RequestMapping("showAllByTypeId")
 	public ModelAndView pageFindByTypeId(@RequestParam(value="index", required = false) String index,@RequestParam("typeId") String typeId,
 			@RequestParam(value="tradeDeposit" , required = false) String tradeDeposit,
 			@RequestParam(value="price", required = false) String price, 
 			@RequestParam(value="tradeName", required = false) String tradeName) {
 		
 		Map<String, Object> map = new HashMap<String,Object>();
 		int pageIndex;
 		int index1 = 0;
 		if(index.equals("")){
 			index1=0;
 		}else if(!index.equals("")){
 			pageIndex = Integer.parseInt(index);
 			index1=(pageIndex-1)*12;
 		}
 		
 		map.put("typeId", typeId);
 		map.put("tradeDeposit", tradeDeposit);
 		map.put("price", price);
 		map.put("index", index1);
 		map.put("pageSize", 12);
 		map.put("tradeName", "%"+tradeName+"%");
 		
 		PageUtil<Trade> pageUtil = tradeService.pageFindByTypeId(map);
 		ModelAndView mav=new ModelAndView();
 		mav.addObject("pageUtil", pageUtil);
 		mav.addObject("typeId",typeId);
 		mav.addObject("tradeDeposit1",tradeDeposit);
 		mav.addObject("price1",price);
 		mav.addObject("tradeName1",tradeName);
 		mav.setViewName("showTrades");
 		
 		return mav;
 	}
 	
 	//按类型分页综合查询
 	@RequestMapping("showAllByType")
 	public ModelAndView pageFindByType(@RequestParam(value="index", required = false) String index,@RequestParam("typeId") String typeId,
 			@RequestParam(value="tradeDeposit" , required = false) String tradeDeposit,
 			@RequestParam(value="price", required = false) String price, 
 			@RequestParam(value="tradeName", required = false) String tradeName) {
 		
 		Map<String, Object> map = new HashMap<String,Object>();
 		int pageIndex;
 		int index1 = 0;
 		if(index.equals("")){
 			index1=0;
 		}else if(!index.equals("")){
 			pageIndex = Integer.parseInt(index);
 			index1=(pageIndex-1)*12;
 		}
 		
 		map.put("typeId", typeId);
 		map.put("tradeDeposit", tradeDeposit);
 		map.put("price", price);
 		map.put("index", index1);
 		map.put("pageSize", 12);
 		map.put("tradeName", "%"+tradeName+"%");
 		
 		PageUtil<Trade> pageUtil = tradeService.pageFindByTypeId(map);
 
 		ModelAndView mav=new ModelAndView();
 		mav.addObject("pageUtil", pageUtil);
 		mav.addObject("typeId",typeId);
 		mav.addObject("tradeDeposit1",tradeDeposit);
 		mav.addObject("price1",price);
 		mav.addObject("tradeName1",tradeName);
 		mav.setViewName("showTrades");
 		
 		return mav;
 	}
 	
 	//分页查询
	@RequestMapping("/showAllByTradeName")
	public ModelAndView findAll(@RequestParam(value="index", required = false) String index,@RequestParam("typeId") String typeId,
 			@RequestParam(value="tradeDeposit" , required = false) String tradeDeposit,
 			@RequestParam(value="price", required = false) String price, 
 			@RequestParam(value="tradeName", required = false) String tradeName) {
		int pageIndex;
		int index1 = 0;
		Map<String, Object> map = new HashMap<String,Object>();
		
		if(index.equals("")){
			index1=0;
		}else if(!index.equals("")){
			System.out.println(Integer.parseInt(index));
			pageIndex = Integer.parseInt(index);
			index1=(pageIndex-1)*12;
		}

 		map.put("typeId", typeId);
 		map.put("tradeDeposit", tradeDeposit);
 		map.put("price", price);
 		map.put("index", index1);
 		map.put("pageSize", 12);
 		map.put("tradeName", "%"+tradeName+"%");
 		
		
		PageUtil<Trade> pageUtil = tradeService.pageFindByTradeName(map);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("showTrades");
		
		
 		mav.addObject("pageUtil", pageUtil);
		
		return mav;
	}
	
	
	@RequestMapping("showMyTrade")
	public ModelAndView showMyTrade(HttpServletRequest request) {
		
		ModelAndView mav=new ModelAndView();
		int id = getSessionUser(request).getUserId();
		List<Trade> trades = tradeService.findByUserId(id);
		
		
		mav.addObject("trades", trades);
		mav.setViewName("userTrade");
		return mav;
	}
	
	
	@RequestMapping("deleteTrade-{tradeId}")
	public ModelAndView deleteTrade(HttpServletRequest request,@PathVariable("tradeId") int tradeId) {
		
		ModelAndView mav=new ModelAndView();
		tradeService.delete(tradeId);
		
		mav.setViewName("redirect:showMyTrade");
		return mav;
	}
	
	@RequestMapping("uupdateTrade-{tradeId}")
	public ModelAndView updateTrade(HttpServletRequest request,@PathVariable("tradeId") int tradeId) {
		
		ModelAndView mav=new ModelAndView();
		
		
		
		mav.addObject("tradeId", tradeId);
		mav.setViewName("redirect:showMyTrade");
		return mav;
	}
}
