package com.zhizu.test.mapper;



import java.util.Date;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.zhizu.mapper.TradeRentMapper;
import com.zhizu.model.RentType;
import com.zhizu.model.Trade;
import com.zhizu.model.TradeRent;
import com.zhizu.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/spring-mybatis.xml")
public class TradeRentMapperTest {

	
	@Autowired
	private TradeRentMapper tradeRentMapper;
	
	@Test
	public void testFindForRentType() {
		//fail("Not yet implemented");
		
		
	}

	@Test
	public void testFindByRentUerId() {
		//fail("Not yet implemented");
		
	}

	@Test
	public void testSave() {
		//fail("Not yet implemented");
		Trade trade = new Trade(1,"PP");
		User rUser = new User(1,"KK");
		User bUser = new User(2,"LL");
		RentType rentType = new RentType(1,"未完成");
		TradeRent tradeRent = new TradeRent(trade,rUser,bUser,1,new Date(),null,rentType,null,null, null);
		tradeRentMapper.save(tradeRent);
	}

	@Test
	public void testDelete() {
		//fail("Not yet implemented");
		/*TradeRent tradeRent = new TradeRent();
		tradeRent.setRentId(1);*/
		tradeRentMapper.delete(1);
	}

	@Test
	public void testUpdate() {
		//fail("Not yet implemented");
	}

}
