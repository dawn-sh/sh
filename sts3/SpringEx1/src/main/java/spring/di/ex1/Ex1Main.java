package spring.di.ex1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex1Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("자바 생성 방식");
		//interface 생성/호출
		MessageInter m1=new Message1();
		m1.sayHello("민수");
		
		MessageInter m2=new Message2();
		m2.sayHello("영희");
		
		System.out.println("스프링 생성 방식");
		//new ClassPathXmlApplicationContext("폴더안에 생성했다면 폴더명/파일명.확장자명");
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext1.xml");
		
		MessageInter m3=(Message1)context.getBean("mesBean1");
		m3.sayHello("민규");
		
		MessageInter m4=context.getBean("mesBean2", Message2.class);
		m4.sayHello("성신");
	}

}
