package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("IpgoDto") //dto로 하게되면 dto가 많을때 겹칠 수 있다
public class IpgoDto {

	private String num;
	private String sangpum;
	private int price;
	private String photoname;
	private Timestamp ipgoday;
}
