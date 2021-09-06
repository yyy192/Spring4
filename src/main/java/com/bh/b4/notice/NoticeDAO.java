package com.bh.b4.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bh.b4.util.Pager;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.bh.b4.notice.NoticeDAO.";
	
	public List<NoticeDTO> getList(Pager pager) {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public NoticeDTO getSelect(NoticeDTO noticeDTO) {
		return sqlSession.selectOne(NAMESPACE+"getSelect", noticeDTO);
	}
	
	public int setInsert(NoticeDTO noticeDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", noticeDTO);
	}
	
	public int setDelete(NoticeDTO noticeDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete", noticeDTO);
	}
	
	public int setUpdate(NoticeDTO noticeDTO) {
		return sqlSession.update(NAMESPACE+"setUpdate", noticeDTO);
	}

}
