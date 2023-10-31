package quiz.movie.inter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import quiz.movie.dto.MovieDto;

@Repository
public class MovieDao{

	@Autowired
	MovieDaoInter inter;
	
	public List<MovieDto> getAllDataes()
	{
		return inter.findAll(Sort.by(Sort.Direction.DESC, "num"));
	}
	
	public void insert(MovieDto dto)
	{
		inter.save(dto);
	}
	
	public MovieDto getData(Long num)
	{
		return inter.getReferenceById(num);
	}
}
