package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SawWishDAO;

public class SawController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("saw controller");
		String no = request.getParameter("bookno");
		String id = request.getParameter("id");
		System.out.println(no + " " + id);
		String result = SawWishDAO.getInstance().saw(no,id);
		out.print(result);
		return "AjaxView";
	}
}
