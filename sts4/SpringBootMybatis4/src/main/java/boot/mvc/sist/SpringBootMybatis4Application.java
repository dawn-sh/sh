package boot.mvc.sist;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("data.model.*")
@MapperScan("data.model.mapper") //@MapperScan bean에 등록하는 것 대신 등록 / mapper는 dao의 역할
public class SpringBootMybatis4Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMybatis4Application.class, args);
	}

}
