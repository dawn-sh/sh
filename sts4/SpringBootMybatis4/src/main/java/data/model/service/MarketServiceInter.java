package data.model.service;

import java.util.List;

import data.model.dto.MarketDto;

public interface MarketServiceInter { //MarketMapperInter 쓰다가 java문을 더 써줄게 있다면 service interface에 그대로 가져와서 MarketService를 만들어준다

	public int getTotalCount();
	public List<MarketDto> getAllSangpums();
	public void insertMarket(MarketDto dto); //넘겨줄 인자값이 2개 이상이라 map으로 넣어주려면 그 map을 풀어서 인자값으로 각각 넣어주면 된다
	public MarketDto getData(String num);
	public void updateMarket(MarketDto dto);
	public void deleteMarket(String num);
}
