package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {

	@Autowired
	IpgoMapperInter mapper;
	
	@GetMapping("/")
	public String start()
	{
		//이제부터 처음 시작할때는 Tile.xml에 definition name=/*/* *순서대로 1번 2번 적어줘야한다
		//즉 앞으로 경로설정을 /경로/경로 적어줘야한다
		//첫 시작 지점은 약속처럼 /layout/main으로 시작해줘야한다
		return "/layout/main";
	}
	
	@GetMapping("/ipgo/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		List<IpgoDto> list=mapper.getAllIpgoes();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		//model.setViewName("ipgolist"); jsp
		model.setViewName("/ipgo/ipgolist");  //이제부터 tiles 경로로 찾아간다
		
		return model;
	}
	
	@GetMapping("/ipgo/ipgoform")
	public String form()
	{
		return "/ipgo/ipgoform";
	}
	
	@PostMapping("/ipgo/insert")
	public String insert(@ModelAttribute IpgoDto dto,
			@RequestParam ArrayList<MultipartFile> photo,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/upload");
		System.out.println(path);
		
		String uploadName="";
		
		if(photo.get(0).getOriginalFilename().equals(""))
			uploadName="no";
		else
		{
			for(MultipartFile f:photo)
			{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				uploadName+=fName+",";
				
				//실제업로드
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
			
			//photo 마지막 컴마 제거
			uploadName=uploadName.substring(0, uploadName.length()-1);
		}
		
		dto.setPhotoname(uploadName);
		
		mapper.insertIpgo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/ipgo/delete")
	public String delete(String num,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/upload");
		
		String pName=mapper.getDataIpgo(num).getPhotoname();
		
		if(!pName.equals("no"))
		{
			String del []=pName.split(",");
			
			for(int i=0;i<del.length;i++)
			{
				File file=new File(path+"/"+del[i]);
				file.delete();
			}
		}
		
		mapper.deleteIpgo(num);
		
		return "redirect:list";
	}
	
	@GetMapping("/ipgo/updateform")
	public ModelAndView updateform(String num)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("dto", mapper.getDataIpgo(num));
		
		model.setViewName("/ipgo/updateform");
		
		return model;
	}
	
	@PostMapping("/ipgo/update")
	public String update(@ModelAttribute IpgoDto dto,
			@RequestParam ArrayList<MultipartFile> photo,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/upload");
		
		String pName=mapper.getDataIpgo(dto.getNum()).getPhotoname();
		
		String updateName="";
		
		if(!pName.equals("no"))
		{
			String del []=pName.split(",");
			
			for(int i=0;i<del.length;i++)
			{
				File file=new File(path+"/"+del[i]);
				file.delete();
			}
			
			for(MultipartFile f:photo)
			{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				updateName+=fName+",";
				
				//실제업로드
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
			
			updateName=updateName.substring(0, updateName.length()-1);
		}
		
		dto.setPhotoname(updateName);
		
		mapper.updateIpgo(dto);
		
		return "redirect:list";
	}
}
