package com.bh.b4.board.notice;

import java.util.List;

import javax.lang.model.element.ModuleElement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bh.b4.board.BoardDTO;
import com.bh.b4.board.BoardFilesDTO;
import com.bh.b4.board.CommentsDTO;
import com.bh.b4.util.FileDown;
import com.bh.b4.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "notice";
	}
	
	@GetMapping("down")
	public ModelAndView fileDown(BoardFilesDTO boardFilesDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("dto", boardFilesDTO);
		mv.setViewName("fileDown");
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView list(ModelAndView mv, Pager pager) throws Exception {
		List<BoardDTO> ar = noticeService.getList(pager);
		
		//startNum, lastNum .. 도 보내줘야해서 pager도 보내줌
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("insert")
	public ModelAndView insert() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/insert");
		return mv;
	}
	@PostMapping("insert")
	public ModelAndView insert(BoardDTO boardDTO, MultipartFile [] files) throws Exception {
		//oriName 출력해보기
		for(MultipartFile muFile : files) {
				System.out.println(muFile.getOriginalFilename());
		}
		
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setInsert(boardDTO, files);
		
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	//getCommnets
	@GetMapping("getComments")
	public ModelAndView getComments(CommentsDTO commentsDTO, Pager pager) throws Exception {
		//commentsDTO.setBoard("notice");
		List<CommentsDTO> ar = noticeService.getComments(commentsDTO, pager);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pager", pager);
		mv.addObject("comments", ar);
		mv.setViewName("common/ajaxList");
		return mv;
	}
	
	//setComments
	@PostMapping("comments") 
	public ModelAndView comments(CommentsDTO commentsDTO) throws Exception { 
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setComments(commentsDTO);
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		return mv;
	  
	}
	 
	
	@GetMapping("select")
	public ModelAndView select(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		boardDTO = noticeService.getSelect(boardDTO);
		//List<BoardFilesDTO> ar = noticeService.getFiles(boardDTO);
		//mv.addObject("fileList", ar);
		
		//1.
		//List<CommentsDTO> comments = noticeService.getComments();
		//mv.addObject("commentsList", comments); 
		
		//2.comments를 select 다 뿌려지고 난 뒤 ajax실행
		
		//mv.addObject("pager", pager);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/select");
		return mv;
	}
	
	@PostMapping("commentDel")
	public ModelAndView setCommentsDelete(CommentsDTO commentsDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setCommentsDelete(commentsDTO);
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView delete(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setDelete(boardDTO);
		String msg= "삭제가 완료되지 않았습니다.";
		if(result>0) {
			msg = "삭제가 완료되었습니다.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@PostMapping("commentUpdate")
	public ModelAndView setCommentsUpdate(CommentsDTO commentsDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setCommentsUpdate(commentsDTO);
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView update(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		boardDTO = noticeService.getSelect(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/update");
		return mv;
	}
	@PostMapping("update")
	public ModelAndView update(BoardDTO boardDTO, ModelAndView mv) throws Exception {
		
		int result = noticeService.setUpdate(boardDTO);
		
		mv.setViewName("redirect:./list");
		return mv;
	}

}
