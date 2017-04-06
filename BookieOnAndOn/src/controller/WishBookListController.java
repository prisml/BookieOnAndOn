package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ListVO;
import model.PagingBean;
import model.SawWishDAO;
import model.VO;

public class WishBookListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
			String java="java";
		int totalContent=SawWishDAO.getInstance().getWishTotalContent(java);
			String nowpage=request.getParameter("nowPage");
			if(nowpage==null){
				nowpage="1";
			}
		int nowPage=Integer.parseInt(nowpage);
		PagingBean pagingBean=new PagingBean(totalContent,nowPage);
		
		ArrayList<VO> list=SawWishDAO.getInstance().getWishBookList(java, pagingBean);
		System.out.println("list~~~~~~~~~~~"+list);
		ListVO listvo=new ListVO(list,pagingBean);
		System.out.println(listvo.getList());
		request.setAttribute("listVO", listvo);
		
		return "bookieOnAndOn/wishBookList.jsp";
	}

}
