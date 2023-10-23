package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyCarController {

	@Autowired
	MyCarDao dao;
	
	@GetMapping("/car/carlist") //시작..
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		List<MyCarDto> list=dao.getAllDataes();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("carlist");
		
		return model;
	}
	
	@GetMapping("/car/carform")
	public String form()
	{
		return "addform";
	}
	
	@PostMapping("/car/insert")
	public ModelAndView insert(@ModelAttribute MyCarDto dto)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("dto", dto);
		
		dao.insertMyCar(dto);
		
		model.setViewName("redirect:carlist");
		
		return model;
	}
	
	@GetMapping("/car/updateform")
	public String updateform(@RequestParam Long num,Model model)
	{
		MyCarDto dto=dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "uform";
	}
	
	@PostMapping("/car/update")
	public ModelAndView update(@ModelAttribute MyCarDto dto)
	{
		ModelAndView model=new ModelAndView();
		
		dao.updateMyCar(dto);
		
		model.setViewName("redirect:carlist");
		
		return model;
	}
	
	@GetMapping("/car/delete")
	public String delete(@RequestParam Long num)
	{
		dao.delete(num);
		
		return "redirect:carlist";
	}
	
}
