package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

public class UpdateController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String tel=request.getParameter("tel");
		MemberVO vo=new MemberVO(id,password,name,tel);
		MemberDAO.getInstance().updateMember(vo);
		HttpSession session=request.getSession(false);
		if(session!=null){
			session.setAttribute("mvo", vo);		
		return "redirect:index.jsp";	
		}else{
			return "redirect:index.jsp";
		}
}
}
