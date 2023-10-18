package answer.data;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnswerController {
	
	@Autowired
	AnswerDao adao;
	
	@PostMapping("/board/ainsert") // 중간경로 전부 board로 해줘서 db가 바뀌어도 board가 중간경로
	public ModelAndView answerinsert(@ModelAttribute AnswerDto dto,
			@RequestParam String currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		//db추가
		adao.insertAnswer(dto);
		
		model.setViewName("redirect:content?num="+dto.getNum()+"&currentPage="+currentPage);
		
		return model;
	}
	
	//list출력은 BoardContentController에서 한다
}
