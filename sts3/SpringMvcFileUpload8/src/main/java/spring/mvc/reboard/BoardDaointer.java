package spring.mvc.reboard;

import java.util.List;
import java.util.Map;

public interface BoardDaointer {

	public int getTotalCount();
	public int getMaxNum();
	public void updateRestep(int regroup,int restep);
	public void insertReboard(BoardDto dto);
	public List<BoardDto> getPagingList(int start,int perpage);
	public BoardDto getData(int num);
	public void UpdateReadcount(int num);
	public int getCheckPass(int num,int pass);
	public void updateReboard(BoardDto dto);
	public void deleteReboard(int num);
}
