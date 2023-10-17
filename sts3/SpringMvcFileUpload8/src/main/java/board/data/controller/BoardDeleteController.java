package board.data.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardDeleteController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/deletepassform")
	public ModelAndView delpassform(@RequestParam String num,
			@RequestParam String currentPage)
	{
		ModelAndView model= new ModelAndView();
		
		model.addObject("num", num);
		model.addObject("currentPage", currentPage);		
		
		model.setViewName("reboard/delpassform");
		
		return model;
	}
	
	@PostMapping("/board/delpass")
	public ModelAndView delpass(@RequestParam int num,
			@RequestParam int pass,
			@RequestParam String currentPage,
			HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		
		int check=dao.getCheckPass(num, pass);
		
		if(check==1)
		{
			//해당 num의 정보 중 photo만 가져옴
			String photo=dao.getData(num).getPhoto();
			
			//photo가 no이면 삭제할 필요가 없음 (업로드한 사진파일이 없기 때문)
			if(!photo.equals("no"))
			{
				String path=session.getServletContext().getRealPath("/WEB-INF/photo/");
				
				String del[]=photo.split(",");
				
				for(int i=0;i<del.length;i++)
				{
					//파일을 생성하는데 해당경로에 num에 해당하는 사진파일만
					File file=new File(path+"/"+del[i]);
					//기존 사진 파일 삭제
					file.delete();
				}
			}
			
			dao.deleteReboard(num);
			
			model.setViewName("redirect:list?currentPage="+currentPage);
		}
		else {
			model.setViewName("reboard/passfail");
		}
		return model;
	}
}
