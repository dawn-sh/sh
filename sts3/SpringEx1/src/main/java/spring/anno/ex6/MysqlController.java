package spring.anno.ex6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//이 파일은 TestDao.java를 받아서 @Autowired하고 출력하기 위해서 만들어진 파일
@Component
public class MysqlController {

	@Autowired //==constructargument
	TestDao tdao;
	
	public void insert(String irum)
	{
		tdao.insert(irum);
	}
	
	public void delete(String no)
	{
		tdao.delete(no);
	}
	
	public void select(String irum)
	{
		tdao.select(irum);
	}
}
