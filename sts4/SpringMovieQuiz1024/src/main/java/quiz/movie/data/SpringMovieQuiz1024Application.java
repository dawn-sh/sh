package quiz.movie.data;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan("quiz.movie.*")
@EntityScan("quiz.movie.dto")
@EnableJpaRepositories("quiz.movie.inter")
public class SpringMovieQuiz1024Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringMovieQuiz1024Application.class, args);
	}

}
