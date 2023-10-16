package spring.mvc.friday;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class InfoController {

	@Autowired
	InfoDao dao;
	
	@GetMapping("/info/list")
	public String list(Model model,
			//첫 화면에 title값이 없기때문에 400번 오류가 떠서 defaultValue로 준다 
			@RequestParam(defaultValue = "name") String title,
			@RequestParam(required = false) String search)
	{
		int count=dao.getTotalCount();
		//List<InfoDto> list=dao.getAllInfoes();
		
		System.out.println(title+","+search);
		
		//Map을 생성해서 값을 넣어주고 dao를 list에 넣어준다
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search);
		map.put("title", title);
		
		List<InfoDto> list=dao.getAllInfoes(map);
	
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return "info/infolist";
	}
	
	@GetMapping("/info/addform")
	public String form()
	{
		return "info/addform";
	}
	
	@PostMapping("/info/insert")
	public String insert(@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			//realPath를 사용하기 위해서
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/resources/image");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		//빈문자열도 들어가는지 테스트하기 위해서 photo변수를 줬다 ... 실제 db에 넣는 값이 빈값
		String photo=""; //밑에 조건문을 주기 위해서는 빈문자열이 편하기 때문에 비워둔것

		//사진선택을 안했을 경우 no...
		if(upload.getOriginalFilename().equals(""))
			photo="no"; //photo=null; -> null로 넣어주고 싶을 경우
		else {
			String fName=upload.getOriginalFilename();
			fName=sdf.format(new Date())+"_"+fName;
			photo=fName;
			
			//실제 업로드
			try {
				upload.transferTo(new File(path+"/"+photo));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//dto의 photo에 업로드한 것들을 넣어줘야한다
		dto.setPhoto(photo);
		
		//마지막으로 insert
		dao.insertMyInfo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/info/uform")
	public String uform(@RequestParam String num,Model model)
	{
		InfoDto dto=dao.getDataInfo(num);
		
		model.addAttribute("dto", dto);
		
		return "/info/updateform";
	}
	
	@PostMapping("/info/update")
	//업데이트 할때 기존 사진을 바꾼다면 기존 사진파일 지우고 새로 업데이트한 사진을 생성하기 위해 @RequestParam String num 추가 
	public String update(@ModelAttribute InfoDto dto,
			@RequestParam String num,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		//해당 num값의 사진파일을 지우기 위해 해당 num의 photo값을 가져와서 변수에 넣어줌
		String photo=dao.getDataInfo(num).getPhoto();
		
		String photoname; //dto에 담을 변수
		
		//사진 선택 안할 경우 null
		if(upload.getOriginalFilename().equals(""))
			photoname=null;
		else
		{
			photoname=upload.getOriginalFilename();
			photoname=sdf.format(new Date())+"_"+photoname;
			
			//실제 업로드
			try {
				upload.transferTo(new File(path+"/"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//파일을 생성하는데 해당경로에 num에 해당하는 사진파일만
			File file=new File(path+"/"+photo);
			//기존 사진 파일 삭제
			file.delete();
		}
		
		//dto의 photo에 업로드한 photoname 넣어주기
		dto.setPhoto(photoname);
		
		//update
		dao.updateMyInfo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/info/delete")
	public String delete(@RequestParam String num,
			//해당 num의 사진파일만 지우기 위해서 필요함...그냥 삭제하면 db에서만 지워지고 사진파일은 남아있기 때문에 같이 지워줘야함
			HttpSession session)
	{
		//해당 num의 정보 중 photo만 가져옴
		String photo=dao.getDataInfo(num).getPhoto();
		
		//photo가 no이면 삭제할 필요가 없음 (업로드한 사진파일이 없기 때문)
		if(!photo.equals("no"))
		{
			String path=session.getServletContext().getRealPath("/resources/image/");
			
			//파일을 생성하는데 해당경로에 num에 해당하는 사진파일만
			File file=new File(path+"/"+photo);
			//그 사진 파일 삭제
			file.delete();
		}
		
		//db삭제
		dao.deleteMyInfo(num);
		
		return "redirect:list";
	}
}