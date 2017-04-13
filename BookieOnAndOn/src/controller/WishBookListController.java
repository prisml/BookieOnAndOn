package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ListVO;
import model.MemberDAO;
import model.MemberVO;
import model.PagingBean;
import model.SawWishDAO;
import model.VO;

public class WishBookListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		response.setContentType("text/html;charset=utf-8");
		String id=null;
		String url = "";
		id=request.getParameter("id");

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		if (vo == null) {

			url = "index.jsp";

		} else {
			
			if(id==null){
				int totalContent = SawWishDAO.getInstance().getWishTotalContent(vo.getId());
				String nowpage = request.getParameter("nowPage");
				if (nowpage == null) {
					nowpage = "1";
				}
				int nowPage = Integer.parseInt(nowpage);
				PagingBean pagingBean = new PagingBean(totalContent, nowPage);

				ArrayList<VO> list = SawWishDAO.getInstance().getWishBookList(vo.getId(), pagingBean);
				ListVO listvo = new ListVO(list, pagingBean);
				session.setAttribute("listVO", listvo);
				url = "redirect:bookie/wishBookList.jsp";

				
			}else{
				int totalContent = SawWishDAO.getInstance().getWishTotalContent(id);
				String nowpage = request.getParameter("nowPage");
				if (nowpage == null) {
					nowpage = "1";
				}
				int nowPage = Integer.parseInt(nowpage);
				PagingBean pagingBean = new PagingBean(totalContent, nowPage);

				ArrayList<VO> list = SawWishDAO.getInstance().getWishBookList(id, pagingBean);
				ListVO listvo = new ListVO(list, pagingBean);
				request.setAttribute("flistVO", listvo);
				MemberVO fvo = MemberDAO.getInstance().getMemberById(id);
				request.setAttribute("fvo", fvo);
				
				url = "bookie/wishBookList.jsp";
				
			}
			
			
			
			
			
			
		}

		return url;
	}

}
