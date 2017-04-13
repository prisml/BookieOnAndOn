package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookingDAO;
import model.MemberDAO;
import model.MemberVO;
import model.SawWishDAO;
import model.VO;

public class MyPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		response.setContentType("text/html;charset=utf-8");
		String id = null;
		id = request.getParameter("id");
		String url = "";
		int bookingcount = 0;
		bookingcount = BookingDAO.getInstance().getTotalBookingCount(id);
		request.setAttribute("bookingcount", bookingcount);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		if (vo == null) {

			url = "index.jsp";

		} else {

			if (id == null) {
				bookingcount = BookingDAO.getInstance().getTotalBookingCount(vo.getId());
				session.setAttribute("bookingcount", bookingcount);
				ArrayList<VO> list= new ArrayList<VO>(); 
				list=SawWishDAO.getInstance().getSawBookSlideList(vo.getId());
				session.setAttribute("sawSlide", list);
				int SawTotalContent=SawWishDAO.getInstance().getSawTotalContent(vo.getId());
				int WishTotalContent=SawWishDAO.getInstance().getWishTotalContent(vo.getId());
				session.setAttribute("SawTotalContent", SawTotalContent);
				session.setAttribute("WishTotalContent", WishTotalContent);
				url = "bookie/mypage.jsp";

			} else {
				if(id.equals(vo.getId())){
					bookingcount = BookingDAO.getInstance().getTotalBookingCount(vo.getId());
					session.setAttribute("bookingcount", bookingcount);
					ArrayList<VO> list= new ArrayList<VO>(); 
					list=SawWishDAO.getInstance().getSawBookSlideList(vo.getId());
					session.setAttribute("sawSlide", list);
					int SawTotalContent=SawWishDAO.getInstance().getSawTotalContent(vo.getId());
					int WishTotalContent=SawWishDAO.getInstance().getWishTotalContent(vo.getId());
					session.setAttribute("SawTotalContent", SawTotalContent);
					session.setAttribute("WishTotalContent", WishTotalContent);
					url = "bookie/mypage.jsp";
					
				}else{
					MemberVO fvo = MemberDAO.getInstance().getMemberById(id);
					request.setAttribute("fvo", fvo);
					bookingcount = BookingDAO.getInstance().getTotalBookingCount(fvo.getId());
					request.setAttribute("fbookingcount", bookingcount);
					ArrayList<VO> list= new ArrayList<VO>(); 
					list=SawWishDAO.getInstance().getSawBookSlideList(fvo.getId());
					request.setAttribute("fsawSlide", list);
					int SawTotal=SawWishDAO.getInstance().getSawTotalContent(fvo.getId());
					int WishTotal=SawWishDAO.getInstance().getWishTotalContent(fvo.getId());
					request.setAttribute("SawTotal", SawTotal);
					request.setAttribute("WishTotal", WishTotal);
					url = "bookie/mypage.jsp";

				}
				
			}

		}
		return url;
	}

}

