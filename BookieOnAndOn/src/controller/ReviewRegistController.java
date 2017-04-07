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
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		String id = vo.getId();
		String content = request.getParameter("content");
		int star = Integer.parseInt(request.getParameter("star"));
		ReviewDAO.getInstance().registReview(new ReviewVO(bookno, id, star, content, ""));
		return "DispatcherServlet?command=detail&bookno="+bookno;
	}

}
