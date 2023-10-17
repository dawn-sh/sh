package board.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardUpdateController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/updatepassform")
	public ModelAndView upassform(@RequestParam String num,
			@RequestParam String currentPage)
	{
		ModelAndView model= new ModelAndView();
		
		model.addObject("num", num);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("reboard/updatepassform");
		
		return model;
	}
	
	@PostMapping("/board/updatepass")
	public ModelAndView updatepass(@RequestParam int num,@RequestParam int currentPage,@RequestParam int pass)
	{
		ModelAndView model=new ModelAndView();
		
		//비번이 맞으면 수정폼으로, 틀린 경우는 passfail로 이동
		
		int check=dao.getCheckPass(num, pass);
		
		if(check==1)
		{
			//비번이 맞으면 dto얻는다(수정폼으로 가기 위해서)
			BoardDto dto=dao.getData(num);
			
			model.addObject("currentPage", currentPage);
			model.addObject("dto", dto);
			
			model.setViewName("reboard/updateform");
		}
		else //0
			model.setViewName("reboard/passfail");
		
		return model;
	}
	
	@PostMapping("/board/update")
	public String update(@ModelAttribute BoardDto dto,
			@RequestParam int num,
			@RequestParam String currentPage,
			@RequestParam ArrayList<MultipartFile> uimage,
			HttpSession session)
	{
		//실제경로
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
		
		String prephoto=dao.getData(num).getPhoto();
				
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				
		String photo="";

		//0번지 사진을 항상 우선 하기 때문에 get(0)...uimage는 배열이기 때문에 0번지가 빈 문자열이면 사진이 없을 경우라는 뜻
		if(uimage.get(0).getOriginalFilename().equals(""))
			photo="no";
		else {
			
			if(!photo.equals("no"))
			{
				String del[]=prephoto.split(",");
				
				for(int i=0;i<del.length;i++)
				{
					//파일을 생성하는데 해당경로에 num에 해당하는 사진파일만
					File file=new File(path+"/"+del[i]);
					//기존 사진 파일 삭제
					file.delete();
				}
			}
			
					
				for(MultipartFile f:uimage)
				{
					String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
					photo+=fName+",";
							
					try {
						f.transferTo(new File(path+"/"+fName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			//for문 안 photo에서 마지막 , 제거(길이 제일 마지막에 , 있음)
			photo=photo.substring(0, photo.length()-1);
		}
				
		//dto의 photo에 넣기
		dto.setPhoto(photo);
				
		//update
		dao.updateReboard(dto);
				
		//currentPage와 num값을 가져와서 넘겨주기 위해 맵핑주소에 넣어준다
		return "redirect:content?currentPage="+currentPage+"&num="+num; //content 일단 없으니까 목록으로		
	}
}
