package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookingDAO;
import model.ListVO;
import model.MemberDAO;
import model.MemberVO;
import model.PagingBean;
import model.VO;

public class BookingListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		// 부킹한 인원 총 수
		int receiverIdCount = BookingDAO.getInstance().getTotalBookingCount(id);
		String nowPage = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		if (nowPage == null){
			pagingBean = new PagingBean(receiverIdCount);
		} else {
			pagingBean = new PagingBean(receiverIdCount, Integer.parseInt(nowPage));
		}
		// 로그인 세션
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		// 내 아이디 확인
		MemberVO myId = MemberDAO.getInstance().getMemberById(id);
		// 부킹리스트 & paging
		ArrayList<VO> receiverIdList = BookingDAO.getInstance().getBookingList(id,pagingBean);
		ListVO listVO = new ListVO(receiverIdList, pagingBean);
		request.setAttribute("receiverIdList", listVO);
		request.setAttribute("receiverIdCount", receiverIdCount);
		request.setAttribute("myId", myId);
		request.setAttribute("mvo", vo);
		request.setAttribute("id", id);
		return "bookie/bookingList.jsp";
	}

}
