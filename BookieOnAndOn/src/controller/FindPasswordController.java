package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

public class FindPasswordController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String id=request.getParameter("id");
		String password = MemberDAO.getInstance().findMemberByPw(id, name, tel);
		System.out.println(password);
		out.print(password);
		out.close();
		return "AjaxView";
}
}
