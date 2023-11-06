package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.SmartDto;

@Mapper
public interface SmartMapperInter {

	public void insertSshop(SmartDto dto);
	public List<SmartDto> getAllAnswers(int num); //content의 num값이 넘어가야함
	public SmartDto getSData(int num);
	public void updateSshop(SmartDto dto);
	public void deleteSshop(int num);
}
