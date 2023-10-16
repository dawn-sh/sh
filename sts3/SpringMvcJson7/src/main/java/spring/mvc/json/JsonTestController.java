package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTestController {

	@GetMapping("/list1")
	// 일반적인 @Controller에서
	// json으로 처리한다음 웹에 출력하고 싶을때 @ResponseBody 사용
	// 바로 확인하고 싶으면 위에 @GetMapping("/list1")에 있는 mapping 주소를 url에 수정해서 확인 가능 
	@ResponseBody /* json 처리 후 브라우저로 출력(일반 컨트롤러일 경우) */
	//list db를 가져오기 위해서 List<> 사용
	//Map은 json 간단하게 테스트하기 위해서 사용
	public Map<String, String> list1()
	{
		//Map은 인터페이스 이기 때문에 뒤에 생성은 HashMap으로 생성
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "장순영"); // -> {"name":"장순영"}으로 변환되게해야지 json형태
		map.put("hp", "010-222-3333");
		map.put("addr", "수원시 장안구");
		
		return map;
	}
	
	@GetMapping("/list3")
	//@ResponseBody의 위치는 위나 아래나 상관없다
	//list 복수의 데이터 넣으려고 사용
	public @ResponseBody List<PhotoDto> list3()
	{
		//dto꾸러미를 넣기 위해 list 생성
		//<>안에 들어간 자료형,클래스에 따라서 넣은 수 있다
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		//dto에 만든 생성자 인자값에 ("냥뇽녕냥1", "1.jpeg")을 넣어줘서 순서대로 name 과 photo로 받을 수 있다
		list.add(new PhotoDto("냥뇽녕냥1", "1.jpeg"));
		list.add(new PhotoDto("냥뇽녕냥2", "2.jpeg"));
		list.add(new PhotoDto("냥뇽녕냥3", "3.jpeg"));
		list.add(new PhotoDto("냥뇽녕냥4", "4.jpeg"));
		list.add(new PhotoDto("냥뇽녕냥6", "6.jpeg"));
		
		return list;
	}
}
