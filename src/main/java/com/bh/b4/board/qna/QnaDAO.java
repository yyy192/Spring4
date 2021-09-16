package com.bh.b4.board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bh.b4.board.BoardDAO;
import com.bh.b4.board.BoardDTO;
import com.bh.b4.board.BoardFilesDTO;
import com.bh.b4.util.Pager;

@Repository
public class QnaDAO implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.bh.b4.board.qna.QnaDAO.";
	
	@Override
	public Long getCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}

	@Override
	public List<BoardFilesDTO> getFiles(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getFiles", boardDTO);
	}
	
	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getSelect", boardDTO);
	}
	
	@Override
	public int setHitsUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setHitsUpdate", boardDTO);
	}

	@Override
	public int setFile(BoardFilesDTO boardFilesDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setFile", boardFilesDTO);
	}
	
	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setInsert", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setDelete", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}
	
	//답글
	public int setReply(QnaDTO qnaDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setReply", qnaDTO);
	}
	
	public int setReplyUpdate(QnaDTO qnaDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setReplyUpdate", qnaDTO);
	}

}
