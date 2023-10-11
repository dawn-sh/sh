package spring.mvc.samsung;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board") //이렇게 해주면 mapping할 때 중간경로 생략 가능 (1가지만)
// 이렇게 하면 중간경로가 다른 것은 다른 컨트롤러에 만들어줘야한다
public class BoardController {

	@GetMapping("/form1")
	public String form1()
	{
		//servlet-context.xml에서 WEB-INF/(views) / views를 지워줬기 때문에 폴더명 까지 포워드해줘야한다
		return "board/writeForm";
	}
	
	@PostMapping("/process")
	public ModelAndView process1(@RequestParam String name,
			@RequestParam String date,
			@RequestParam String gender,
			/* @RequestParam(defaultValue = "행복한 하루 보내세요") String msg 
			 * required = false...required는 true가 기본값 / 항목이 없어도 에러가 안나게 하려면 false
			 * (required = false가 없다면 에러) */
			@RequestParam(required = false) String msg,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", name);
		model.addObject("date", date);
		model.addObject("gender", gender);
		model.addObject("msg", msg);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("board/result");
		
		return model;
	}
	
	@GetMapping("/result2")
	public String result2(Model model)
	{
		model.addAttribute("myimg1", "../image/12.jpeg");
		model.addAttribute("title", "좋아하는 아이콘");
		
		return "board/result2";
	}
}
