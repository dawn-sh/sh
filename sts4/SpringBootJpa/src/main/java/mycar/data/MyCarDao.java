package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao{

	@Autowired
	MyCarDaoInter carInter; //implement MyCarDaoInter 자동 생성해서 override 받으면 너무 많이 받기 때문에 inter 생성해서 @autowired로 받아와 사용
	
	//insert
	public void insertMyCar(MyCarDto dto)
	{
		carInter.save(dto); //id타입 유무에 따라 자동으로 insert인지 update인지 갈린다 //id타입 없으면 insert 있으면 update로 인식
	}
	
	//전체출력
	public List<MyCarDto> getAllDataes()
	{
		return carInter.findAll(); //출력 조회
	}
	
	//num에 대한 값(dto) 반환
	public MyCarDto getData(Long num)
	{
		return carInter.getReferenceById(num);
	}
	
	public void updateMyCar(MyCarDto dto)
	{
		carInter.save(dto);
	}
	
	public void delete(Long num)
	{
		carInter.deleteById(num);
	}
	
}
