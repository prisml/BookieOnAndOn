package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.ReviewDAO;
import model.ReviewVO;

public class ReviewRegistController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String bookno = request.getParameter("bookno");
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String id = vo.getId();

		String content = request.getParameter("content");
		int star = Integer.parseInt(request.getParameter("star"));

		ReviewVO rvo = ReviewDAO.getInstance().getReview(bookno, id);
		if (rvo == null) {
			ReviewDAO.getInstance().registReview(new ReviewVO(bookno, id, star, content, ""));
		} else {
			ReviewDAO.getInstance().updateReview(new ReviewVO(bookno, id, star, content, ""));
		}
		ReviewDAO.getInstance().updateStar(bookno);
		return "AjaxView";
	}

}
