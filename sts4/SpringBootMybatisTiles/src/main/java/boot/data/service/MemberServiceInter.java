package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public String getName(String id);
	public int loginPassCheck(String id,String pass); //MemberMapperInter.java에서는 mybatis 규칙에 의해 map으로 사용하고 이곳에서는 풀어서 사용 가능
	public MemberDto getDataById(String id);
	public void deleteMember(String num);
	public void updatePhoto(String num,String photo); //num에 의한 사진 변경
	public void updateMember(MemberDto dto);
	public MemberDto getDataByNum(String num);
}
