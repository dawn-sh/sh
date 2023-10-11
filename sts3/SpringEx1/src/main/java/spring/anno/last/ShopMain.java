package spring.anno.last;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		JumunController order=(JumunController)app.getBean("jumunController");
		order.insertJumun("떡볶이", 20000, "빨간색");
		order.deleteJumun("4");
		order.selectJumun("돈까스", 8000, "노랑+갈색");
	}

}
