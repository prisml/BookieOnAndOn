package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.ReviewDAO;
import model.ReviewVO;

public class ReviewReadController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String bookno = request.getParameter("bookno");
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();
		ReviewVO rvo = ReviewDAO.getInstance().getReview(bookno,id);
		return "AjaxView";
	}

}
