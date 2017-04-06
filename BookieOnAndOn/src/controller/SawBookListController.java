package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import model.ListVO;
import model.PagingBean;
import model.SawWishDAO;
import model.VO;


public class SawBookListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String id=request.getParameter("id");
		
		int totalContent=SawWishDAO.getInstance().getSawTotalContent(id);
			String nowpage=request.getParameter("nowPage");
			if(nowpage==null){
				nowpage="1";
			}
		int nowPage=Integer.parseInt(nowpage);
		PagingBean pagingBean=new PagingBean(totalContent,nowPage);
		ArrayList<VO> list=SawWishDAO.getInstance().getSawBookList(id,pagingBean);
		System.out.println("list~~~~~~~~~~~"+list);
		ListVO listvo=new ListVO(list,pagingBean);
		JSONObject json=new JSONObject(listvo);
		out.print(json.toString());
		System.out.print(json.toString());
		//out.print(listvo);
		out.close();
		
		
		return "AjaxView";
	}

}
