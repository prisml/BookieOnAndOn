package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		MemberVO vo = MemberDAO.getInstance().login(id, password);
		String path=null;
		if(vo!=null){
			HttpSession session=request.getSession();
			session.setAttribute("mvo", vo);
			path="redirect:DispatcherServlet?command=main";
		}else{			
			path="redirect:bookieOnAndOn/login.jsp";
		}
		return path;
	}

}
