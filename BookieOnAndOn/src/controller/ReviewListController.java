package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.ListVO;
import model.PagingBean;
import model.ReviewDAO;
import model.VO;

public class ReviewListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String no = request.getParameter("bookno");
		String page = request.getParameter("page");
		if(page==null) page="1";
		PagingBean pb = new PagingBean(Integer.parseInt(page), 5, 5, ReviewDAO.getInstance().totalReviewCount(no));
		ArrayList<VO> list = ReviewDAO.getInstance().getReviewList(no,pb);
				
		ListVO listVO = new ListVO(list, pb);
		JSONObject json = new JSONObject(listVO);
		out.print(json);
		return "AjaxView";
	}

}
