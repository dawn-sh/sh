package spring.di.ex2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext context=new ClassPathXmlApplicationContext("appContext2.xml");
		
		//MyInfo생성 후 확인
		MyInfo my=(MyInfo)context.getBean("my");
		System.out.println(my.toString());
		System.out.println(my);
		
		//Person에 있는 메서드 출력
		Person p=(Person)context.getBean("person");
		p.writeData();
	}

}
