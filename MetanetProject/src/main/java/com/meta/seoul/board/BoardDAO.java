package com.meta.seoul.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	//DB 연결 정보
	private static final String URL ="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	//private static final String URL ="jdbc:oracle:awsoradb.c5p23sev1bdi.ap-northeast-2.rds.amazonaws.com:1521:ORCL";
	
	private static final String USER ="scott";
	
	private static final String PASSWORD = "tiger";
	private static final String DRIVER_NAME ="oracle.jdbc.driver.OracleDriver";
	
	//데이터베이스 연결 메소드
	public Connection getConn(){
		Connection conn = null;
		try{
			Class.forName(DRIVER_NAME);
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
		}catch(ClassNotFoundException e){
			System.out.println("드라이버를 찾지 못했습니다!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		}
		return conn;
	}
	
	//JDBC 4 단계 : 1.연결, 2.명려, 3.결과, 4.해제
	//게시판에 글을 하나 저장
	public int boardInsert(BoardDTO dto){
		int affected = 0;
		Connection conn = null;
		PreparedStatement st = null;
		//INSERT INTO 테이블(컬럼) VALUES (넣을 값);
		String sql = "INSERT INTO board(num,title,writer,pwd,content)"
				+"VALUES((select nvl(max(num),0)+1 as num from board),?,?,?,?)";
		try{
			conn = getConn();
			
			st = conn.prepareStatement(sql);
			st.setString(1, dto.getTitle());
			st.setString(2, dto.getWriter());
			st.setString(3, dto.getPwd());
			st.setString(4, dto.getContent());
			affected = st.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			//자원 해제(연결 해제)
			close(conn, st);//insert, update, delete : close 할 떄!
		}// finally
		return affected;
	}//boardInsert

	private void close(Connection conn, PreparedStatement st) {
		if(st != null){
			try {
				st.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	//페이징 글 리스트(시작_글번호, 끝_글번호)
	public ArrayList<BoardDTO> boardList(int begin, int end){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "SELECT *FROM (SELECT rownum as rn, A.* FROM (SELECT * FROM board ORDER BY num DESC) A WHERE rownum <= ?) WHERE rn >= ?";
		try {
			conn=getConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, end);
			st.setInt(2, begin);
			rs = st.executeQuery();
			while(rs.next()){
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setPwd(rs.getString("pwd"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getDate("regdate"));
				list.add(dto);
			}
		}catch(Exception e){
			System.out.println("boardList 예외 발생!");
			e.printStackTrace();
		}
		finally {
			close(rs,st,conn);
		}
		
		return list;
	}//boardList
	
	
	//글 리스트 메소드
	/*public ArrayList<BoardDTO> boardList(){
		
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		Connection conn = null;
		
		PreparedStatement st = null;
	
		ResultSet rs = null;
	
		String sql = "SELECT num,title,writer,pwd,content,regdate,hit FROM board ORDER BY num DESC";
		try{
			
			conn = getConn();
			st = conn.prepareStatement(sql);
			rs = st.executeQuery(); //select 는 executeQuery 지만 insert,update,delete executeUpdate
			while(rs.next()){
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setPwd(rs.getString("pwd"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getDate("regdate"));
				list.add(dto);
			}//while
		}catch(Exception e){
			System.out.println("list 예외발생!");
			e.printStackTrace();
		}finally{
			//자원 해제
			close(rs, st, conn);
		}//finally
		return list;
	}//boardList
	*/
	
	//글의 수 얻기
		public int boardCount(){
			int cnt = 0;
			Connection conn = null;
			PreparedStatement st = null;
			ResultSet rs = null;
			String sql = " SELECT count(*) cnt FROM board";
			try {
				conn = getConn();
				st = conn.prepareStatement(sql);
				rs = st.executeQuery();
				if(rs.next()){
					cnt = rs.getInt("cnt");
				}
			}
			catch(Exception e){
				System.out.println("boardCount 예외 발생!!");
				e.printStackTrace();
			}finally {
				close(rs,st,conn);
			}
			
			return cnt;
		}
		
	
	//글 하나 읽기 : SELELCT
	public BoardDTO boardRead(int num) {
		BoardDTO dto = new BoardDTO();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "SELECT num,title,writer,pwd,content,regdate,hit FROM board WHERE num=?";
		try{
			conn = getConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, num);
			rs = st.executeQuery();
			if(rs.next()){
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setPwd(rs.getString("pwd"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setHit(rs.getInt("hit"));
			}
		}catch(Exception e){
			System.out.println("boardRead에서 예외 발생!");
			e.printStackTrace();
		}finally {
			close(rs, st, conn);
		}
		return dto;
	}//boardRead
	
	//조회수 증가 메소드
	public void boardUpdateHit(int num){
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "UPDATE board SET hit=hit+1 WHERE num=? ";
		try{
			conn = getConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, num);
			st.executeUpdate();
		}catch(Exception e){
			System.out.println("boardUpdateHit 예외 발생");
			e.printStackTrace();
		}finally{
			close(conn, st);
		}
	
	
	}//boardUpdateHit
	
	//글 수정
	public int boardUpdate(BoardDTO dto){
		int affected = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "UPDATE board SET title=?,writer=?,content=? WHERE num=? AND pwd=?";
		try {
			conn = getConn(); //1.연결
			st = conn.prepareStatement(sql); //2.명령 준비
			//?를 채운다!
			st.setString(1, dto.getTitle());
			st.setString(2, dto.getWriter());
			st.setString(3, dto.getContent());
			st.setInt(4, dto.getNum());
			st.setString(5, dto.getPwd());
			affected = st.executeUpdate();//3.실행
		}catch(Exception e){
			System.out.println("boardUpdate 예외 발생!!");
			e.printStackTrace();
		}
		return affected;
	}
	
	//글 삭제
	public int boardDelete(BoardDTO dto){
		int affected = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "DELETE FROM board WHERE num=? AND pwd=?";
		try {
			conn = getConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, dto.getNum());
			st.setString(2, dto.getPwd());
			affected = st.executeUpdate();
		}catch(Exception e){
			System.out.println("boardDelete 예외 발생!");
			e.printStackTrace();
		}finally {
			close(conn,st);
		}
		return affected;
	}//boardDelete
	
	private void close(ResultSet rs,PreparedStatement st,Connection conn) {
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}
		close(conn,st);
	}
	
	
	
}
