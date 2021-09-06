package com.bh.b4.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		return "qna";
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
	
	@GetMapping("select")
	public ModelAndView select(BoardDTO boardDTO, ModelAndView mv) throws Exception {
		boardDTO = qnaService.getSelect(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/select");
		return mv;
		
	}
}
