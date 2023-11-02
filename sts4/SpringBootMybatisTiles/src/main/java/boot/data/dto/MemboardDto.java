package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("memboard")
public class MemboardDto {

	private String num;
	private String name;
	private String myid;
	private String subject;
	private String content;
	private String uploadfile;
	private MultipartFile upload; //인자값 미리 만들어줌 / 폼 만들때 이 이름으로 맞춰서 적어주면 된다 //여러개 주면 arraylist로 줘야한다
								  //이런 방법도 있다 
	private int readcount;
	private Timestamp writeday;
}
