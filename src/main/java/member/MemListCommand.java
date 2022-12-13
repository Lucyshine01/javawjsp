package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemListCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		int level = (int)session.getAttribute("sLevel");
		ArrayList<MemberVO> vos = dao.getMemList(level);
		request.setAttribute("vos", vos);
		
		// 1.페이지(pag)를 결정한다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// 2. 한 페이지의 분량을 결정한다.
		int pageSize = 5;
		
		// 3. 총 레코드 건수를 구한다.
		int totRecCnt = vos.size();
		
		// 4. 총 페이지 건수를 구한다.
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize)+1;
		
		// 5. 현재페이지의 시작 인덱스번호를 구한다.
		int stratIndexNo = (pag-1) * pageSize;
		
		// 6. 현재 화면에 보여주는 시작번호를 구한다.
		int curScrStartNo = totRecCnt - stratIndexNo;
		
		// 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다.
		// 1. 블록의 크기를 결정한다.(여기선 3으로 지정)
		int blockSize = 3;
		
		// 2. 현재페이지가 위치하고 있는 블록 번호를 구한다.(예:1페이지는 0블록, 3페이지는 0블록, 5페이지는 1블록)
		//int curBlock = ( pag % blockSize ) == 0 ? ( pag / blockSize ) -1 : ( pag / blockSize );
		int curBlock = (pag - 1) / blockSize;
		
		// 3. 마지막블록을 구한다.
		//int lastBlock = (totPage % blockSize)==0 ? (totPage / blockSize) -1 : (totPage / blockSize);
		int lastBlock = (totPage-1) / blockSize;
		
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("stratIndexNo", stratIndexNo);
		request.setAttribute("curScrStartNo", curScrStartNo);
		
		
		// 페이징처리 준비 시작(선생님 처리방식 페이징처리)
//		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
//		int pageSize = 5;
//		int totRecCnt = dao.totRecCnt();
//		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
//		int startIndexNo = (pag - 1) * pageSize;
//		int curScrStartNo = totRecCnt - startIndexNo;
//		
//		// 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다.
//		int blockSize = 3;
//		int curBlock = (pag - 1) / blockSize;
//		int lastBlock = (totPage - 1) / blockSize;
//		
//		ArrayList<MemberVO> vos = dao.getMemList(startIndexNo, pageSize, level);
//		
//		request.setAttribute("vos", vos);
//		request.setAttribute("pag", pag);
//		request.setAttribute("totPage", totPage);
//		request.setAttribute("curScrStartNo", curScrStartNo);
//		request.setAttribute("blockSize", blockSize);
//		request.setAttribute("curBlock", curBlock);
//		request.setAttribute("lastBlock", lastBlock);
		
		
			// dao에서 사용한 메소드(선생님 페이징 처리)
//		public ArrayList<MemberVO> getMemList(int startIndexNo, int pageSize, int level) {
//			ArrayList<MemberVO> vos = new ArrayList<>();
//			try {
//				if(level != 0) {
//					sql = "select * from member where userInfor = '공개' order by idx desc limit ?,?";
//				}
//				else {
//					sql = "select * from member order by idx desc limit ?,?";
//				}
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, startIndexNo);
//				pstmt.setInt(2, pageSize);
//				rs = pstmt.executeQuery();
//				
//				while(rs.next()) {
//					vo = new MemberVO();
//					vo.setIdx(rs.getInt("idx"));
//					vo.setMid(rs.getString("mid"));
//					vo.setPwd(rs.getString("pwd"));
//					vo.setNickName(rs.getString("nickName"));
//					vo.setName(rs.getString("name"));
//					vo.setGender(rs.getString("gender"));
//					vo.setBirthday(rs.getString("birthday"));
//					vo.setTel(rs.getString("tel"));
//					vo.setAddress(rs.getString("address"));
//					vo.setEmail(rs.getString("email"));
//					vo.setHomePage(rs.getString("homePage"));
//					vo.setJob(rs.getString("job"));
//					vo.setHobby(rs.getString("hobby"));
//					vo.setPhoto(rs.getString("photo"));
//					vo.setContent(rs.getString("content"));
//					vo.setUserInfor(rs.getString("userInfor"));
//					vo.setUserDel(rs.getString("userDel"));
//					vo.setPoint(rs.getInt("point"));
//					vo.setLevel(rs.getInt("level"));
//					vo.setVisitCnt(rs.getInt("visitCnt"));
//					vo.setStartDate(rs.getString("startDate"));
//					vo.setLastDate(rs.getString("lastDate"));
//					vo.setTodayCnt(rs.getInt("todayCnt"));
//					
//					vos.add(vo);
//				}
//			} catch (SQLException e) {
//				System.out.println("SQL 에러 : " + e.getMessage());
//			} finally {
//				getConn.rsClose();
//			}
//			return vos;
//		}
	}
}
