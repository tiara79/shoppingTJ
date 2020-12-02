package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// DAO - DataBase Access Object

public class BoardDAO {
  Connection conn;
  PreparedStatement pstmt;
  ResultSet rs;
  
  // database 의 connection pool 을 사용하도록 설정하기
  public void getConn(){
  	
  	try {
  		// server.xml 에서 data 를 읽음
			Context ctx = new InitialContext();
			
			// tomcat server 내부에 
			// 정보를 저장한 위치로 이동함
			Context envCtx = (Context)ctx.lookup("java:comp/env");
			
			// DataSource 객체 생성
			DataSource ds = (DataSource)envCtx.lookup("jdbc/oracle");
			
			// DataSource 객체를 사용해서 DataBase 에 연결함
			// <-- Connection 객체를 생성
			conn = ds.getConnection();			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
  	
  } // getConn()
  
  // 게시글에 입력한 data들을 받아와서
  // database에 저장하기
  public void insertBoard(BoardDTO dto) {
  	
  	// DB에 연결하기
  	getConn();
  	
  	// 글 그룹 : slq문을 실행시켜서 
  	//           가장 큰 ref 값을 가져온 후 +1을 해 줌
  	int ref      = 0;
  	// 새 글 : 부모 글
  	int re_step  = 1;
  	int re_level = 1;
  	
  	
  	try {
			// 가장 큰 ref 값을 가져오는 sql 작성하기
			String sqlRef = "select max(ref) from board";
			// sql을 실행하는 객체 : PreparedStatement

			pstmt = conn.prepareStatement(sqlRef);
			
			// sql을 DBMS에 전달함
			rs = pstmt.executeQuery();
			
		  // DB에서 data를 받아와서
			// rs(ResultSet)에 저장된 data가 있는 경우
			if(rs.next()) { 
				System.out.println("rs.getInt(1) : " + rs.getInt(1));
				// 가장 큰 ref 값을 가져온 후 +1을 해 줌
				// 최댓값(가장 큰 ref 값)에 1을 더해서 글그룹을 생성함
				ref = rs.getInt(1) + 1;
			}
			
			// DB에 data를 insert하기
			String sql 
			= "insert into board values(board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			
			/*
			  WRITER
        EMAIL
        SUBJECT
        PASSWORD
  		*/
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, dto.getContent());
			
		  // DBMS 에 sql 문을 전달함
			pstmt.executeUpdate();		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) { rs.close(); }
				if(pstmt != null) { pstmt.close(); }
				if(conn != null) { conn.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
  	
  	
  } // insertBoard
  
  
  // 게시글 전체 data 를 반환하는 메소드
  public ArrayList<BoardDTO> selectAll(int startRow, int endRow){
  	
  	ArrayList<BoardDTO> list = new ArrayList<>();
  	
  	getConn();
  		
  	try {
  		String sql = "select * from " + 
  				"(select A.*, rownum rnum from " + 
  				"(select * from board order by ref desc, re_step asc) A) " + 
  				"where rnum >= ? and rnum <= ?";
                   
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, startRow);
      pstmt.setInt(2, endRow);
      // pstmt.setInt(2, endRow);
      
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
      	BoardDTO dto = new BoardDTO();
      	dto.setNum(rs.getInt(1));
      	dto.setWriter(rs.getString(2));
      	dto.setEmail(rs.getString(3));
      	dto.setSubject(rs.getString(4));
      	dto.setPassword(rs.getNString(5));
      	dto.setReg_date(rs.getString(6));
      	dto.setRef(rs.getInt(7));
      	dto.setRe_step(rs.getInt(8));
      	dto.setRe_level(rs.getInt(9));
      	dto.setReadcount(rs.getInt(10));
      	dto.setContent(rs.getString(11));
      	
      	list.add(dto);
      }
  		
  	}catch(Exception e) { 
  		e.printStackTrace();
  	}finally{
      try{	
      	if(rs != null) { rs.close(); }
        if(pstmt != null) { pstmt.close(); }
        if(conn != null) {conn.close();}
      }catch(Exception e){
      	e.printStackTrace();
      }
    }
  	
