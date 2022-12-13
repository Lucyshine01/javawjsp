package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardVO;
import conn.GetConn;

public class SchduleDAO {
	// 싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ScheduleVO vo = null;
	
	// 선택된 날짜의 개별회원에 대한 스케줄의 모든 정보 가져오기
	public ArrayList<ScheduleVO> getScMenu(String mid, String ymd, int sw) {
		ArrayList<ScheduleVO> vos = new ArrayList<>();
		try {
			if(sw == 0) { // 초기화면에서의 호출인 경우
				sql = "select * from schedule where mid=? and date_format(sDate,'%Y-%m')=? order by sDate,part";
			}
			else if(sw == 1) {
				sql = "select * from schedule where mid=? and date_format(sDate,'%Y-%m-%d')=? order by sDate,part";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ymd);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new ScheduleVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setsDate(rs.getString("sDate"));
				vo.setPart(rs.getString("part"));
				vo.setContent(rs.getString("content"));
				
				vo.setYmd(ymd);
//				vo.setPartCnt(rs.getInt(rs.getInt("cnt")));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public String setSchduleInputOk(ScheduleVO vo) {
		String res = "0";
		try {
			sql = "insert into schedule values (default, ?,?,?,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getsDate());
			pstmt.setString(3, vo.getPart());
			pstmt.setString(4, vo.getContent());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	// 스케쥴 수정처리
	public String setSchduleUpdateOk(ScheduleVO vo) {
		String res = "0";
		try {
			sql = "update schedule set part=?, content=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getIdx());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	// 스케쥴 삭제처리
	public String setSchduleDeleteOk(int idx) {
		String res = "0";
		try {
			sql = "delete from schedule where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
}
