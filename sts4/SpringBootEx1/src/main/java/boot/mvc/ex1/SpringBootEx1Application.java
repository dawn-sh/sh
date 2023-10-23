package boot.mvc.ex1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.test","boot.aaa","hello.boot","my.info"}) //@ComponentScan({"boot.test","boot.aaa"}) 패키지 등록...여러개 일때는 {}안에 여러개 적어줌
//처음 만들때 만든 패키지 말고는 등록해줘야한다
//SpringBootEx1Application.java 가 앞으로 main
public class SpringBootEx1Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootEx1Application.class, args);
	}

}
