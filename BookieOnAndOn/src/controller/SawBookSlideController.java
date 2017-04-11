package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.SawWishDAO;
import model.VO;

public class SawBookSlideController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		MemberVO vo=(MemberVO)session.getAttribute("mvo");
		System.out.println(vo);
		ArrayList<VO> list= new ArrayList<VO>(); 
		list=SawWishDAO.getInstance().getSawBookSlideList(vo.getId());
		System.out.println(list);
		
		
		
		
		return "AjaxView";
	}

}
