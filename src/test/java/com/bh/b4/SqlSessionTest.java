package com.bh.b4;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class SqlSessionTest extends MyJunitTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void sqlSessionTest() throws Exception {
		assertNotNull(sqlSession);
	}

}
