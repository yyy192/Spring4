package com.bh.b4.notice;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bh.b4.MyJunitTest;
import com.bh.b4.util.Pager;

public class NoticeDAOTest extends MyJunitTest {

	@Autowired
	private NoticeDAO noticeDAO;
	
	//@Test
	public void getListTest(Pager pager) {
		pager.makeRow();
		pager.makeNum();
		List<NoticeDTO> ar = noticeDAO.getList(pager);
		assertNotEquals(0, ar.size());
	}
	
	//@Test
	public void getSelectTest() {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNum(1L);
		
		noticeDTO = noticeDAO.getSelect(noticeDTO);
		assertNotNull(noticeDTO);
	}
	
	@Test
	public void setInsertTest() throws Exception {
		for(int i=0;i<200;i++) {
					
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setTitle("Title"+i);
			noticeDTO.setContents("Contents"+i);
			noticeDTO.setWriter("Writer"+i);
					
			int result = noticeDAO.setInsert(noticeDTO);
					
			if(i%10==0) {
						Thread.sleep(500);
			}
					
		}
				
	System.out.println("======== FINISH ========");
	}
	
	//@Test
	public void setDeleteTest() {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNum(22L);
		
		int result = noticeDAO.setDelete(noticeDTO);
		assertNotEquals(0, result);
	}
	

}
