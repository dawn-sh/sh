package boot.mvc.ex1;

import lombok.Data;
//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;

//@Setter
//@Getter
//@ToString
@Data //@Data 하나만 하면 위에 3개를 받는 효과
public class TestDto {

	private String name;
	private String addr;
}
