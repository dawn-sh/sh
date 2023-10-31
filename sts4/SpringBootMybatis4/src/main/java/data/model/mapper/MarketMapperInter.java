package data.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.model.dto.MarketDto;

@Mapper //sql문 전달자 역할
public interface MarketMapperInter { //이곳에서 dao의 역할을 대신 해줄 수 있기 때문에 dao는 필수가 아니게 된다

	public int getTotalCount(); //메소드명이 id역할을 수행 / sql의 mybatis와 이름(id)이 같아야함 ... interface ->MarketSql.xml 로 가야함
	public List<MarketDto> getAllSangpums();
	public void insertMarket(MarketDto dto);
	public MarketDto getData(String num);
	public void updateMarket(MarketDto dto);
	public void deleteMarket(String num);
}
