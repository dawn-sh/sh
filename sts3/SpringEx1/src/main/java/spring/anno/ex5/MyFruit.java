package spring.anno.ex5;

import javax.annotation.Resource;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {

	//같은 클래스/인터페이스를 받은 두개의 클래스는 정확하게 지정해줘야되서 @Autowired 사용 불가능 
	//@Autowired
 	//정확하게 주입하려면? porm.xml에 가서 아래 주석 처리한 것을 dependencies 안에 넣어줘야함
//	<!-- https://mvnrepository.com/artifact/javax.annotation/javax.annotation-api -->
//		<dependency>
//		    <groupId>javax.annotation</groupId>
//		    <artifactId>javax.annotation-api</artifactId>
//		    <version>1.3.2</version>
//		</dependency>

	//@Resource로 정확하게 지정/주입가능
	@Resource(name = "kfruit")
	Fruit fruit;
	
	public void writeFruit()
	{
		System.out.println("내가 좋아하는 과일은 **");
		fruit.writeFruitName();
	}
}
