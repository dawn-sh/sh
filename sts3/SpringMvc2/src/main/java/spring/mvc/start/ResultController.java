package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {

	//start.jsp에서 apple/list(링크)를 눌러서 보내줬기 때문에 @GetMapping도 apple/list로 보내줘야함
	@GetMapping("/apple/list.do") // "/(루트)"을 기준으로 하기 때문에 맨 앞에 붙여주는 경향이 있음
	//list 뒤에 .do나 다른 확장자를 붙이든 다 호출됨 -> 주소가 같다면 어떤 확장자여도 같은 곳으로 보내짐
	//하지만 Controller에 @GetMapping 주소에 명확하게 확장자까지 적어준다면 그 확장자가 적힌 곳만 제대로 보내줌
	public String result1(Model model)
	{
		model.addAttribute("myname", "최성현");
		model.addAttribute("myaddr", "강남구 역삼동");
		
		//return값으로 포워드할 jsp파일 지정됨
		return "result1";
	}
	
	
	@GetMapping("/banana/insert")
	public ModelAndView banana()
	{
		//ModelAndView는 request에 저장하기 위한 Model과
		//포워드 하기 위한 View를 합쳐놓은 클래스입니다
		//이곳에서 model은 생성 후 사용 가능
		ModelAndView mview=new ModelAndView();
		
		//request에 저장 ... 이곳에서 저장은 addObject(==addAttribute)
		mview.addObject("java", 88);
		mview.addObject("spring", 99);
		
		//포워드할 jsp파일 지정
		mview.setViewName("result2");
		
		return mview;
	}
	
	@GetMapping("/orange/delete")
	public ModelAndView orange()
	{
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("product", "오렌지");
		mview.addObject("price", "5000원");
		mview.addObject("color", "orange");
		
		mview.setViewName("result3");
		
		return mview;
	}
	
	//@GetMapping에 start.jsp에서 설정해준 경로 작성
	@GetMapping("/shop/detail")
	public String resImage()
	{
		return "result4";
	}
	
	
	@GetMapping("/board/insert/data")
	public String webImage()
	{
		return "result5";
	}
}