  	return list;
  }
  
  // 하나의 게시글만 반환하기 <-- boardInfo.jsp
  public BoardDTO getOneRecord(int num){
  	
  	BoardDTO dto = new BoardDTO();
  	
  	getConn();
  	
  	try {
  		
  		// DB에 있는 조회수(readcount)를 하나 증가시킴
  		String sqlRC = "update board set readcount = readcount + 1 where num=?";
  		pstmt = conn.prepareStatement(sqlRC);
  		pstmt.setInt(1,  num);
  		pstmt.executeUpdate();  		
  		
  		
			String sql = "select * from board where num=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt(1));
      	dto.setWriter(rs.getString(2));
      	dto.setEmail(rs.getString(3));
      	dto.setSubject(rs.getString(4));
      	dto.setPassword(rs.getNString(5));
      	dto.setReg_date(rs.getString(6));
      	dto.setRef(rs.getInt(7));
      	dto.setRe_step(rs.getInt(8));
      	dto.setRe_level(rs.getInt(9));
      	dto.setReadcount(rs.getInt(10));
      	dto.setContent(rs.getString(11));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
      try{	
      	if(rs != null) { rs.close(); }
        if(pstmt != null) { pstmt.close(); }
        if(conn != null) {conn.close();}
      }catch(Exception e){
      	e.printStackTrace();
      }
    }
  	
  	
  	return dto;
  }
  
  // 답변글을 DB에 저장하기
  public void insertRewrite(BoardDTO dto){
  	
  	// 부모글그룹과 글스텝, 글레벨을 저장함
  	int ref = dto.getRef();
  	int re_step = dto.getRe_step();
  	int re_level = dto.getRe_level();
  	
    getConn();
    
    try {
			// 부모글보다 큰 re_level의 값을
			// 모두 1 증가시켜줌
			String sqlLevel = 
					"update board set re_level = re_level + 1 " 
			  +	"where ref = ? and re_level > ?";
			pstmt = conn.prepareStatement(sqlLevel);
			pstmt.setInt(1,  ref);
			pstmt.setInt(2,  re_level);
			pstmt.executeUpdate();
			
			// 답변글 data를 DB에 저장하기
			String sql = "insert into board values(board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getPassword());
  		// 부모글의 ref를 넣음
			pstmt.setInt(5, ref); 
  		// 답글이므로 부모글의 re_step 에 1을 증가시킴
			pstmt.setInt(6, re_step + 1);  
			// 답글이므로 부모글의 re_level 에 1을 증가시킴
			pstmt.setInt(7, re_level + 1);
			pstmt.setString(8, dto.getContent());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
      try{	
        if(pstmt != null) { pstmt.close(); }
        if(conn != null) {conn.close();}
      }catch(Exception e){
      	e.printStackTrace();
      }
    }
  	
  }
  
  
 //하나의 게시글만 반환하기 
 // <-- boardUpdate 할 때 사용하는 메소드
 // <-- boardDelete 할 때 사용하는 메소드
 public BoardDTO getOneUpdate(int num){
 	
 	BoardDTO dto = new BoardDTO();
 	
 	getConn();
 	
 	try {
 		
 		
			String sql = "select * from board where num=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt(1));
     	dto.setWriter(rs.getString(2));
     	dto.setEmail(rs.getString(3));
     	dto.setSubject(rs.getString(4));
     	dto.setPassword(rs.getNString(5));
     	dto.setReg_date(rs.getString(6));
     	dto.setRef(rs.getInt(7));
     	dto.setRe_step(rs.getInt(8));
     	dto.setRe_level(rs.getInt(9));
     	dto.setReadcount(rs.getInt(10));
     	dto.setContent(rs.getString(11));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
     try{	
     	if(rs != null) { rs.close(); }
       if(pstmt != null) { pstmt.close(); }
       if(conn != null) {conn.close();}
     }catch(Exception e){
     	e.printStackTrace();
     }
   }
 	
 	
 	return dto;
 }
 
 // update, delete 할 때 확인하기 위한
 // password (DB에서) 받아오기
 public String getPassword(int num){
	 String password = "";
	 
	 getConn();
	 
	 try {
		 String sql = "select password from board where num=?";
		 
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1, num);
		 rs = pstmt.executeQuery();
		 
		 if(rs.next()) {
			 password = rs.getString(1);
		 }
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }finally{
     try{	
    	if(rs != null) { rs.close(); }
      if(pstmt != null) { pstmt.close(); }
      if(conn != null) {conn.close();}
    }catch(Exception e){
    	e.printStackTrace();
    }
  }
	 
	 return password;
 }
 
  public void updateBoard(BoardDTO dto) {
  	
  	getConn();
  	
  	try {
  		String sql = "update board set subject=?, content=? where num=?";
  		pstmt = conn.prepareStatement(sql);
  		
  		pstmt.setString(1, dto.getSubject());
  		pstmt.setString(2, dto.getContent());
  		pstmt.setInt(3, dto.getNum());
  		
  		pstmt.executeUpdate();
  		
  	}catch(Exception e) {
  		e.printStackTrace();
  	}finally{
      try{	
        if(pstmt != null) { pstmt.close(); }
        if(conn != null) {conn.close();}
      }catch(Exception e){
      	e.printStackTrace();
      }
    }
  	
  } // updateBoard
  
  public void deleteBoard(int num) {
  	
  	getConn();
  	
  	try {
  		String sql = "delete from board where num=?";
  		
  		pstmt = conn.prepareStatement(sql);
  		pstmt.setInt(1, num);
  		pstmt.executeUpdate();
  		
  	}catch(Exception e) {
  		e.printStackTrace();
  	}finally{
      try{	
        if(pstmt != null) { pstmt.close(); }
        if(conn != null) {conn.close();}
      }catch(Exception e){
      	e.printStackTrace();
      }
    }
  	
  }

  public int getAllCount() {
  	
  	// 게시글의 전체 개수를 저장하는 변수
  	int count = 0;
  	
  	getConn();
  	
  	try {
  		String sql = "select count(*) from board";
  		pstmt = conn.prepareStatement(sql);
  		rs = pstmt.executeQuery();
  		
  		if(rs.next()) {
  			count = rs.getInt(1);
  		}
  		
  	}catch(Exception e) {
  		e.printStackTrace();
  	}finally{
      try{	
      	if(rs != null) {rs.close();}
        if(pstmt != null) { pstmt.close(); }
        if(conn != null) {conn.close();}
      }catch(Exception e){
      	e.printStackTrace();
      }
    }
  	return count;
  }
  
}  // DAO















