package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapper;

public class MemberService implements MemberServiceInter {
	
	@Autowired
	MemberMapper mapper;
	
	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapper.insertMember(dto);
	}

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return mapper.getAllMembers();
	}

	@Override
	public int getSearchId(String id) {
		// TODO Auto-generated method stub
		return mapper.getSearchId(id);
	}

	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return mapper.getName(id);
	}

	@Override
	public int loginPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		
		map.put("id", id);
		map.put("pass", pass);
		
		return mapper.loginPassCheck(map);
	}

}
