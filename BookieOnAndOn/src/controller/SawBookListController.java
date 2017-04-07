package controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ListVO;
import model.MemberVO;
import model.PagingBean;
import model.SawWishDAO;
import model.VO;

public class SawBookListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		String url = "";

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		if (vo == null) {

			url = "index.jsp";

		} else {
			int totalContent = SawWishDAO.getInstance().getSawTotalContent(vo.getId());
			String nowpage = request.getParameter("nowPage");
			if (nowpage == null) {
				nowpage = "1";
			}
			int nowPage = Integer.parseInt(nowpage);
			PagingBean pagingBean = new PagingBean(totalContent, nowPage);
			ArrayList<VO> list = SawWishDAO.getInstance().getSawBookList(vo.getId(), pagingBean);
			ListVO listvo = new ListVO(list, pagingBean);
			session.setAttribute("slistVO", listvo);
			url = "redirect:bookieOnAndOn/sawBookList.jsp";

		}

		return url;
	}

}
