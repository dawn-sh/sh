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
	
	//delete
	//Controller을 통해서 가는 것이기 때문에 redirect:list로 위에 있는 kakao/list mapping으로 가게 되는 것이다
	@GetMapping("/kakao/delete")
	public String delete(String num)
	{
		dao.deleteCar(num);
		
		return "redirect:list";
	}
	
	
	//업데이트 폼을 띄우는 것이기 때문에 @GetMapping
	@GetMapping("/kakao/updateform")
	// MyCarDto dto=dao.getData(num);은 생성만 해주기 때문에 저장하기 위해(넘겨주기 위해) Model을 인자값으로 하나 더 넣어줌
	public String uform(@RequestParam String num,Model model)
	{
		MyCarDto dto=dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "car/updateform";
	}
	
	@PostMapping("/kakao/update")
	public String update(@ModelAttribute MyCarDto dto)
	{
		dao.updateCar(dto);
		
		return "redirect:list";
	}
}
