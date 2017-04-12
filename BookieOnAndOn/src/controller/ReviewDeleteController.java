package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.ReviewDAO;
import model.ReviewVO;

public class ReviewDeleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String bookno = request.getParameter("bookno");
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		ReviewDAO.getInstance().deleteReview(new ReviewVO(bookno, id, 0, "", ""));
		return "AjaxView";
	}

}
