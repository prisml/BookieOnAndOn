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
		String id = null;
		id = request.getParameter("id");
		String url = "";
		int bookingcount = 0;
		bookingcount = BookingDAO.getInstance().getTotalBookingCount(id);
		request.setAttribute("bookingcount", bookingcount);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		if (vo == null) {

			url = "index.jsp";

		} else {

			if (id == null) {
				//MemberVO lvo = MemberDAO.getInstance().getMemberById(id);
				bookingcount = BookingDAO.getInstance().getTotalBookingCount(vo.getId());
				session.setAttribute("bookingcount", bookingcount);
				url = "redirect:bookieOnAndOn/mypage.jsp";

			} else {
				MemberVO fvo = MemberDAO.getInstance().getMemberById(id);
				request.setAttribute("fvo", fvo);
				bookingcount = BookingDAO.getInstance().getTotalBookingCount(fvo.getId());
				request.setAttribute("fbookingcount", bookingcount);
				url = "bookieOnAndOn/mypage.jsp";

			}

		}
		return url;
	}

}

