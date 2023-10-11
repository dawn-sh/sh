package spring.di.ex2;

public class MyInfo {

	//생성자 주입..생성과 동시에 값 변경가능
	String name;
	int age;
	String addr;
	
	
	//생성자 주입을 위해 만들어진 것
	public MyInfo(String name,int age,String addr) {
		
		this.name=name;
		this.age=age;
		this.addr=addr;
	}
	
	//출력용
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "MyInfo[name="+name+", age="+age+", addr="+addr+"]";
	}
}
