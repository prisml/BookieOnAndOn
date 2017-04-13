package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;
import model.ListVO;
import model.PagingBean;
import model.VO;

public class MainController  implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String page = request.getParameter("pageNo");
		System.out.println(page);
		int pageNo=1;
		if(page!=null)
			pageNo = Integer.parseInt(page);
		System.out.println(pageNo);
		PagingBean pagingBean = new PagingBean(BookDAO.getInstance().getTotalBookCount(),pageNo);
		ArrayList<VO> list = BookDAO.getInstance().getAllBookList(pagingBean);
		ListVO listVo = new ListVO(list, pagingBean);
		request.setAttribute("listVo", listVo);	
		System.out.println("리스트컨트롤러에서리스트"+list);
		return "bookie/main.jsp";
	}
}







