package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.ShopDto;
import boot.data.service.ShopService;
import jakarta.servlet.http.HttpServletRequest;

//react와 연결하기 때문에 @RestController 사
@RestController
//서로 다른 도메인을 연결해주는 어노테이션
//vscode에 설치한 axios로 Promise기반의 Api형식이 다양하게 제공이되어 별도의 로직을 구현할 필요없이 API만으로 간편하게 원하는 로직구현
@CrossOrigin
@RequestMapping("/shop") //프론트에서의 mapping주
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	String photoName; //react에서 업로드/변경한 이미지명...빼놓은 이유는 다른 메서드에서도 사용하기 위해
	
	
	@PostMapping("/upload")
	public String fileUpload(@RequestParam MultipartFile uploadFile,
			HttpServletRequest request)
	{
		//업로드할 폴더 위치
		String path=request.getServletContext().getRealPath("/save");
		
		//파일명
		String fileName=uploadFile.getOriginalFilename();
		
		//파일명 변경
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		photoName=sdf.format(new Date())+"_"+fileName;
		
		System.out.println("fileName: "+fileName+"==>"+photoName);
		
		//save폴더에 업로드
		try {
			uploadFile.transferTo(new File(path+"/"+photoName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//여기까지하고 react ShopForm으로 이동
		
		return photoName;
	}
	
	@PostMapping("/insert")
	//file값 같은 값 전달을 제외하고는 void
	public void insertShop(@RequestBody ShopDto dto) //@RequestBody json으로 보낸걸 java클래스로 변환해주는 어노테이션
	{
		//업로드한 사진으로 변경
		dto.setPhoto(photoName);
		
		//insert
		shopService.insertShop(dto);
	}
	
	//상품목록 가져오기
	@GetMapping("/list")
	public List<ShopDto> list()
	{
		return shopService.getShopDataes();
	}
	
	@GetMapping("/detail")
	public ShopDto getData(int num)
	{
		return shopService.getData(num);
	}
}
