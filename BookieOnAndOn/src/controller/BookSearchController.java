package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BookDAO;
import model.BookVO;
import model.ListVO;
import model.PagingBean;
import model.VO;

public class BookSearchController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNo = request.getParameter("pageNo");
		
		String title = request.getParameter("title");
		int totalFindBookListCount = BookDAO.getInstance().getTotalFindBookListCount(title);
		System.out.println("아나 시발" + totalFindBookListCount);
		PagingBean pagingBean = null;

		if(pageNo == null){
			pagingBean = new PagingBean(totalFindBookListCount);
		}
		else{
			pagingBean = new PagingBean(totalFindBookListCount, Integer.parseInt(pageNo));
		}
		
		ArrayList<VO> findBookList =BookDAO.getInstance().findBookByTitle(title, pagingBean);
		
		ListVO lvo = new ListVO(findBookList, pagingBean);
		
		request.setAttribute("lvo", lvo);
		return "bookieOnAndOn/bookSearch.jsp";
	}

}
