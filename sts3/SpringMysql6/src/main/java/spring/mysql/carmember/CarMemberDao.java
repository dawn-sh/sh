package spring.mysql.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
//실질적으로는 inteface의 것을 override해서 완성한 것이기 때문에 컨트롤러에서 CarMemberInter나 CarMemberDao를 받나 똑같다 
public class CarMemberDao implements CarMemberInter {

	
	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		
		return session.selectOne("getTotalCountOfCarMember");
	}

	@Override
	public List<CarMemberDto> getAllList() {
		
		return session.selectList("getAllLiostOfCarMember");
	}

	@Override
	public void insertCarmember(CarMemberDto dto) {
		// TODO Auto-generated method stub
		session.insert("insertCarMember", dto);
	}

	@Override
	public void deleteCarmember(String num) {
		// TODO Auto-generated method stub
		session.delete("deleteCarMember", num);
	}

	@Override
	public CarMemberDto getData(String num) {
		
		return session.selectOne("getOneDataOfCarMember", num);
	}

	@Override
	public void updateCarmember(CarMemberDto dto) {
		// TODO Auto-generated method stub
		session.update("updateCarMamber", dto);
	}

}
