package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ReboardDto;
import boot.data.service.ReboardService;

@Controller
@RequestMapping("/reboard")
public class ReBoardController {

	@Autowired
	ReboardService service;
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc, //Service에서 Map으로 보낸 searchcolumn을 약자로 표현해주면 value값에 map으로 넘겨준 값을 넣어줘야한다
																			  //값이 없을 경우 null이 넘어오기 때문에 혹시나 하는 에러를 잡아줌
			@RequestParam(value = "searchword",required = false) String sw) //위 주석과 동일
	{
		ModelAndView model=new ModelAndView();
		
		
		
		
		
		//페이징에 필요한 변수
		int totalCount=service.getTotalCount(sc, sw);
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=10; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수




		//총페이지수 구하기
		//총글의 갯수/한페이지당 보여질 개수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각블럭당 보여야할 시작페이지
		//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
		//현재페이지 13  시작:11  끝:15
		startPage=(currentPage-1)/perBlock*perBlock+1;

		endPage=startPage+perBlock-1;

		// 총페이지가 23일경우 마지막블럭은 25가아니라 23이다   
		if(endPage>totalPage)
			endPage=totalPage;

		//각페이지에서 보여질 시작번호
		//1페이지: 0,2페이지:5 3페이지:10....
		startNum=(currentPage-1)*perPage;


		//각 페이지에서 필요한 게시글 가져오기
		List<ReboardDto> list=service.getPagingList(sc, sw, startNum, perPage);



		//각 페이지에 출력할 시작번호
		int no=totalCount-(currentPage-1)*perPage;


		model.addObject("totalCount", totalCount);

		//이곳에서 댓글 사이즈가 들어가기 때문에 따로 추가할 필요 없음
		//애초에 list에서 댓글갯수를 구해서 BoardDto에 넣었기 때문에
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);
		
		
		System.out.println("totalCount="+totalCount);
		
		
		model.setViewName("/reboard/boardlist");
		
		return model;
	}
	
	@GetMapping("/form")
	public String reform(@RequestParam(defaultValue = "0") int num, //아무것도 없을 땐 0, 값이 있을땐 num값 그대로
			@RequestParam(defaultValue = "0") int regroup, //전부 답글일 경우에만 값이 있기 때문에 defaultValue 0을 넣어줌
			@RequestParam(defaultValue = "0") int restep,
			@RequestParam(defaultValue = "0") int relevel,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model) 
	{
		//답글일경우에만 넘어오는 인자값들
		
		//새글일경우는 모두 null이므로 defaultValue만 값으로 전달
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("currentPage", currentPage);
		
		//새글일경우는 "",답글일경우에는 원글 제목 가져오기
		String subject="";
		//답글일 경우
		if(num>0)
		{
			subject=service.getData(num).getSubject();
		}
		
		//새글일 경우...인자값에서 defaultValue가 0으로 되어있다
		model.addAttribute("subject", subject);
		
		return "/reboard/addform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute ReboardDto dto,@RequestParam List<MultipartFile> upload,HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/rephoto");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String uploadName="";
		
		if(upload.get(0).getOriginalFilename().equals(""))
			uploadName=null;
		else
		{
			for(MultipartFile f:upload)
			{
				String ufile=sdf.format(new Date())+"_"+f.getOriginalFilename();
				uploadName+=ufile+",";
				
				try {
					f.transferTo(new File(path+"/"+ufile));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			uploadName=uploadName.substring(0, uploadName.length()-1);
		}
		
		dto.setPhoto(uploadName);
		
		String id=(String)session.getAttribute("myid");
		dto.setId(id);
		
		String name=(String)session.getAttribute("loginname");
		dto.setName(name);
		
		service.insertReboard(dto);
		
		return "/reboard/content";
	}
}