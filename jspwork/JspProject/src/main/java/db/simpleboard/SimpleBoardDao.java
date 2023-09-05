package db.simpleboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DBConnect;

public class SimpleBoardDao {
	
	DBConnect db=new DBConnect();
	
	//전체조회...paging이 없을 때 사용/파라메터로 받는 값이 따로 없음
	public List<SimpleBoardDto> getAllBoards() 
	{
		//list ... arraylist로 많이 쓰임/vector는 안되는 기능이 한가지 있음
		List<SimpleBoardDto> list=new ArrayList<SimpleBoardDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from simpleboard order by num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				SimpleBoardDto dto=new SimpleBoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setStory(rs.getString("story"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//num에 해당하는 dto반환
	public SimpleBoardDto getBoard(String num)
	{
		SimpleBoardDto dto=new SimpleBoardDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from simpleboard where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setStory(rs.getString("story"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//가장 최신에 추가한 글의 num값 얻기 ... 가장 최신 글은 항상 sequence값이 제일 높기 때문
	public int getMaxnum()
	{
		int max=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		//alias 줘서 if문에 alias만 가져와도 됨
		String sql="select max(num) max from simpleboard";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				max=rs.getInt("max");//==rs.getInt(1);...열 번호(index)
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return max;
	}
	
	//insert
	public void insertBoard(SimpleBoardDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		//int값은 0으로 잡아줘야함
		String sql="insert into simpleboard values(null,?,?,?,?,0,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getStory());
			//i give 0 to readcount, so don't need to bind readcount
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//조회수 1증가 메소드...update해주는 것이라 update와 비슷
	public void updateReadCount(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		//readcount에 +1씩 더해진 것을 넣어줌
		String sql="update simpleboard set readcount=readcount+1 where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//비밀번호 맞는지 체크
	public boolean passCheck(String num,String pass)
	{
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from simpleboard where num=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				//초기값이 false이므로 else는 굳이 안줘도됨
				if(rs.getInt(1)==1) //비번이 틀릴경우 0...when using count() uses this if문
					flag=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}
	
	//수정...writer.subject,story다 되게 할 것!
	public void updateBoard(SimpleBoardDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update simpleboard set writer=?,subject=?,story=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getStory());
			pstmt.setString(4, dto.getNum());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//삭제
	public void deleteBoard(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from simpleboard where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//페이징처리_1.전체갯수반환
	public int getTotalCount()
	{
		int total=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from simpleboard";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				total=rs.getInt(1); //1번 열만 구하면 된다...1개의 열만 구하면 행 갯수(전체갯수)가 파악이 된다
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return total;
	}
	
	//2.부분조회 (파라메터1,파라메터2) 파라메터1 : 시작하는 번호 / 파라메터2 : 시작번호부터 갯수
	public List<SimpleBoardDto> getPagingList(int startNum,int perPage)
	{
		List<SimpleBoardDto> list=new ArrayList<SimpleBoardDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from simpleboard order by num desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, perPage);
			rs=pstmt.executeQuery();
			
			while(rs.next()) //여러 개의 행을 구하기 위해서 while
			{
				SimpleBoardDto dto=new SimpleBoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setStory(rs.getString("story"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
}
