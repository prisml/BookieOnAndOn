package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SawWishDAO;

public class WishController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String no = request.getParameter("bookno");
		String id = request.getParameter("id");
		String result = SawWishDAO.getInstance().wish(no,id);
		out.print(result);
		return "AjaxView";
	}

}
