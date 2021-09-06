package com.bh.b4.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bh.b4.util.Pager;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	public List<NoticeDTO> getList(Pager pager) {
		pager.makeRow();
		pager.makeNum();
		return noticeDAO.getList(pager);
	}
	
	public NoticeDTO getSelect(NoticeDTO noticeDTO) {
		return noticeDAO.getSelect(noticeDTO);
	}
	
	public int setInsert(NoticeDTO noticeDTO) {
		return noticeDAO.setInsert(noticeDTO);
	}
	
	public int setDelete(NoticeDTO noticeDTO) {
		return noticeDAO.setDelete(noticeDTO);
	}
	
	public int setUpdate(NoticeDTO noticeDTO) {
		return noticeDAO.setUpdate(noticeDTO);
	}

}
