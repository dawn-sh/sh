package spring.mvc.reboard;

import java.util.List;
import java.util.Map;

public interface BoardDaointer {

	public int getTotalCount();
	public int getMaxNum();
	public void updateRestep(int regroup,int restep);
	public void insertReboard(BoardDto dto);
	public List<BoardDto> getPagingList(int start,int perpage);
}
