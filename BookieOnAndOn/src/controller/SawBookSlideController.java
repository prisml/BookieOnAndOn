package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import model.MemberVO;
import model.SawWishDAO;
import model.VO;

public class SawBookSlideController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		MemberVO vo=(MemberVO)session.getAttribute("mvo");
		ArrayList<VO> list= new ArrayList<VO>(); 
		list=SawWishDAO.getInstance().getSawBookSlideList(vo.getId());
		PrintWriter out=response.getWriter();
		JSONObject json=new JSONObject(list);
		out.print(json.toString());
		out.close();
		
		return "AjaxView";
	}

}
