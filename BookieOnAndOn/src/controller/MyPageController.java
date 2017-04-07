package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookingDAO;
import model.MemberDAO;
import model.MemberVO;

public class MyPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		String url = "";
		int bookingcount = 0;
		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		if (vo == null) {

			url = "index.jsp";

		} else {

			if (id == null) {
				bookingcount = BookingDAO.getInstance().getTotalBookingCount(vo.getId());
				session.setAttribute("bookingcount", bookingcount);
				url = "redirect:bookieOnAndOn/mypage.jsp";

			} else {
				MemberVO fvo = MemberDAO.getInstance().getMemberById(id);
				session.setAttribute("fvo", fvo);
				bookingcount = BookingDAO.getInstance().getTotalBookingCount(fvo.getId());
				session.setAttribute("bookingcount", bookingcount);
				url = "redirect:bookieOnAndOn/mypage.jsp";

			}

		}

		return url;
	}

}
