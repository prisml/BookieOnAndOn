package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookingDAO;
import model.BookingVO;

public class BookingListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		ArrayList<BookingVO> list = BookingDAO.getInstance().getBookingList(id);
		return "redirect:booking_list.jsp";
	}

}
