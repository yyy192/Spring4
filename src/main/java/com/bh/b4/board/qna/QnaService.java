package com.bh.b4.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bh.b4.board.BoardDTO;
import com.bh.b4.board.BoardService;
import com.bh.b4.util.Pager;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		Long totalCount = qnaDAO.getCount(pager);
		
		pager.makeNum(totalCount);	
		pager.makeRow();
		return qnaDAO.getList(pager);
	}

	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getSelect(boardDTO);
	}

	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setInsert(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setDelete(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setUpdate(boardDTO);
	}
	
	public int setReply(QnaDTO qnaDTO) throws Exception {
	
		//1. 부모의 정보 조회
		QnaDTO parent = (QnaDTO)qnaDAO.getSelect(qnaDTO);
		qnaDTO.setRef(parent.getRef());
		qnaDTO.setStep(parent.getStep()+1);
		qnaDTO.setDepth(parent.getDepth()+1);
		
		//2. update
		int result = qnaDAO.setReplyUpdate(parent);
		
		//3. insert
		
		result = qnaDAO.setReply(qnaDTO);
		
		return result;
	}

}
