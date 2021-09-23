package com.bh.b4.board;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bh.b4.MyJunitTest;
import com.bh.b4.board.notice.NoticeDAO;

public class CommentDAOTest extends MyJunitTest {

	@Autowired
	NoticeDAO noticeDAO;
	
	@Test
	public void test() throws Exception {
		for(int i=0;i<100;i++) {
			CommentsDTO commentsDTO = new CommentsDTO();
			commentsDTO.setBoard("notice");
			commentsDTO.setNum(183L);
			commentsDTO.setWriter("bh56");
			commentsDTO.setContents("comments"+i);
			noticeDAO.setComments(commentsDTO);
			if(i%10==0) {
				Thread.sleep(1000);
			}
			
		}
		System.out.println("Finish");
	}

}
