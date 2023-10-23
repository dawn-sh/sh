package my.info;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InfoController {

	@GetMapping("/my/info")
	public @ResponseBody Map<String, String> info()
	{
		Map<String, String> data=new HashMap<String,String>();
		
		data.put("name", "최성현");
		data.put("age", "23");
		data.put("addr", "서울시 강남구");
		
		return data;
	}
}
