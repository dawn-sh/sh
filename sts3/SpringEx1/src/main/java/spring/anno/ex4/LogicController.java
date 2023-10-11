package spring.anno.ex4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic") //id가 logic이 된다 / ()안에 내가 설정할 id 넣어주면 됨..LogicController라는 이름을 logic으로 바꿔줌
public class LogicController {
	
	//MyDao.java 와 LogicController.java를 bean에 등록해야한다/인터페이스는 등록불필요
	
	//@Componenet 후 자동 주입 설정할 것
	//@Autowired는 DaoInter라는 것을 자동 등록하겠다라는 뜻이므로 DaoInter위에 선언
	@Autowired
	//정확한 빈의 아이디로 주입_모호성이 있는 경우에는 @Resource(name="정확한이름(myDao)")
	DaoInter daoInter;
	
//	public LogicController(MyDao dao) {
//		this.daoInter=dao;
//	}
	
	//insert
	public void insert(String str)
	{
		//DaoInter안에 있는 insertData를 가져옴
		daoInter.insertData(str);
	}
	
	//delete
	public void delete(String num)
	{
		daoInter.deleteData(num);
	}
}
