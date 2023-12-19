package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("member")
public class MemberDto {

	private int num;
	private String id;
	private String pass;
	private String name;
	private String email;
	private String hp;
	private String addr;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp gaipday;
}
