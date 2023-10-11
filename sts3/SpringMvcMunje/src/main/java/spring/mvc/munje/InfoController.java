package spring.mvc.munje;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.InfoDto;

@Controller
public class InfoController {

//	@GetMapping("/info/form")
//	public String form()
//	{
//		return "info/infoForm";
//	}
	
	//dispatcher servlet은 하나의 컨트롤러를 관장하는 것이고
	//그것은 servlet-context.xml에 등록된 패키지 안에 있는 컨트롤러를 찾아가게 해준다
	//servlet-context.xml에 패키지의 마지막 이름이 *라면 그 이름에 해당하는 패키지들은 dispatcher servlet이 찾아갈 수 있는 곳이다
	
	
	
	//위에 메소드와 결과 똑같음
	@GetMapping("/info/form")
	public ModelAndView start()
	{
		ModelAndView model=new ModelAndView();
		
		model.setViewName("info/infoForm");
		
		return model;
	}
	
	@PostMapping("/info/process")
	public String process(@ModelAttribute("dto") InfoDto dto)
	{
		return "info/infoWrite";
	}
}
