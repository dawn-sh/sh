package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ReboardDto;

@Mapper
public interface ReboardMapperInter {

	public int getMaxNum();
	public int getTotalCount(Map<String, String> map); //검색단어 + 카테고리까지 넣어주기 위해서 map으로 넘겨줌 //검색한 결과의 갯수 구하기 위해서
	public List<ReboardDto> getPagingList(Map<String, Object> map); //paging을 넘어갈때 검색을 넣을지도 몰라서 Integer대신 Object
	public void insertReboard(ReboardDto dto);
	public void updateRestep(Map<String, Integer> map); // 오른차순 순차때문에 넣어줌
	public void updateReadCount(int num);
	public ReboardDto getData(int num);
	public void updateReboard(ReboardDto dto);
	public void deleteReboard(int num);
	public void updateLikes(int num);
}
