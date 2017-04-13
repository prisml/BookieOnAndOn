package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		MemberVO vo=new MemberVO(id,password,name,tel);	
		MemberDAO.getInstance().register(vo);
		return "redirect:bookie/register_result.jsp";
	}

}


