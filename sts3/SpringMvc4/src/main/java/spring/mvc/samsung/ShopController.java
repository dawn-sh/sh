package spring.mvc.samsung;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.ShopDto;

@Controller
public class ShopController {

	@GetMapping("/shop/list")
	public String result3()
	{
		return "shop/list";
	}
	
	@GetMapping("/shop/form2")
	public String form2()
	{
		return "shop/shopForm";
	}
	
	@PostMapping("/shop/process2")
	//dto 부를땐 자동완성 / 사용할땐 소문자로
	//("")안에 사용할때 쓸 변수 주면 그걸로 사용 가능
	public String process2(@ModelAttribute("dto") ShopDto dto)
	{
		
		return "shop/shopResult";
	}
	
	@GetMapping("/shop/form3")
	public String fomr3()
	{
		return "shop/mapForm";
	}
	
	@PostMapping("/shop/process3")
	public ModelAndView process3(@RequestParam Map<String, String> map)
	{
		ModelAndView model=new ModelAndView();

		model.addObject("name", map.get("name"));
		model.addObject("java", map.get("java"));
		model.addObject("spring", map.get("spring"));
		model.addObject("jquery", map.get("jquery"));
		
		model.setViewName("shop/mapResult");
		
		return model;
	}
}
