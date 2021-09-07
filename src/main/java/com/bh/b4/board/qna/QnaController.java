package com.bh.b4.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bh.b4.board.BoardDTO;
import com.bh.b4.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "Qna";
	}
	
	@GetMapping("list")
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		
		List<BoardDTO> ar = qnaService.getList(pager);
		
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		return mv;
	}
	
	@GetMapping("insert")
	public ModelAndView insert() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/insert");
		return mv;
	}
	@PostMapping("insert")
	public ModelAndView insert(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setInsert(boardDTO);
		
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	
	@GetMapping("reply")
	public ModelAndView setReply() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/reply");
		return mv;
	}
	@PostMapping("reply")
	public ModelAndView setReply(QnaDTO qnaDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setReply(qnaDTO);
		
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	
	
	@GetMapping("select")
	public ModelAndView select(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		boardDTO = qnaService.getSelect(boardDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/select");
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView delete(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setDelete(boardDTO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView update(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		boardDTO = qnaService.getSelect(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/update");
		return mv;
	}
	@PostMapping("update")
	public ModelAndView update(BoardDTO boardDTO, ModelAndView mv) throws Exception {
		
		int result = qnaService.setUpdate(boardDTO);
		
		mv.setViewName("redirect:./list");
		return mv;
	}

	
}
