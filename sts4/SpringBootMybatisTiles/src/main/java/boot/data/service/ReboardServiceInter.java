package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.ReboardDto;

public interface ReboardServiceInter {

	public int getMaxNum();
	public int getTotalCount(String searchcolumn,String searchword); //검색단어 + 카테고리까지 넣어주기 위해서 map으로 넘겨줌 //검색 갯수 구하기 위해서'
	public List<ReboardDto> getPagingList(String searchcolumn,String searchword,int startnum,int perpage); //paging을 넘어갈때 검색을 넣을지도 몰라서 Integer대신 Object
	public void insertReboard(ReboardDto dto);
	public void updateRestep(int regroup,int restep); // 오른차순 순차때문에 넣어줌
	public void updateReadCount(int num);
	public ReboardDto getData(int num);
	public void updateReboard(ReboardDto dto);
	public void deleteReboard(int num);
	public void updateLikes(int num);
}
