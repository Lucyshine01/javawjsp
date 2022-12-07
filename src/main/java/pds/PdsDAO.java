package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardVO;
import conn.GetConn;

public class PdsDAO {
	// 싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	PdsVO vo = null;

	//파트별 자료 갯수 가져오기
	public int totRecCnt(String part) {
		int totRecCnt = 0;
		try {
			if(part.equals("전체")) {
				sql = "select count(*) as cnt from pds";
			}
			else {
				sql = "select count(*) as cnt from pds where part = ?";
			}
			pstmt = conn.prepareStatement(sql);
			if(!part.equals("전체")) pstmt.setString(1, part);
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
	
	// 파트별 전체 자료 가져오기
	public ArrayList<PdsVO> getPdsList(int stratIndexNo, int pageSize, String part) {
		ArrayList<PdsVO> vos = new ArrayList<>();
		try {
			sql = "SELECT *,"
					+ "DATEDIFF(now(), fDate) AS day_diff,"
					+ "TIMESTAMPDIFF(hour, date_format(fDate, '%Y-%m-%d %H:%i'),"
					+ "DATE_FORMAT(now(), '%Y-%m-%d %H:%i')) AS hour_diff "
					+ "FROM pds ";
			if(part.equals("전체")) {
				sql += "ORDER BY idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, stratIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else {
				sql += "where part = ? ORDER BY idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
				pstmt.setInt(2, stratIndexNo);
				pstmt.setInt(3, pageSize);
			}
//			sql = "SELECT *"
//					+ "DATEDIFF(now(), fDate) AS day_diff,"
//					+ "TIMESTAMPDIFF(hour, date_format(fDate, '%Y-%m-%d %H:%i'),"
//					+ "DATE_FORMAT(now(), '%Y-%m-%d %H:%i')) AS hour_diff "
//					+ "FROM pds where part = ? ORDER BY idx desc"
//					+ "limit ?,?";
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setPart(rs.getString("part"));
				vo.setPwd(rs.getString("pwd"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
				
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

	// 자료실에 신규 업로드시킨 파일의 정보를 DB에 저장한다.
	public int setPdsInputOk(PdsVO vo) {
		int res = 0;
		try {
			sql = "insert into pds values(default,?,?,?,?,?,?,?,?,default,default,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfSName());
			pstmt.setInt(5, vo.getfSize());
			pstmt.setString(6, vo.getTitle());
			pstmt.setString(7, vo.getPart());
			pstmt.setString(8, vo.getPwd());
			pstmt.setString(9, vo.getOpenSw());
			pstmt.setString(10, vo.getContent());
			pstmt.setString(11, vo.getHostIp());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	// idx를 이룔한 개별자료검색
	public PdsVO getIdxSearch(int idx) {
		vo = new PdsVO();
		try {
			sql = "select * from pds where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(idx);
			vo.setMid(rs.getString("mid"));
			vo.setNickName(rs.getString("nickName"));
			vo.setfName(rs.getString("fName"));
			vo.setfSName(rs.getString("fSName"));
			vo.setfSize(rs.getInt("fSize"));
			vo.setTitle(rs.getString("title"));
			vo.setPart(rs.getString("part"));
			vo.setPwd(rs.getString("pwd"));
			vo.setfDate(rs.getString("fDate"));
			vo.setDownNum(rs.getInt("downNum"));
			vo.setOpenSw(rs.getString("openSw"));
			vo.setContent(rs.getString("content"));
			vo.setHostIp(rs.getString("hostIp"));
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}
	
	// 자료파일 삭제하기
	public String setPdsDelete(int idx) {
		String res = "0";
			try {
				sql = "delete from pds where idx = ?";
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
	
	// 다운로드 횟수 추가하기
	public void setPdsDownNum(int idx) {
		try {
			sql = "update pds set downNum=downNum+1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
	// 검색 갯수 조회
	public int totRecCnt_search(String part, String search, String searchString) {
		int totRecCnt = 0;
		int setNum = 0;
		int allSw = 0;
		try {
			if(search.equals("all")) {
				if(part.equals("전체")) {
					sql = "select count(*) as cnt from pds where nickName like ? or title like ? or content like ?";
					setNum = 3;
					allSw = 1;
				}
				else {
					sql = "select count(*) as cnt from pds where (nickName like ? or title like ? or content like ?) and part = ?";
					setNum = 3;
				}
			}
			else {
				if(part.equals("전체")) {
					sql = "select count(*) as cnt from pds where "+search+" like ?";
					setNum = 1;
					allSw = 1;
				}
				else {
					sql = "select count(*) as cnt from pds where "+search+" like ? and part = ?";
					setNum = 1;
				}
			}
			pstmt = conn.prepareStatement(sql);
			for(int i=1; i<=setNum; i++) pstmt.setString(i, "%"+searchString+"%");
			if(allSw != 1) pstmt.setString(setNum+1, part);
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
	
	// 검색 내용 조회
	public ArrayList<PdsVO> searchPds(String part, String search, String searchString, int stratIndexNo, int pageSize) {
		ArrayList<PdsVO> vos = new ArrayList<>();
		int setNum = 0;
		int allSw = 0;
		try {
			if(search.equals("all")) {
				if(part.equals("전체")) {
					sql = "select * from pds where nickName like ? or title like ? or content like ? ORDER BY idx desc limit ?,?";
					setNum = 3;
					allSw = 1;
				}
				else {
					sql = "select * from pds where (nickName like ? or title like ? or content like ?) and part = ? ORDER BY idx desc limit ?,?";
					setNum = 3;
				}
			}
			else {
				if(part.equals("전체")) {
					sql = "select * from pds where "+search+" like ? ORDER BY idx desc limit ?,?";
					setNum = 1;
					allSw = 1;
				}
				else {
					sql = "select * from pds where "+search+" like ? and part = ? ORDER BY idx desc limit ?,?";
					setNum = 1;
				}
			}
			pstmt = conn.prepareStatement(sql);
			for(int i=1; i<=setNum; i++) pstmt.setString(i, "%"+searchString+"%");
			if(allSw != 1) {
				pstmt.setString(setNum+1, part);
				pstmt.setInt(setNum+2, stratIndexNo);
				pstmt.setInt(setNum+3, pageSize);
			}
			else {
				pstmt.setInt(setNum+1, stratIndexNo);
				pstmt.setInt(setNum+2, pageSize);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setPart(rs.getString("part"));
				vo.setPwd(rs.getString("pwd"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	
}
