package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookingDAO;
import model.MemberVO;

public class MyPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		String url="";
		int bookingcount=0;
		
		HttpSession session=request.getSession();
	    MemberVO vo=(MemberVO) session.getAttribute("mvo");
		if(vo==null){
			
			url="index.jsp";
			
		}else{
			
			bookingcount=BookingDAO.getInstance().getTotalBookingCount(vo.getId());
			session.setAttribute("bookingcount", bookingcount);
			url="redirect:bookieOnAndOn/mypage.jsp";
			
		}
		
		
		
		
		
		return url;
	}

}
