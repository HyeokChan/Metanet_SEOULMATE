package com.meta.seoul.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class MemberDAO {
	
	private static final String URL = "jdbc:oracle:thin:@awsoradb.c5p23sev1bdi.ap-northeast-2.rds.amazonaws.com:1521:ORCL";
	private static final String USER = "sysdba";
	private static final String PASSWORD = "gurcks258";
	private static final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	
	// 데이터베이스 연결 메소드
	public Connection getConn(){
		Connection conn = null;
		try{
			Class.forName(DRIVER_NAME); // ClassNotFoundException이 나타날 수 있다.
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch(ClassNotFoundException e){
			System.out.println("드라이버를 찾지 못했습니다!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("연결 실패");
			e.printStackTrace();
		}
		return conn;
	}
	//JDBC 4단계 : 1.연결, 2.명령, 3.결괴, 4.해제
	// 게시판에 글을 하나 저장
	public int insertMember(MemberDTO dto){
		int affected = 0;
		// 1.연결
		Connection conn = getConn();
		PreparedStatement st = null; // 2.명령 준비	
		String sql="insert into Member(user_code, user_id, user_pwd, user_email, user_name, user_tel) "
				+ "values((select nvl(max(user_code),0)+1 as user_code from Member), ?,"
				+ " ?, ?, ?, ?)";
		try{
			st = conn.prepareStatement(sql);
			st.setString(1, dto.getUser_id());
			st.setString(2, dto.getUser_pwd());
			st.setString(3, dto.getUser_email());
			st.setString(4, dto.getUser_name());
			st.setString(5, dto.getUser_tel());
			affected = st.executeUpdate(); //3.명령 실행 (반환은 1성공 0실패) 
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			// 4.자원 해제
			close(conn, st);
		}
		return affected;
	}
	private void close(Connection conn, PreparedStatement st) {
		if(st != null){
			try {
				st.close();
			} catch (SQLException e) {
				System.out.println("close st 에러 발생.");
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("close conn 에러 발생.");
				e.printStackTrace();
			}
		}
	}

}
