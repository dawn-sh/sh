package spring.mvc.friday;

import java.util.List;
import java.util.Map;

public interface InfoInter {

	public int getTotalCount();
	public void insertMyInfo(InfoDto dto);
	//public List<InfoDto> getAllInfoes();
	public InfoDto getDataInfo(String num);
	public void updateMyInfo(InfoDto dto);
	public void deleteMyInfo(String num);
	public List<InfoDto> getAllInfoes(Map<String, String> map);
}
