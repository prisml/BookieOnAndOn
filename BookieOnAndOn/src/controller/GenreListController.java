package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.BookDAO;
import model.ListVO;
import model.PagingBean;
import model.VO;

public class GenreListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String genre=request.getParameter("genre");
		String page = request.getParameter("pageNo");
		PrintWriter out=response.getWriter();
		int pageNo=1;
		if(page!=null)
			pageNo = Integer.parseInt(page);
		PagingBean pagingBean = new PagingBean(BookDAO.getInstance().getGenreBookCount(genre),pageNo);
		ArrayList<VO> list = BookDAO.getInstance().getGenreBookList(genre, pagingBean);
		ListVO listVo = new ListVO(list, pagingBean);
		/*request.setAttribute("listVo", listVo);*/
		JSONObject json=new JSONObject(listVo);
		out.print(json.toString());
		out.close();
		return "AjaxView";
	}
}
