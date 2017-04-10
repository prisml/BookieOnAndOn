package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class FindIdController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String id = MemberDAO.getInstance().findMemberById(name, tel);
		System.out.println(id);
		out.print(id);
		out.close();
		return "AjaxView";
	}
}
