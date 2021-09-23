package com.bh.b4.board;

import java.util.List;
import java.util.Map;

import com.bh.b4.util.Pager;

public interface BoardDAO {
	
		//전체 개수
		public Long getCount(Pager pager) throws Exception;

		//List
		//abstract 생략 가능 - public void getList() throws Exception;
		public abstract List<BoardDTO> getList(Pager pager) throws Exception;
		
		//상세
		public abstract BoardDTO getSelect(BoardDTO boardDTO) throws Exception;
		
		//조회수 Update
		public int setHitsUpdate(BoardDTO boardDTO) throws Exception;
		
		//글쓰기
		public int setInsert(BoardDTO boardDTO) throws Exception;
		
		//파일
		public int setFile(BoardFilesDTO boardFilesDTO) throws Exception;
		
		public List<BoardFilesDTO> getFiles(BoardDTO boardDTO) throws Exception;
		
		//글삭제
		public int setDelete(BoardDTO boardDTO) throws Exception;
		
		//글수정
		public int setUpdate(BoardDTO boardDTO) throws Exception;
		
		//댓글리스트
		public List<CommentsDTO> getComments(Map<String, Object> map) throws Exception;
		
		//댓글 총 개수
		public Long getCommentsCount(CommentsDTO commentsDTO) throws Exception;
		//댓글작성
		public int setComments(CommentsDTO commentsDTO) throws Exception;
}
