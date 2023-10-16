package spring.mysql.carmember;

import java.util.List;

import org.springframework.web.bind.annotation.ModelAttribute;

public interface CarMemberInter {

	public int getTotalCount();
	//insert
	public void insertCarmember(@ModelAttribute CarMemberDto dto);
	//allselect
	public List<CarMemberDto> getAllList();
	//getdata
	public CarMemberDto getData(String num);
	//update
	public void updateCarmember(CarMemberDto dto);
	//delete
	public void deleteCarmember(String num);
}
