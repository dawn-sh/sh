package mycar.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView insert(@ModelAttribute MyCarDto dto,
			MultipartFile carupload,
			HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		
		//업로드한 save위치 구하기
		String path=session.getServletContext().getRealPath("/save");
		
		//업로드한 파일 dto얻기
		dto.setCarphoto(carupload.getOriginalFilename());
		
		//실제 업로드
		try {
			carupload.transferTo(new File(path+"/"+carupload.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.insertMyCar(dto);
		
		model.setViewName("redirect:carlist");
		
		return model;
		
		//insert 하고 save 폴더 보면 insert된 사진이 들어가있다 ... 내장 tomcat이기 때문 / 이전에는 외장 tomcat이기 때문에 비어있었음
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
	
	@GetMapping("/car/detail")
	public String detail(@RequestParam Long num,Model model)
	{
		MyCarDto dto=dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "detail";
	}
	
}
