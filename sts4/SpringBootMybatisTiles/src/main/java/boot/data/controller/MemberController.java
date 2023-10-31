package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/myinfo")
	public ModelAndView info()
	{
		ModelAndView model=new ModelAndView();
		
		List<MemberDto> list=service.getAllMembers();
		
		model.addObject("list", list);
		
		model.setViewName("/member/myinfo");
		
		return model;
	}
	
	@GetMapping("/member/list")
	public ModelAndView memberList()
	{
		ModelAndView model=new ModelAndView();
		
		List<MemberDto> list=service.getAllMembers();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("/member/memberlist");
		
		return model;
	}
	
	@GetMapping("/member/form")
	public String form()
	{
		return "/member/addform";
	}
	
	//아이디 체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheck(String id)
	{
		Map<String, Integer> map=new HashMap<>();
		
		int check=service.getSearchId(id);
		
		map.put("check",check); // 0 or 1
		
		return map;
	}
	
	//insert (list로 가는데 admin이 아니면 gaipsuccess로 이동할 예정)
	@PostMapping("/member/insert")
	public String memberSave(@ModelAttribute MemberDto dto,
			MultipartFile myphoto,
			HttpServletRequest request)
	{
		String path=request.getServletContext().getRealPath("/memberphoto");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String pho=sdf.format(new Date())+"_"+myphoto.getOriginalFilename();
		dto.setPhoto(pho);
		
		try {
			myphoto.transferTo(new File(path+"/"+pho));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		service.insertMember(dto);
		
		return "redirect:list";
	}
	
	//삭제는 ajax
	@GetMapping("/member/delete")
	@ResponseBody //json으로 넘길 값은 없지만 ajax 실행을 위해 @ResponseBody를 주어야한다 
	public void delete(@RequestParam String num,HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/memberphoto");
		String photo=service.getDataByNum(num).getPhoto();
		File file=new File(path+"/"+photo);
		file.delete();
		
		service.deleteMember(num);
	}
	
	//사진만 수정
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void updatephoto(@RequestParam String num,
			MultipartFile photo,
			HttpSession session,
			@ModelAttribute MemberDto dto)
	{
		//업로드할 경로
		String path=session.getServletContext().getRealPath("/memberphoto");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+"_"+photo.getOriginalFilename();
		String prephoto=service.getDataByNum(num).getPhoto();
		File file=new File(path+"/"+prephoto);
		file.delete();
		
		//업로드
		try {
			photo.transferTo(new File(path+"/"+fileName));
			
			service.updatePhoto(num, fileName); //db 사진 수정
			
			//세션사진 수정
			session.setAttribute("loginphoto", fileName);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	//나의 정보 삭제
	//탈퇴이기 때문에 모든 세션 삭제
	@GetMapping("/member/deleteme")
	@ResponseBody
	public void deleteinfo(String num,HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/memberphoto");
		String photo=service.getDataByNum(num).getPhoto();
		File file=new File(path+"/"+photo);
		file.delete();
		
		service.deleteMember(num);
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.removeAttribute("saveok");
		session.removeAttribute("loginphoto");
	}
}
