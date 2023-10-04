package framework.di.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("자바방식으로 hello메서드 호출하기");
		
		Hello hello1=new Hello();
		System.out.println(hello1.getMessage());
		
		Hello hello2=new Hello();
		System.out.println(hello2.getMessage());
		
		//주소값 비교
		//java는 new로 생성할 때마다 새로운 주소값 생성하기 때문에 생성주소 다르다
		System.out.println(hello1==hello2);
		
		System.out.println("스프링방식으로 hello메서드 호출하기");
		//xml파일 가져오기..웹으로 실행시 web.xml에 설정이 되어 있으므로 필요없다
		
		//src/main/resources에 폴더를 만들면 폴더명/helloContext.xml로 소환해야한다
		ApplicationContext app1=new ClassPathXmlApplicationContext("helloContext.xml");
		
		//hello객체생성
		//helloContext.xml bean에 설정한 이름을 가져오는 것
		//방법1
		//getBean은 object반환값이기에 왼쪽에 Hello 자료명으로 맞춰줌
		Hello h1=(Hello)app1.getBean("hello");
		System.out.println(h1.getMessage());
		
		//방법2
		//("helloContext.xml bean에 설정한 이름", 클래스명.class)
		Hello h2=app1.getBean("hello", Hello.class);
		System.out.println(h2.getMessage());
		
		System.out.println(h1==h2); //생성주소 같다..스프링방식에서 기본이 싱글톤(스프링방식에서는 생성하는 주소가 같기 때문)
	}

}
