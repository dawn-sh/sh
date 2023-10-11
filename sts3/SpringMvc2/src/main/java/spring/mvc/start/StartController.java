package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

//Controller 역할하는 곳은 @Controller 사용 
@Controller
public class StartController {

	//start.jsp로 가기 위한 메서드 작성(==포워드)
	//단순히 포워드만 하기 위해서는 return 값이 .jsp파일 -> String으로 반환해야함
	//하나하나 마다 Mapping주소 작성...버전 5부터 @RequestMapping 대신 @GetMapping @PostMapping이 있다
	//("시작하자마자 보여줄 곳") ... "/(루트)"는 시작값
	//Run as 할때 프로젝트에서 해야 잘 실행됨
	//String은 포워드 역할만 가능 / Session이면 Session을 넣으면 됨
	@GetMapping("/")
	//String은 포워드만 할 수 있기 때문에 저장하고 싶을 때 model을 불러서 저장 가능
	public String start(Model model)
	{
		//Model: request에 데이터를 저장하기 위한 인터페이스
		//서블릿에서 하던 request.setAttribute와 같다
		model.addAttribute("name", "김영환");
		model.addAttribute("addr", "서울시 강남구");
		return "start"; //WEB-INF/day1005/start.jsp를 의미
	}
	
}
