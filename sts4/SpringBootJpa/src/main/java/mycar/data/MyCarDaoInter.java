package mycar.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MyCarDaoInter extends JpaRepository<MyCarDto, Long>{ //jpa extends 받아오기 <dto,기본키 자료형> // JpaRepository<자료를 가져올 타입, 그 자료 안 기준 값>

}
