package board.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
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
public class BoardWriteController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/writeform")
	public ModelAndView writeform(@RequestParam Map<String, String> map)
	{
		ModelAndView model=new ModelAndView();
		
		//밑 5개는 답글일 경우에만 넘어온다 (새 글일 경우 안넘어옴)
		String currentPage=map.get("currentPage");
		String num=map.get("num");
		String regroup=map.get("regroup");
		String restep=map.get("restep");
		String relevel=map.get("relevel");
		
		
		//새글이라면 Null 답글이라면 숫자
		System.out.println(currentPage+","+num);
		
		//입력폼에 hidden으로 넣어줘야함...답글일때 대비
		model.addObject("currentPage", currentPage==null?"1":"currentPage"); //1페이지일경우:n번째페이지일 경우
		model.addObject("num", num==null?"0":num); //0이어야 dao에서 새글로 인식 가능
		model.addObject("regroup", regroup==null?"0":regroup);
		model.addObject("restep", restep==null?"0":restep);
		model.addObject("relevel", relevel==null?"0":relevel);
		
		//0으로 넣어야 dao에서 새 글로 인식
		//폼이 답글,새글 공용이므로
		
		model.setViewName("reboard/writeform");
		
		return model;
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam ArrayList<MultipartFile> uimage,
			HttpSession session)
	{
		//실제경로
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo="";

		//0번지 사진을 항상 우선 하기 때문에 get(0)...uimage는 배열이기 때문에 0번지가 빈 문자열이면 사진이 없을 경우라는 뜻
		if(uimage.get(0).getOriginalFilename().equals(""))
			photo="no";
		else {
			
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
		
		//insert
		dao.insertReboard(dto);
		
		return "redirect:list"; //content 일단 없으니까 목록으로
	}
}
