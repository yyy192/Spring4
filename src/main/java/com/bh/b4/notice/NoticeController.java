package com.bh.b4.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bh.b4.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list")
	public ModelAndView list(ModelAndView mv, Pager pager) {
		List<NoticeDTO> ar = noticeService.getList(pager);
		
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		return mv;
	}
	
	@RequestMapping("select")
	public ModelAndView select(NoticeDTO noticeDTO, ModelAndView mv) {
		noticeDTO = noticeService.getSelect(noticeDTO);
		
		mv.addObject("dto", noticeDTO);
		mv.setViewName("board/select");
		return mv;
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public ModelAndView insert(ModelAndView mv) {
		mv.setViewName("board/insert");
		return mv;
	}
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(NoticeDTO noticeDTO) {
		int result = noticeService.setInsert(noticeDTO);
		
		return "redirect:./list";
	}
	
	@RequestMapping("delete")
	public String delete(NoticeDTO noticeDTO) {
		int result = noticeService.setDelete(noticeDTO);
		
		return "redirect:./list";
	}
	
	@RequestMapping(value = "update", method=RequestMethod.GET)
	public ModelAndView update(NoticeDTO noticeDTO) {
		noticeDTO = noticeService.getSelect(noticeDTO);
		 
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", noticeDTO);
		mv.setViewName("board/update");
		
		return mv;
	}
	
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public ModelAndView update(NoticeDTO noticeDTO, ModelAndView mv) {
		int result = noticeService.setUpdate(noticeDTO);
		
		mv.setViewName("redirect:./list");
		return mv;
	}

}
