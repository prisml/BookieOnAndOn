package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookingDAO;
import model.MemberVO;

public class BookingMemberDeleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		String senderid = mvo.getId();
		String receiverid = request.getParameter("receiverid");
		System.out.println(senderid);
		System.out.println(receiverid);
		BookingDAO.getInstance().bookingMemberDelete(senderid, receiverid);
		return "AjaxView";
	}

}
