package spring.mvc.reboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaointer {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("getTotalCountOfReboard");
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne("MaxNumOfReboard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		
		//mapper에서 두가지 값의 리턴값으로 HashMap으로 넘겼기에 HashMap 생성 후 값을 넣어줘야함
		
		// int를 mapper클래스로 Integer 사용해야함
		// map.put(String값,Integer값)
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("UpdateStepOfReBoard", map);
	}

	@Override
	public void insertReboard(BoardDto dto) {
		// TODO Auto-generated method stub
		
		//insert 시 필요한 4가지 값 가져오기
		int num=dto.getNum();
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		//넘어오는 값이 없으면 새글
		if(num==0)
		{
			//새 글일 경우 새로운 그룹을 만들어줘서 num값+1해줌(답글 달 경우 모두 regroup으로 묶어주려고)
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {
			//넘어오는 값이 있으면 답글
			//같은 그룹 중 전달받은 restep보다 큰 글들 모두 +1
			//만든 메서드 불러오기...this.은 생략 가능
			this.updateRestep(regroup, restep);
			
			//전달 받은 step과 level 모두 1 증가
			restep++;
			relevel++;
		}
		
		//바뀐 값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//insert
		session.insert("insertOfReboard", dto);
	}

	@Override
	public List<BoardDto> getPagingList(int start, int perpage) {
		// TODO Auto-generated method stub
		
		// map.put(String값,Integer값)
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return session.selectList("SelectPagingOfReboard", map);
	}

}
