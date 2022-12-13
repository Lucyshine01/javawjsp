package study.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JusorokDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	JusorokVO vo = null;
	
	public JusorokDAO() {
		String url = "jdbc:mysql://localhost:3306/javaworks";
		String user = "root";
		String password = "1234";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("오류 : 드라이버 검색 실패! - " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("오류 : 데이터베이스 연동 실패! - " + e.getMessage());
		} 
		
	}
	
	// 사용한 객체 반납
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}
	
	// 로그인 체크자리
	public JusorokVO loginCheck(String mid, String pwd) {
		vo = new JusorokVO();
		try {
			sql = "select * from jusorok where mid=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
			}
		}catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 로그아웃처리
	public void logout() {
		// 종료전에 DB에 처리해야 할 내용들을 기록...
		
	}
	
	// 회원 정보 조회
	public JusorokVO getMemberSearch(String mid) {
		vo = new JusorokVO();
		try {
			sql = "select * from jusorok where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setToday(rs.getInt("today"));
			}
		}catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 방문포인터증가와 최종방문일자 업데이트작업
	public void setVisitUpdate(String mid) {
		try {
			sql = "update jusorok set lastDate = default where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		
	}
	
	// 방문횟수 5 이상시 방문포인트 미지급
	void setPointUpdate(String mid, String lastDate) {
		JusorokVO vo = getMemberSearch(mid);
		String nowDate = vo.getLastDate().substring(0,10).replaceAll("-","");
		lastDate = lastDate.substring(0, 10).replaceAll("-","");
		int daylast = Integer.parseInt(lastDate);
		int daynow = Integer.parseInt(nowDate);
		int today = vo.getToday();
		int visitPoint = vo.getPoint();
		if(daylast < daynow) today = 0;
		if(today < 5) {
			try {
				visitPoint += 10;
				today += 1;
				System.out.println(today);
				sql = "update jusorok set point = ?, today = ? where mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, visitPoint);
				pstmt.setInt(2, today);
				pstmt.setString(3, mid);
				pstmt.executeUpdate();
				pstmtClose();
			} catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
			}
		}
	}
	
	
	// 회원 가입처리
	public int setJoinOk(JusorokVO vo) {
		int res = 0;
		try {
			sql = "insert into jusorok (mid, pwd, name) values (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.executeUpdate();
			res = 1;
		} catch (Exception e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	// 회원가입 아이디 중복처리
	public boolean overCheck(JusorokVO vo) {
		boolean over = false;
		try {
			sql = "select * from jusorok where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("mid")!=null) over = true;
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			rsClose();
		}
		return over;
	}
	
	// 전체 회원 조회하기
	public ArrayList<JusorokVO> getMemberList() {
		ArrayList<JusorokVO> vos = new ArrayList<>();
		try {
			sql = "select * from jusorok order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new JusorokVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 유저 정보 삭제
	public void deleteUser(String mid) {
		try {
			sql = "delete from jusorok where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		
	}
	
	// 유저 정보 수정
	public void updateUder(String mid, String pwd, String name, String sMid) {
		try {
			sql = "update jusorok set mid = ?, pwd = ?, name = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, sMid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
	// 유저 검색
	public ArrayList<JusorokVO> searchMember(String idx, String mid, String name) {
		ArrayList<JusorokVO> vos = new ArrayList<>();
		try {
			sql = "select * from jusorok where idx like ? and mid like ? and name like ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+idx+"%");
			pstmt.setString(2, "%"+mid+"%");
			pstmt.setString(3, "%"+name+"%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JusorokVO vo = new JusorokVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				String pwd = rs.getString("pwd");
				String secretPwd = pwd.substring(0,2);
				for(int i=0; i<pwd.substring(2).length(); i++) {
					secretPwd += "*";
				}
				vo.setPwd(secretPwd);
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate").substring(0,16));
				vo.setToday(rs.getInt("today"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
}
