package board.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import answer.data.AnswerDao;
import answer.data.AnswerDto;
import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardContentController {

	@Autowired
	BoardDao dao;
	
	//댓글
	@Autowired
	AnswerDao adao;
	
	@GetMapping("/board/content")
	public ModelAndView content(@RequestParam int num,@RequestParam int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		//조회수 증가
		dao.UpdateReadcount(num);
		//dto
		BoardDto dto=dao.getData(num);
		
		
		
		//댓글
		//num에 해당하는 댓글을 db에서 가져와서 content.jsp로 보낸다
		List<AnswerDto> alist=adao.getAnswerList(num);
		
		//값이 있을때만 넘겨야 하므로 alist.size()(갯수) 저장
		model.addObject("acount", alist.size());
		model.addObject("alist", alist);
		
		
		
		
		
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("reboard/content");
		
		return model;
	}
}
