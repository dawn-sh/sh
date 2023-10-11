package spring.anno.ex6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex6Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		MysqlController mysql=(MysqlController)app.getBean("mysqlController");
		mysql.insert("홍성경");
		mysql.delete("3");
		mysql.select("송주영");
	}

}
