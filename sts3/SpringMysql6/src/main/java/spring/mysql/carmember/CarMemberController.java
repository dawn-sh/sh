package spring.mysql.carmember;

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
public class CarMemberController {

	@Autowired
	CarMemberInter inter;
	
	@GetMapping("/member/list")
	public String memberStart(Model model)
	{
		//갯수 가져오기
		int count=inter.getTotalCount();
		
		List<CarMemberDto> list=inter.getAllList();
		
		//request에 저장
		model.addAttribute("count", count);
		
		model.addAttribute("list", list);
		
		return "carmember/memberlist";
	}
	
	//폼 띄우기
	@GetMapping("/member/addform")
	public String insertForm()
	{
		return "carmember/addform";
	}
	
	//폼값 post로 넘기기
	@PostMapping("/member/add")
	public String insert(@ModelAttribute CarMemberDto dto)
	{
		inter.insertCarmember(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/delete")
	public String delete(String num)
	{
		inter.deleteCarmember(num);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/updateform")
	public String updateform(@RequestParam String num,Model model)
	{
		CarMemberDto dto=inter.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "carmember/updateform";
	}
	
	@PostMapping("/member/update")
	public String update(@ModelAttribute CarMemberDto dto)
	{
		inter.updateCarmember(dto);
		
		return "redirect:list";
	}

	
}
