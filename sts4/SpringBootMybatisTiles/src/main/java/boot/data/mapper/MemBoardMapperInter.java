package boot.data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemboardDto;

@Mapper
public interface MemBoardMapperInter {

	public int getTotalCount();
	public void updateReadCount(String num);
	public void insertMemBoard(MemboardDto dto);
	public MemboardDto getData(String num);
	public int getMaxNum();
	public List<MemboardDto> getList(HashMap<String, Integer> map); //페이징 limit 주는 것
}
