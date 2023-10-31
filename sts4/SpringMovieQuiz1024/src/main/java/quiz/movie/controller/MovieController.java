package quiz.movie.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import quiz.movie.dto.MovieDto;
import quiz.movie.inter.MovieDao;

@Controller
public class MovieController {

	@Autowired
	MovieDao dao;
	
	@GetMapping("/movie/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		List<MovieDto> list=dao.getAllDataes();
		
		model.addObject("list", list);
		
		model.setViewName("movie/movielist");
		
		return model;
	}
	
	@GetMapping("/movie/writeform")
	public String addform()
	{
		return "movie/addform";
	}
	
	@PostMapping("/movie/insert")
	public String add(@ModelAttribute MovieDto dto,
			MultipartFile photo,
			HttpServletRequest request)
	{
		String path=request.getServletContext().getRealPath("/moviephoto");
		
		dto.setPoster(photo.getOriginalFilename());
		
		try {
			photo.transferTo(new File(path+"/"+photo.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dao.insert(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/movie/detail")
	public ModelAndView detail(@ModelAttribute MovieDto dto, Long num)
	{
		ModelAndView model=new ModelAndView();
		
		dto=dao.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("movie/detail");
		
		return model;
	}
}
