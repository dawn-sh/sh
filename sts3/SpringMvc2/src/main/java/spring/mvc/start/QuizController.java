package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuizController {

	@GetMapping("/happy")
	public String resImage()
	{
		return "quiz1";
	}
	
	
	@GetMapping("/hello")
	public ModelAndView hellomsg()
	{
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("msg", "msg값을 넘겨줍니다");
		
		mview.setViewName("quiz2");
		
		return mview;
	}
	
	@GetMapping("/nice/hi")
	public String myInfo(Model model)
	{
		model.addAttribute("name", "최성현");
		model.addAttribute("age", 29);
		model.addAttribute("addr", "경기도 수원시");
		
		return "quiz3";
	}
}
