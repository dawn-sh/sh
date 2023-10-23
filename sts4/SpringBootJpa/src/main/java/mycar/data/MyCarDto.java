package mycar.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Table(name = "mycar") //mysql에 mycar라는 테이블을 자동으로 만들어줌
@Data
public class MyCarDto {

	@Id //각 entity를 구별하는 식별(시퀀스) 아이디 갖도록 설계
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;
	//이렇게가 기본키 설정
	
	@Column(name = "carname")
	private String carname;
	
	@Column //이름 같으면 생략가능
	private int carprice;
	
	@Column
	private String carcolor;
	
	@Column
	private String carguip;
	
	
	
	@Column
	private String carphoto;
	
	
	
	
	@CreationTimestamp //entity가 생성되는 시점의 시간 자동등록
	@Column(updatable = false) // 수정시 이 컬럼은 수정하지 않겠다는 뜻 / update시 자동 update 안되도록 만들어줘야 함
	// updatable = false 없을 시 날짜가 null로 찍힐 것
	private Timestamp guipday;
	
	// 메인에 entity등록 후 실행 해보고 퀀텀db를 가보면 기존 테이블이 있으면 새로 추가한 컬럼 생성되어있고 index를 따로 저장하는 hibernate_sequence가 생성되어있음
}
