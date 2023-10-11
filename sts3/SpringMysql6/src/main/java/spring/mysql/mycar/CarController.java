package spring.mysql.mycar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarController {

	//sql을 mybatis에 등록하고 이걸 dao에 가져와서 품고 있기 때문에 dao를 @Autowired 해줘야한다 
	@Autowired
	MyCarDao dao;
	
	@GetMapping("/kakao/list")
	public String list(Model model)
	{
		//dao로부터 총 갯수 가져오기
		int totalCount=dao.getTotalCount();
		
		//목록 가져오기
		List<MyCarDto> list=dao.getAllCars();
		
		
		
		//request에 저장
		model.addAttribute("totalCount", totalCount);
		
		//request에 목록 저장
		model.addAttribute("list", list);
		
		return "car/carlist";
	}
	
	@GetMapping("/kakao/writeform")
	public String writeform()
	{
		return "car/writeform";
	}
	
	
	//insert
	@PostMapping("/kakao/write")
	public String insert(@ModelAttribute MyCarDto dto)
	{
		dao.insertCar(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/kakao/delete")
	public String delete(String num)
	{
		dao.deleteCar(num);
		
		return "redirect:list";
	}
}
