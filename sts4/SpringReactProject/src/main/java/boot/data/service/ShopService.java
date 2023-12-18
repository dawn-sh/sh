package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ShopDto;
import boot.data.mapper.ShopMapper;

@Service
public class ShopService implements ShopServiceInter {

	@Autowired
	private ShopMapper shopMapper;
	
	@Override
	public void insertShop(ShopDto dto) {
		// TODO Auto-generated method stub
		shopMapper.insertShop(dto);
	}

	@Override
	public List<ShopDto> getShopDataes() {
		// TODO Auto-generated method stub
		return shopMapper.getShopDataes();
	}

	@Override
	public ShopDto getData(int num) {
		// TODO Auto-generated method stub
		return shopMapper.getData(num);
	}

}
