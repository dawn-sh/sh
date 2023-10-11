package spring.mvc.tea;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.data.dto.ShopDto;

@Controller
@RequestMapping("/naver")
public class NaverController {

	@GetMapping("/form1")
	public String form1()
	{
		return "day1010/form1";
	}
	
	@PostMapping("/read1")
	public ModelAndView read1(@RequestParam String name,
			@RequestParam String gender,
			@RequestParam String addr)
	{
		ModelAndView model=new ModelAndView();
		
		//모델에 넣어주고
		model.addObject("name", name);
		model.addObject("gender", gender);
		model.addObject("addr", addr);
		
		//포워드
		model.setViewName("day1010/result1");
		
		return model;
	}
	
	@GetMapping("/form2")
	public String form2()
	{
		return "day1010/form2";
	}
	
	//@ModelAttribute: 폼의 데이타를 읽어서 dto에 넣고 model에 저장
	//단 model에는 ShopDto타입일 경우 shopDto 라는 이름으로 저장
	//만약 다른 이름 원하면 @ModelAttribute("이름")
	
	
	@PostMapping("/read2")
	public String read2(@ModelAttribute("dto") ShopDto dto)
	{
		return "day1010/result2";
	}
	
	
	@GetMapping("/form3")
	public String form3()
	{
		return "day1010/form3";
	}
	
	@PostMapping("/read3")
	/* 폼태그의 name 이 key값으로, 입력값은 value값으로... */
	public ModelAndView read3(@RequestParam Map<String, String> map)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("sang", map.get("sang"));
		model.addObject("color", map.get("color"));
		model.addObject("price", map.get("price"));
		model.addObject("image", map.get("image"));
		
		model.setViewName("day1010/result3");
		
		return model;
	}
	
	@GetMapping("/form4")
	public String form4()
	{
		return "upload/uploadForm1";
	}
	
	
	
	//form에서 가져온 @RequestParam MultipartFile photo
	//실제 경로를 구하기 위해 불러온 HttpSession session
	@PostMapping("/upload1")
	public ModelAndView read1(
			@RequestParam String title,
			@RequestParam MultipartFile photo,
			HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		
		//업로드할 실제경로구하기
		String path=session.getServletContext().getRealPath("/WEB-INF/image");
		//어떤 사진이 담길지
		String fileName=photo.getOriginalFilename(); // 업로드된 파일명
		
		
		//현재날짜와 시간 이용해서 파일명에 저장... 이렇게 되면 파일 저장 시간도 나오기때문에 겹칠일이 절대 없다
		SimpleDateFormat sdf=new SimpleDateFormat("yyyymmddHHss");
		
		
		if(!fileName.equals(""))
		{
			//동일한 파일 이름 앞에 실제 올린 시간을 추가해준다... ex)2023101110(분)55(초)
			fileName=sdf.format(new Date())+"_"+fileName;
			
			
			//path에 업로드
			try {
				// 맥은 "/" 윈도우는 "\\"
				photo.transferTo(new File(path+"/"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			fileName="no"; //업로드안할경우 no라고 안하면 나중에 db에 빈 문자열로 들어가기 때문에 no라고 지어줌
		}
		
		model.addObject("fileName", fileName);
		model.addObject("title", title);
		model.addObject("path", path);
		
		model.setViewName("upload/uploadResult1");
		
		return model;
	}
	
	
	//여러개 업로드하는 폼 으로 이동
	@GetMapping("/uploadform5")
	public String form5()
	{
		return "upload/uploadForm2";
	}
	
	//여러개 업로드해서 2번 결과창으로 이동
	//여러개 파일 업로드는 @RequestParam ArrayList<MultipartFile> photo 이렇게 바뀜 
	@PostMapping("/upload2")
	public ModelAndView read2(
			@RequestParam String title,
			@RequestParam ArrayList<MultipartFile> photo,
			HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		
		//업로드할 실제경로구하기
		String path=session.getServletContext().getRealPath("/WEB-INF/image");
		
		//현재날짜와 시간 이용해서 파일명에 저장... 이렇게 되면 파일 저장 시간도 나오기때문에 겹칠일이 절대 없다
		SimpleDateFormat sdf=new SimpleDateFormat("yyyymmddHHss");
		
		//여러 파일을 담을 ArrayList 생성
		ArrayList<String> files=new ArrayList<String>();
		
		//파일명 담기...여러개의 파일이기때문에 for each로 MultipartFile f에 form에서 가져온 photo를 1개씩 여러개 담아줌
		for(MultipartFile f:photo)
		{
			String fileName=sdf.format(new Date())+"_"+f.getOriginalFilename();
			files.add(fileName);
			
			//실제 업로드 transferTo
			try {
				f.transferTo(new File(path+"/"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		model.addObject("files", files);
		model.addObject("title", title);
		model.addObject("path", path);
		
		model.setViewName("upload/uploadResult2");
		
		return model;
	}
	
	
	
	
	
	
	
	
	
}
