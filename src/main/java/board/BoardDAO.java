package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class BoardDAO {
	// 싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	BoardVO vo = null;
	
	// 전체() 레코드 건수 구하기
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}
	
	// 검색 레코드 건수 구하기
	public int totRecCnt_search(String search, String searchString) {
		int totRecCnt = 0;
		int searchPoint = 1;
		try {
			if(search.equals("title-content")) {
				sql = "select count(*) as cnt from board where title like ? or content like ?";
				searchPoint = 2;
			}
			else {
				sql = "select count(*) as cnt from board where "+search+" like ?";
			}
			pstmt = conn.prepareStatement(sql);
			if(searchPoint > 1) {
				for(int i=1; i<=searchPoint; i++) pstmt.setString(i, "%"+searchString+"%");
			}
			else {
				pstmt.setString(1, "%"+searchString+"%");
			}
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}
	
	
	// 전체 게시글 가져오기
	public ArrayList<BoardVO> getBoList(int stratIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<>();
		try {
			sql = "select *, datediff(now(), wDate) as day_diff,"
					+ "TIMESTAMPDIFF(hour, date_format(wDate, '%Y-%m-%d %H:%i'),"
					+ "date_format(now(), '%Y-%m-%d %H:%i')) AS hour_diff from board order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stratIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setMid(rs.getString("mid"));
				vo.setDay_diff(rs.getInt("day_diff"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 게시글 내용 DB에 저장하기
	public int setBoinputOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "insert into board values (default,?,?,?,?,?,default,?,default,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getHostIp());
			pstmt.setString(7, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 개별 자료 검색
	public BoardVO getBoContentSearch(int idx) {
		try {
			sql = "select * from board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			vo = new BoardVO();
			vo.setIdx(rs.getInt("idx"));
			vo.setNickName(rs.getString("nickName"));
			vo.setTitle(rs.getString("title"));
			vo.setEmail(rs.getString("email"));
			vo.setHomePage(rs.getString("homePage"));
			vo.setContent(rs.getString("content"));
			vo.setwDate(rs.getString("wDate"));
			vo.setHostIp(rs.getString("hostIp"));
			vo.setReadNum(rs.getInt("readNum"));
			vo.setGood(rs.getInt("good"));
			vo.setMid(rs.getString("mid"));
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 조회수 증가처리
	public void setReadNumPlus(int idx) {
		try {
			sql = "update board set readNum = readNum+1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

//	// 좋아요 횟수 증가처리(제한없음)
//	public void setBoGood(int idx) {
//		try {
//			sql = "update board set good = good+1 where idx=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, idx);
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			getConn.pstmtClose();
//		}
//	}
	
	// 좋아요 횟수 증가처리
	public void setBoGood(int idx, int res) {
		try {
			if(res == 0) {
				sql = "update board set good = good+1 where idx=?";
			}
			else {
				sql = "update board set good = good-1 where idx=?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 게시글 삭제처리
	public int setBoDeleteOK(int idx) {
		int res = 0;
		try {
			sql = "delete from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	//게시글 업데이트
	public int setBoUpdate(BoardVO vo) {
		int res = 0;
		try {
			sql = "update board set title=?, email=?, homePage=?, content=?, hostIp=? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomePage());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			pstmt.setInt(6, vo.getIdx());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 이전글/ 다음글에 필요한 내용 검색 처리
	public BoardVO getPreNextSearch(String str, int idx) {
		vo = new BoardVO();
		try {
			if(str.equals("pre"))
				sql = "select * from board where idx < ? order by idx desc limit 1";
			else
				sql = "select * from board where idx > ? limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(str.equals("pre") && rs.next()) {
				vo.setPreIdx(rs.getInt("idx"));
				vo.setPreTitle(rs.getString("title"));
			}
			else if(str.equals("next") && rs.next()){
				vo.setNextIdx(rs.getInt("idx"));
				vo.setNextTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 검색
	public ArrayList<BoardVO> getBoContentSearch(String search, String searchString, int stratIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<>();
		int searchPoint = 1;
		try {
			// 제목,내용 일괄 검색
			if(search.equals("title-content")) {
				sql = "select *, datediff(now(), wDate) as day_diff,"
						+ "TIMESTAMPDIFF(hour, date_format(wDate, '%Y-%m-%d %H:%i'),"
						+ "date_format(now(), '%Y-%m-%d %H:%i')) AS hour_diff from board "
						+ "where title like ? or content like ? order by idx desc limit ?,?;";
				searchPoint = 2;
			}
			// 개별 검색(제목,작성자,내용)
			else {
				sql = "select *, datediff(now(), wDate) as day_diff,"
						+ "TIMESTAMPDIFF(hour, date_format(wDate, '%Y-%m-%d %H:%i'),"
						+ "date_format(now(), '%Y-%m-%d %H:%i')) AS hour_diff from board "
						+ "where "+search+" like ? order by idx desc limit ?,?";
			}
			pstmt = conn.prepareStatement(sql);
			if(searchPoint > 1) {
				for(int i=1; i<=searchPoint; i++) pstmt.setString(i, "%"+searchString+"%");
				pstmt.setInt(searchPoint+1, stratIndexNo);
				pstmt.setInt(searchPoint+2, pageSize);
			}
			else {
				pstmt.setString(1, "%"+searchString+"%");
				pstmt.setInt(2, stratIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setMid(rs.getString("mid"));
				vo.setDay_diff(rs.getInt("day_diff"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 댓글 입력하기
	public String setReplyInputOk(BoardReplyVO replyVo) {
		String res = "0";
		try {
			sql = "insert into boardReply values (default,?,?,?,default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyVo.getBoardIdx());
			pstmt.setString(2, replyVo.getMid());
			pstmt.setString(3, replyVo.getNickName());
			pstmt.setString(4, replyVo.getHostIp());
			pstmt.setString(5, replyVo.getContent());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 댓글 가져오기
	public ArrayList<BoardReplyVO> getBoReply(int idx) {
		ArrayList<BoardReplyVO> replyVos = new ArrayList<>();
		try {
			sql = "select * from boardReply where boardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardReplyVO replyVo = new BoardReplyVO();
				replyVo.setIdx(rs.getInt("idx"));
				replyVo.setBoardIdx(idx);
				replyVo.setMid(rs.getString("mid"));
				replyVo.setNickName(rs.getString("nickName"));
				replyVo.setwDate(rs.getString("wDate"));;
				replyVo.setHostIp(rs.getString("hostIp"));
				replyVo.setContent(rs.getString("content"));
				replyVos.add(replyVo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return replyVos;
	}

	// 댓글 삭제하기
	public String setBoReplyDeleteOK(int idx) {
		String res = "0";
		try {
			sql = "delete from boardReply where idx = ?";
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
