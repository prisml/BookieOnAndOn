package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

public class IdCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		System.out.println(id);
		PrintWriter out = response.getWriter();
		boolean flag = MemberDAO.getInstance().idCheck(id);
			if(flag == true){
				out.print("ok"); //사용가능
			}else{
				out.print("fail");// 사용불가
			}
		return "AjaxView";
	}

}
