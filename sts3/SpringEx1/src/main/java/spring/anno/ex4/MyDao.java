package spring.anno.ex4;

import org.springframework.stereotype.Component;

//@Component bean에 자동 등록인데 MyDao에서 myDao로 등록 되고 나머지는 다 똑같이 나옴
@Component //자동으로 빈에 등록(id는 클래스명, 단 첫글자만 소문자 즉 myDao가 아이디가 됨)
public class MyDao implements DaoInter {

	@Override
	public void insertData(String str) {
		// TODO Auto-generated method stub

		System.out.println(str+"_str데이타를 db에 추가 성공!!!");
	}

	@Override
	public void deleteData(String num) {
		// TODO Auto-generated method stub

		System.out.println(num+"+num에 해당하는 데이타 삭제 성공!!!");
	}

}
