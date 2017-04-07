package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookingDAO;

public class MyPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		//String id=request.getParameter("id");
		String java="java";
		int bookingcount=0;
		bookingcount=BookingDAO.getInstance().getTotalBookingCount(java);
		request.setAttribute("bookingcount", bookingcount);
		
		
		
		return "bookieOnAndOn/mypage.jsp";
	}

}
