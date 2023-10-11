package spring.anno.ex6;

import org.springframework.stereotype.Component;

@Component //나중에는 Dao를 Repository로 등록(주입)해준다
public class TestDao {

	public void insert(String irum)
	{
		System.out.println(irum+"님 db에 추가됨");
	}
	public void delete(String no)
	{
		System.out.println(no+"번 데이타 삭제됨");
	}
	public void select(String irum)
	{
		System.out.println(irum+"님은 수원에 사는 20대여자임");
	}
}
