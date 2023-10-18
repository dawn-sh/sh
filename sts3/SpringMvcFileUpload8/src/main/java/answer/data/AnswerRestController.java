package answer.data;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

//pom.xml에 json repository추가
@RestController
public class AnswerRestController {

	@Autowired
	AnswerDao adao;

	@GetMapping("/board/adelete")
	public Map<String, Integer> answerdelete(@RequestParam int idx,
			@RequestParam String pass)
	{
		int check=adao.getCheckPass(idx, pass);
		
		if(check==1)
		{
			adao.deleteAnswer(idx);
		}
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("check", check); //{"check":1}
		
		return map;
	}
}
