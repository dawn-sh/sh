package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;
import data.model.service.MarketService;

@Controller
public class MarketController {

//	@Autowired
//	MarketMapperInter mapper;
	
	@Autowired
	MarketService service; //MarketService를 받아와서 사용하면 된다 / mapper를 보완해서 service를 만들었기 때문
	
	@GetMapping("/")
	public String start()
	{
		return "redirect:market/list";
	}
	
	@GetMapping("/market/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		//db로부터 총 갯수 얻기
		int totalCount=service.getTotalCount();
		List<MarketDto> list=service.getAllSangpums();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		model.setViewName("market/marketlist");
		
		return model;
	}
	
	@GetMapping("/market/writeform")
	public String writeform()
	{
		return "market/addform";
	}
	
	@PostMapping("/market/add")
	public String add(@ModelAttribute MarketDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/save");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(upload.getOriginalFilename().equals(""))
			dto.setPhotoname(null);
		else {
			String fName=sdf.format(new Date())+upload.getOriginalFilename();
			dto.setPhotoname(fName);
			
			try {
				upload.transferTo(new File(path+"/"+fName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		service.insertMarket(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num,
			HttpServletRequest request)
	{
		String photo=service.getData(num).getPhotoname();
		
		if(photo!=null)
		{
			String path=request.getServletContext().getRealPath("/save");
			
			File file=new File(path+"/"+photo);
			file.delete();
		}
		
		service.deleteMarket(num);
		
		return "redirect:list";
	}
}
