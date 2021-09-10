package com.bh.b4.member;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bh.b4.MyJunitTest;

public class MemberDAOTest extends MyJunitTest {

	@Autowired
	private MemberDAO memberDAO;
	
	
	public void getLogin() throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("T1");
		memberDTO.setPw("1234");
	}
	
	//@Test
	public void getIdCheck() throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("test");
		
		memberDTO = memberDAO.getIdCheck(memberDTO);
		
		assertNotEquals(null, memberDTO);
	}

}
