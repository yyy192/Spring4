package com.bh.b4.board.qna;

import static org.junit.Assert.*;

import java.util.Random;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bh.b4.MyJunitTest;

public class QnaDAOTest extends MyJunitTest {

	@Autowired
	private QnaDAO qnaDAO;
	
	@Test
	public void setInsertTest() throws Exception {
		
		for(int i=0;i<200;i++) {
			
			QnaDTO qnaDTO = new QnaDTO();
			qnaDTO.setTitle("Title!!"+i);
			qnaDTO.setContents("Contents!!"+i);
			qnaDTO.setWriter("Writer!!"+i);
			
			
			int result = qnaDAO.setInsert(qnaDTO);
			  
			if(i%10==0) { 
				Thread.sleep(500); 
			}
			  
		}
		System.out.println("======== FINISH ========");
	}

}
