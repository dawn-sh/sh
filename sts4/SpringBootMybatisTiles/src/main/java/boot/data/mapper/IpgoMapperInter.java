package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.IpgoDto;

@Mapper
public interface IpgoMapperInter {

	public int getTotalCount();//sql의 id
	public void insertIpgo(IpgoDto dto);
	public List<IpgoDto> getAllIpgoes();
	public IpgoDto getDataIpgo(String num);
	public void deleteIpgo(String num);
	public void updateIpgo(IpgoDto dto);
}
