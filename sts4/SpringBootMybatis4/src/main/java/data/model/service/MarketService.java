package data.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;

@Service //옛날의 dao라 생각 / mapper(sql)를 보완해주는 공간
public class MarketService implements MarketServiceInter { //MarketMapperInter.java 1개로 자바개념을 다 할 수 있다면 data.model.service를 만들어줄 필요 없다
							//mapper를 implement를 받지는 않는다
	
	//MarketServiceInter는 implements를 받기 위해서 만든 interface
	@Autowired
	MarketMapperInter mapperInter; //실제로 @Autowired를 받아오는 곳은 MarketMapperInter이다  
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public List<MarketDto> getAllSangpums() {
		// TODO Auto-generated method stub
		return mapperInter.getAllSangpums();
	}

	@Override
	public void insertMarket(MarketDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertMarket(dto);
	}

	@Override
	public MarketDto getData(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public void updateMarket(MarketDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateMarket(dto);
	}

	@Override
	public void deleteMarket(String num) {
		// TODO Auto-generated method stub
		mapperInter.deleteMarket(num);
	} 

}
