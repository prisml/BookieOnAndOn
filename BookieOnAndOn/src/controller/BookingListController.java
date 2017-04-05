package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookingDAO;
import model.BookingVO;
import model.ListVO;
import model.PagingBean;

public class BookingListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		int totalContents = BookingDAO.getInstance().getTotalBookingContent(id);
		String nowPage = request.getParameter("pageNo");
		System.out.println(nowPage);
		PagingBean pagingBean = null;
		if (nowPage == null){
			pagingBean = new PagingBean(totalContents);
		} else {
			pagingBean = new PagingBean(totalContents, Integer.parseInt(nowPage));
		}
		ArrayList<BookingVO> list = BookingDAO.getInstance().getBookingList(id, pagingBean);
		ListVO listVO = new ListVO(list, pagingBean);
		request.setAttribute("lvo", listVO);
		return "redirect:booking_list.jsp";
	}

}
