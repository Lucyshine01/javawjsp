package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ChatDAO {
	// 싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ChatVO vo = null;

	// 채팅메세지 내용 가져오기..
	public ArrayList<ChatVO> getChatList(int su) {
		ArrayList<ChatVO> vos = new ArrayList<>();
		try {
			sql = "select * from chat where idx > (select max(idx) - ? from chat) order by cDate limit 50";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, su);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new ChatVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setContent(rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br/>"));
				// 날짜처리 : 시간을 24시간제에서 12시간제로(오전/오후)
				int cDate = Integer.parseInt(rs.getString("cDate").substring(11,13));
				String timeType = "오전";
				if(cDate >= 12) {
					timeType = "오후";
					cDate = cDate - 12; 
				}
				vo.setcDate(rs.getString("cDate").substring(0,10) + " " + timeType + " " + cDate + rs.getString("cDate").substring(13,16));
				vo.setAvatar(rs.getString("avatar"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	// 메세지 내용 DB에 저장하기
	public String setChatInput(String nickName, String content, String avatar) {
		try {
			sql = "insert into chat values(default,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);;
			pstmt.setString(1, nickName);
			pstmt.setString(2, content);
			pstmt.setString(3, avatar);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return "";
	}
	
	
	
}
