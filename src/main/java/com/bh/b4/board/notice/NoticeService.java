package com.bh.b4.board.notice;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.bh.b4.board.BoardDTO;
import com.bh.b4.board.BoardFilesDTO;
import com.bh.b4.board.BoardService;
import com.bh.b4.member.MemberFilesDTO;
import com.bh.b4.util.FileManager;
import com.bh.b4.util.Pager;

@Service
public class NoticeService implements BoardService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public List<BoardFilesDTO> getFiles(BoardDTO boardDTO) throws Exception {
		return noticeDAO.getFiles(boardDTO);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		System.out.println(pager.getKind());
		System.out.println(pager.getSearch());
		
		//totalCount 구하기
		Long totalCount = noticeDAO.getCount(pager);
		
		pager.makeNum(totalCount);	
		pager.makeRow();
		return noticeDAO.getList(pager);
	}

	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		List<BoardFilesDTO> ar = noticeDAO.getFiles(boardDTO);
		
		int result = noticeDAO.setHitsUpdate(boardDTO);
		
		return noticeDAO.getSelect(boardDTO);
	}

	@Override
	public int setInsert(BoardDTO boardDTO, MultipartFile [] files) throws Exception {
		
		//1. 어느 폴더에 저장 /resources/upload/notice/
		String realPath = this.servletContext.getRealPath("/resources/upload/notice/");
		System.out.println("RealPath : "+realPath);
		
		File file = new File(realPath);
		
		System.out.println("Before Num : "+boardDTO.getNum());
		
		int result = noticeDAO.setInsert(boardDTO);
		
		System.out.println("After Num : "+boardDTO.getNum());
		
		for(MultipartFile muFile:files) {
			String fileName = fileManager.fileSave(muFile, file);
			System.out.println("FileName : "+fileName);
			BoardFilesDTO boardFilesDTO = new BoardFilesDTO();
			boardFilesDTO.setFileName(fileName);
			boardFilesDTO.setOriName(muFile.getOriginalFilename());
			boardFilesDTO.setNum(boardDTO.getNum());
			result = noticeDAO.setFile(boardFilesDTO);
			
		}
		
		
		return result; //noticeDAO.setInsert(boardDTO);
	}
	
	
	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		
		String realPath = servletContext.getRealPath("/resources/upload/notice/");
		System.out.println("RealPath : "+realPath);
		
		List<BoardFilesDTO> ar = noticeDAO.getFiles(boardDTO);
		
		if(ar!=null) {
			for(BoardFilesDTO bDTO : ar) {
				String fileName = bDTO.getFileName();
				
				//3. 파일 삭제
				File file = new File(realPath, fileName);
				file.delete();
			}
			
		}
		
		
		return noticeDAO.setDelete(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.setUpdate(boardDTO);
	}

}
