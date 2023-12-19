package boot.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@RestController
@CrossOrigin
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@PostMapping("/insert")
	public void insert(@RequestBody MemberDto dto)
	{
		System.out.println("insert>>>"+dto.getEmail());
		memberService.insertMember(dto);
	}
	
	@GetMapping("/idsearch")
	public int idcheck(String id)
	{		
		return memberService.getSearchId(id);
	}
}
