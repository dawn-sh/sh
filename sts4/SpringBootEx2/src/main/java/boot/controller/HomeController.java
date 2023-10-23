package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
									// TestController의 맵핑은 주석처리 해야함
	@GetMapping("/sist/home") // @GetMapping({"/","/sist/home"})... "/"로 가도 home으로 가고 "/sist/home"으로 가도 home으로 가게 설정
	public String home()
	{
		return "home";
	}
}
