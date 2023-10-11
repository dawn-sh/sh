package spring.mvc.sh;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.FormDto;

@Controller
public class FormController {

	//myforms가 나오게 포워드할것!!
	@GetMapping("/data/myform")
	public String myform()
	{
		return "myforms";
	}
	
	//read1_get방식 폼 전송
	//Spring에서는 폼에서 받아온 자료형을 형변환 거치지 않고 바로 변경해서 받을 수 있다
	//ex)int myage/form에서 받아온 값은 String 기본
	//form에서 안받은 값도 따로 값을 저장 하고 싶다면
	//"@RequestParam(value = "변수명",defaultValue = "저장할 값") 자료형 변수명" 으로 사용해주면 된다
	@GetMapping("/data/read1")
	public ModelAndView read1(@RequestParam(value = "myname") String name,int myage,
			@RequestParam(value = "msg",defaultValue = "HappyDay!!!!") String msg)
	{
		ModelAndView mview=new ModelAndView();
		
		//request에 저장
		mview.addObject("name", name);
		mview.addObject("age", myage);
		mview.addObject("msg", msg);
		
		//포워드
		mview.setViewName("process1");
		
		return mview;
	}
	
	
	//dto에서 값을 받아올 때 @ModelAttribute dto클래스명 변수명으로 받아오면 된다
	//나중에 사용할때 dto에서 설정한 변수명과 똑같이 써야한다
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute FormDto dto)
	{
		ModelAndView model=new ModelAndView();
		
		//dto안에 있는 것들 한번에 다 저장 가능
		model.addObject("dto", dto);
		
		model.setViewName("process2");
		
		return model;
	}
	
	//form에서 입력한 값을 map으로 읽는 방식
	//인자에서 "@RequestParam Map<String, String> map" 해준 것은
	//String 변수에 map.get(스트링값(name))이기 때문에 해준 것
	@PostMapping("/data/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map)
	{
		ModelAndView model=new ModelAndView();
		
		//form에 있는 name값을 받아와서 변수에 저장해줌
		String sang=map.get("sang");
		String price=map.get("price");
		
		//변수에 저장한 값들을 하나의 변수로 모아준다
		String data=sang+"의 가격은"+price+"입니다";
		
		model.addObject("data", data);
		
		model.setViewName("process3");
		
		return model;
	}
}
