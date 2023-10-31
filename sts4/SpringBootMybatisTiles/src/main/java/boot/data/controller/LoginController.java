package boot.data.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	@GetMapping("/login/main")
	public String loginform(HttpSession session,Model model) //logout폼에 이름 저장해서 넘겨야하기 때문
	{
		//폼의 아이디 얻기
		//밑에 loginproc에서 session으로 넘겨준 myid값
		String myid=(String)session.getAttribute("myid");
		
		//로그인 상태인지 아닌지 확인
		String loginok=(String)session.getAttribute("loginok");
		
		//한번도 실행안하면 null
		if(loginok==null)
			return "/login/loginform";
		else
		{
			//로그인중이면 request(model)에 name저장
			String name=service.getName(myid);
			model.addAttribute("name", name);
			
			//Tiles.xml에 의한 포워드
			return "/login/logoutform";
		}
	}
	
	//login process
	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam(required = false) String cbsave, // cbsave에 준 것이 없고 저장안하고 넘기면 null값이 넘어간다면서 에러가 뜬다 그러므로 required = false 추가
			HttpSession session)
	{
		HashMap<String, String> map=new HashMap<>();
		int check=service.loginPassCheck(id, pass);
		
		//로그인시 아이디,비밀번호가 맞다면
		if(check==1)
		{
			session.setMaxInactiveInterval(60*60*8); //세션만료시간
			
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes"); //로그인 키값 값은 의미 없음
			session.setAttribute("saveok", cbsave);
			
			//선택사항
			//id에 의한 dto데이터들을 가져와서 저장
			MemberDto mdto=service.getDataById(id);
			
			//사진 저장해서 로그인시 main leftside쪽 사진을 변경
			//자주 사용할 거라고 생각될때 그 값들을 넘겨주면 편하다
			//보통 dto를 다 넘기지 안고 필요한 값만 뽑아서 넘김
			session.setAttribute("loginphoto", mdto.getPhoto());
			
			return "redirect:main";
		}
		else
		{
			//Tiles 포워드 경로
			return "/member/passfail";
		}
	}
	
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		
		return "redirect:main";
	}
}
