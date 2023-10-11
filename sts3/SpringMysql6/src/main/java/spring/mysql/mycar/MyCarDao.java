package spring.mysql.mycar;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.mysql.cj.Session;

//dao를 bean에 등록한다...@Repository
@Repository
public class MyCarDao {

	//sql주입시 SqlSession으로 받아온다
	@Autowired
	//return을 대신해주는 역할
	//이 SqlSession은 root-context.xml에서 설정해준 bean에서 가져온 것이다
	SqlSession session;
	
	String namespace="spring.mysql.mycar.MyCarDao";
	
	public int getTotalCount()
	{
		//mycarMapper.xml에서 등록한 id 값을 가져온다
		//selectOne - 가져오는 값이 1개일때, selectList - 가져오는 값이 여러개일때(ex.dto)
		//mycarMapper.xml에 mapper태그에 있는 namespace.id값으로도 가져올 수 있다
		
		//mycarMapper.xml mapper태그에 있는 namespace에 패키지.dao로 되어있으면 위에 String namespace="패키지.dao"로 변수 받아서 사용해도 된다
		//구분지어서 사용하기 위해 사용하는 것이고 namespace로 받아왔으면 ".mycarMapper.xml에서 쓸 id 값"으로
		//mycarMapper.xml에서 쓸 id 값을 길게 구분 가능하게 썼으면 그냥 id 값만 쓰면 된다
		return session.selectOne(namespace+".getTotalCount");
	}
	
	//insert
	public void insertCar(@ModelAttribute MyCarDto dto)
	{
		session.insert("insertOfMycar", dto);
	}
	
	
	//전체목록출력
	public List<MyCarDto> getAllCars()
	{
		return session.selectList("getAllListOfMyCar");
	}
	
	//삭제
	public void deleteCar(String num)
	{
		session.delete("deleteOfMyCar", num);
	}
}
