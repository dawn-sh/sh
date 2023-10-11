package spring.mvc.quiz;

import java.util.Map;

import javax.annotation.processing.Generated;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.FormDto;

@Controller
public class QuizController {

	@GetMapping("/ilike/movie")
	public String read1()
	{
		return "read1";
	}
	
	@GetMapping("/ilike/movie/result1")
	public ModelAndView result1(@RequestParam(value = "movie") String mname)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("movie", mname);
		
		model.setViewName("result1");
		
		return model;
	}
	
	
	//폼으로 보내는 것은 폼을 보여주기 위해 넘어가는 것이기 때문에 GetMapping으로 보내줘야한다
	@GetMapping("/school/myinfo")
	public String read2()
	{
		return "read2";
	}
	
	@GetMapping("/school/myinfo/result2")
	public ModelAndView result2(String name, String school, String grade, String schoolAddr)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", name);
		model.addObject("school", school);
		model.addObject("grade", grade);
		model.addObject("schoolAddr", schoolAddr);
		
		model.setViewName("result2");
		
		return model;
	}
	
	@GetMapping("/shop/ipgo")
	public String read3()
	{
		return "read3";
	}
	
	@PostMapping("/shop/ipgo/ipgoresult")
	public ModelAndView result3(@ModelAttribute FormDto dto)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("dto", dto);
		
		model.setViewName("result3");
		
		return model;
	}
	
	@GetMapping("/myshinsang")
	public String read4()
	{
		return "read4";
	}
	
	@PostMapping("/info")
	public ModelAndView result4(@RequestParam Map<String,String> map)
	{
		ModelAndView model=new ModelAndView();
		
		String myname=map.get("myname");
		String myage=map.get("myage");
		String myBlood=map.get("myBlood");
		String myAddr=map.get("myAddr");
		
		String myinfo="제 이름은 "+myname+"이고\n나이는 "+myage+"이고\n혈액형은 "+myBlood+"형이고\n주소는 "+myAddr+"입니다";
		
		model.addObject("myinfo", myinfo);
		
		model.setViewName("result4");
		
		return model;
	}
}
