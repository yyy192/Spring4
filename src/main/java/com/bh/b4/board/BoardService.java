package com.bh.b4.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bh.b4.util.FileManager;
import com.bh.b4.util.Pager;

public interface BoardService {
	
	//List
	//abstract 생략 가능 - public void getList() throws Exception;
	public abstract List<BoardDTO> getList(Pager pager) throws Exception;
			
	//상세
	public abstract BoardDTO getSelect(BoardDTO boardDTO) throws Exception;
			
	//글쓰기
	public int setInsert(BoardDTO boardDTO, MultipartFile [] files) throws Exception;
	
	//파일
	public List<BoardFilesDTO> getFiles(BoardDTO boardDTO) throws Exception;
	
	//글삭제
	public int setDelete(BoardDTO boardDTO) throws Exception;
			
	//글수정
	public int setUpdate(BoardDTO boardDTO) throws Exception;

	//댓글리스트
	public List<CommentsDTO> getComments(CommentsDTO commentsDTO, Pager pager) throws Exception;
	
	//댓글작성
	public int setComments(CommentsDTO commentsDTO) throws Exception;
}
