package spring.mvc.sh;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	
	//기존 경로 "/"에서 sh/login/form으로 해서 login을 물고 들어가게 하고 싶을 경우
	//return 값에 "redirect:물고싶은 주소/연결할 파일" 해주고 밑에 그 주소로 mapping하는 메소드를 작성 해주면 됨
	//index가 있다면 생략해줘도 됨
	@GetMapping("/")
	public String start()
	{
		return "start";
	}
	
	@GetMapping("/login/form")
	public String form()
	{
		return "form";
	}
	
	//form의 action이 처리되는 곳 / controller에서는 mapping 주소가 명확해야함
	//form에 있는 name을 "@RequestParam(value = "폼에서 받을 값의 name") 자료형 변수명"으로 쓰거나
	//form에 있는 name과 완전히 똑같게 써도 받을 수 있다 ... ex)String myid
	@GetMapping("/login/read")
	public String process(Model model,@RequestParam(value = "myid") String id,
			@RequestParam(value = "mypass") String pass)
	{
		model.addAttribute("id", id);
		String msg="";
		
		if(pass.equals("1234"))
			msg="로그인 성공";
		else
			msg="로그인 실패";
		
		//msg값을 저장해야 출력가능
		model.addAttribute("msg", msg);
		
		return "result";
	}
}
