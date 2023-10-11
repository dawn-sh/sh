package spring.di.ex2;

public class Person {

	//setter 주입
	
	
	String schoolName;
	//MyInfo 에 있는 것을 Person에 주입
	MyInfo info;
	
	//MyInfo만 생성자 주입으로 만들어 놓음
	//생성자
	public Person(MyInfo info) {
		super();//super 생략되어있는데 눈에 보여주기 위해 적어놓음
		this.info=info;
	}

	//setter
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
	//출력
	public void writeData()
	{
		System.out.println("**학생 정보 출력**");
		System.out.println("학교명: "+schoolName);
		System.out.println("학생명: "+info.name);
		System.out.println("나이: "+info.age);
		System.out.println("주소: "+info.addr);
	}
}
