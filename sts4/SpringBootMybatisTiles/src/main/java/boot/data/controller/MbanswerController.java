package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MbanswerDto;
import boot.data.mapper.MbanswerMapperInter;
import boot.data.service.MemberService;

@RestController
@RequestMapping("/mbanswer")
public class MbanswerController {

	@Autowired
	MbanswerMapperInter mapper;
	
	@Autowired
	MemberService mservice;
	
	@PostMapping("/ainsert")
	public void insert(@ModelAttribute MbanswerDto dto,HttpSession session)
	{
		String myid=(String)session.getAttribute("myid");
		String name=mservice.getName(myid);
		
		dto.setMyid(myid);
		dto.setName(name);
		
		mapper.insertMbanswer(dto);
	}
	
	@GetMapping("/alist")
	public List<MbanswerDto> alist(String num)
	{
		//http://localhost:9001/mbanswer/alist?num=13로 조회해보면 json형태로 나온다
		return mapper.getAllAnswers(num);
	}
	
	@GetMapping("/delete")
	public void delete(String idx)
	{
		System.out.println(idx);
		mapper.deleteAnswer(idx);
	}
	
	//수정창 content 띄우기
	@GetMapping("/adata")
	public MbanswerDto getData(String idx)
	{
		return mapper.getAnswer(idx);
	}
	
	
	//수정
	@PostMapping("/aupdate")
	public void aupdate(@ModelAttribute MbanswerDto dto)
	{
		mapper.updateMbanswer(dto);
	}
	
}
