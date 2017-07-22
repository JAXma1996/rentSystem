package com.zhizu.test.mapper;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhizu.mapper.TradeMapper;
import com.zhizu.model.Trade;
import com.zhizu.model.TradeType;
import com.zhizu.model.User;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/spring-mybatis.xml")
public class TradeMapperTest {

	@Autowired
	private TradeMapper tradeMapper;
	@Test
	public void testFindByTradeName() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindByTradeType() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindByUserId() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindByReportId() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindByRentId() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindByTradeId() {
		fail("Not yet implemented");
	}

	@Test
	public void testSave() {
		TradeType tradeType= new TradeType(1,"ju");
		User user=new User(123,"李","dsds","123123");
		Trade trade=new Trade("123",tradeType,user,15.00,"dsdsdsd",2,"dsdsdsdsd",new Date(), null);
		tradeMapper.save(trade);
	}

	@Test
	public void testDelete() {
		tradeMapper.delete(458);
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

}
