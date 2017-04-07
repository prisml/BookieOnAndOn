package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookingDAO;
import model.ListVO;
import model.PagingBean;
import model.VO;

public class BookingListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		System.out.println("jsp Parameter: "+id);
		int receiverIdCount = BookingDAO.getInstance().getTotalBookingCount(id);
		String nowPage = request.getParameter("pageNo");
		System.out.println(nowPage);
		PagingBean pagingBean = null;
		if (nowPage == null){
			pagingBean = new PagingBean(receiverIdCount);
		} else {
			pagingBean = new PagingBean(receiverIdCount, Integer.parseInt(nowPage));
		}
		ArrayList<VO> receiverIdList = BookingDAO.getInstance().getBookingList(id,pagingBean);
		System.out.println("DAO에서 넘어 온 list: "+receiverIdList);
		System.out.println("receiverIdCount 수: "+receiverIdCount);
		ListVO listVO = new ListVO(receiverIdList, pagingBean);
		System.out.println(listVO);
		request.setAttribute("receiverIdList", listVO);
		request.setAttribute("receiverIdCount", receiverIdCount);
		request.setAttribute("id", id);
		return "bookieOnAndOn/booking_list.jsp";
	}

}
