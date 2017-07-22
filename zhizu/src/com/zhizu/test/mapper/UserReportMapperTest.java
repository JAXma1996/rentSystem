package com.zhizu.test.mapper;



import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhizu.mapper.UserReportMapper;
import com.zhizu.model.Trade;
import com.zhizu.model.User;
import com.zhizu.model.UserReport;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/spring-mybatis.xml")
public class UserReportMapperTest {

	@Autowired
	private UserReportMapper userReportMapper;
//	@Test
//	public void testFindAll() {
//		fail("Not yet implemented");
//	}

	@Test
	public void testSave() {
		User user=new User(1,"qq","qq","qq");
		Trade trade=new Trade(2,"qq");
		UserReport userReport=new UserReport(trade,user,"sdf",false,new Date());
		userReportMapper.save(userReport);
	}

	@Test
	public void testDelete() {
		userReportMapper.delete(3);
	}

}
