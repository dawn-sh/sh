package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("mbdto")
public class MbanswerDto {

	private String idx;
	private String num;
	private String name;
	private String myid;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm") //날짜 형식을 dto에서 미리 지정
	private Timestamp writeday;
}
