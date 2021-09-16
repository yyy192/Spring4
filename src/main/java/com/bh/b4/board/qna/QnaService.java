package com.bh.b4.board.qna;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bh.b4.board.BoardDTO;
import com.bh.b4.board.BoardFilesDTO;
import com.bh.b4.board.BoardService;
import com.bh.b4.util.FileManager;
import com.bh.b4.util.Pager;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		Long totalCount = qnaDAO.getCount(pager);
		
		pager.makeNum(totalCount);	
		pager.makeRow();
		return qnaDAO.getList(pager);
	}

	@Override
	public List<BoardFilesDTO> getFiles(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getFiles(boardDTO);
	}
	
	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {

		int result = qnaDAO.setHitsUpdate(boardDTO);
		
		return qnaDAO.getSelect(boardDTO);
	}

	@Override
	public int setInsert(BoardDTO boardDTO, MultipartFile [] files) throws Exception {
		String realpath = servletContext.getRealPath("/resources/upload/qna");
		System.out.println("RealPath : "+realpath);
		
		File file = new File(realpath);
		
		int result = qnaDAO.setInsert(boardDTO);
		
		for(MultipartFile muFile:files) {
			String fileName = fileManager.fileSave(muFile, file);
			BoardFilesDTO boardFilesDTO = new BoardFilesDTO();
			boardFilesDTO.setFileName(fileName);
			boardFilesDTO.setOriName(muFile.getOriginalFilename());
			boardFilesDTO.setNum(boardDTO.getNum());
			result = qnaDAO.setFile(boardFilesDTO);
		}
		return result; //qnaDAO.setInsert(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		
		String realPath = servletContext.getRealPath("/resources/upload/qna/");
		System.out.println("RealPath : "+realPath);
		
		List<BoardFilesDTO> ar = qnaDAO.getFiles(boardDTO);
		
		if(ar!=null) {
			for(BoardFilesDTO bDTO : ar) {
				String fileName = bDTO.getFileName();
				
				//3. 파일 삭제
				File file = new File(realPath, fileName);
				file.delete();
			}
			
		}
		
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
