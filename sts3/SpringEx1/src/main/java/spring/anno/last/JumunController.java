package spring.anno.last;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class JumunController {

	
	//선언된 dao(ShopInter shopInter;)는 메소드 안에서만 사용
	@Autowired
	ShopInter shopInter;
	//이 밑에 아무것도 안써도 ShopInter에 해당하는 메소드/변수들을 다 사용 가능
	
	int cnt=10;
	String name="홍성경";
	
	public void insertJumun(String sang,int price,String color)
	{
		shopInter.insertSangpum(sang, price, color);
		System.out.println(name+"님이"+cnt+"개를 주문함!!!");
	}
	
	public void deleteJumun(String num)
	{
		shopInter.deleteSangpum(num);
	}
	
	public void selectJumun(String sang,int price,String color)
	{
		System.out.println("주문자: "+name);
		shopInter.selectShop(sang, price, color);
		System.out.println("주문갯수: "+cnt);
	}
}
