package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;
import model.BookVO;

public class BookDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("bookno");
		System.out.println(no + "아나 시발");
		BookVO vo = BookDAO.getInstance().getBookInfoByNo(no);
		request.setAttribute("vo", vo);
		return "/bookieOnAndOn/detail.jsp";
	}

}