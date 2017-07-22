package com.zhizu.test.mapper;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhizu.mapper.CommentMapper;
import com.zhizu.model.Comment;
import com.zhizu.model.Trade;
import com.zhizu.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/spring-mybatis.xml")
public class CommentMapperTest {

	@Autowired
	private CommentMapper commentMapper;
	
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
		User user=new User(1,"qq","qq","qq");
		Trade trade=new Trade(2,"qq");
		Comment comment=new Comment(user,trade,"qq",null, new Date());
		commentMapper.save(comment);
	}

	@Test
	public void testDelete() {
		commentMapper.delete(3);
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

}
