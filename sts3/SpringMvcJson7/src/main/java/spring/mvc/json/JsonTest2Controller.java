package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

//json으로 처리해서 브라우저로 띄어주는 것만 가능...오로지 ajax를 위한 Controller
@RestController /* json처리 전용 컨트롤러 */
public class JsonTest2Controller {

	@GetMapping("/list2")
	public Map<String, String> list2()
	{
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("product", "맥북");
		map.put("price", "250만원");
		map.put("warrenty", "구입일로부터 2년까지");
		
		return map;
	}
	
	
	@GetMapping("/list4")
	//이름 입력칸에 입력하는 name을 가져오기 위해 인자값에 그 name을 가져오는 것을 줬다
	//db에 넣어주려면 form에 있는 @RequestParam을 가져오는 것이지만
	//지금은 인위적으로 값을 넣어주기 위해서 dto에 있는 name을 가져온 것
	
	//ex4에 있는 input창에 입력하는 것이 parameter값
	public Map<String, Object> list4(@RequestParam String name)
	{
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		
		//dto에 있는 생성자에 해당하는 것을 만든 것
		list.add(new PhotoDto("냥뇽녕냥1", "1.jpeg"));
		list.add(new PhotoDto("냥뇽녕냥2", "2.jpeg"));
		list.add(new PhotoDto("냥뇽녕냥3", "3.jpeg"));
		list.add(new PhotoDto("냥뇽녕냥4", "4.jpeg"));
		list.add(new PhotoDto("냥뇽녕냥6", "6.jpeg"));
		
		//list가 반복하는 동안 같은 냥뇽녕냥(번호)가 있다면 나오도록 map에 넣어줘야하기 때문에 생성
		Map<String, Object> map=new HashMap<String, Object>();
		//list에 넣어준 값이 아닌 경우 없는 사진을 주기 위해 먼저 만들어줌
		map.put("name", "없는 사진");
		map.put("photo", "5.jpeg");
		
		//위에 생성자에 해당하는 것을 만든 것을 dto에 넣어주는데 칸에 입력한 이름이 같으면 map에 1개의 list값을 넣어준다
		for(PhotoDto dto:list)
		{
			//input칸에 입력한 값이 list에 넣은 값(dto.getName())과 일치하면 map에 넣어준다
			if(name.equals(dto.getName()))
			{
				map.put("name", dto.getName());
				map.put("photo", dto.getPhoto());
			}
		}
		
		return map;
	}
}
