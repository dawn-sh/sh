package quiz.movie.inter;

import org.springframework.data.jpa.repository.JpaRepository;

import quiz.movie.dto.MovieDto;

public interface MovieDaoInter extends JpaRepository<MovieDto, Long> {

}
