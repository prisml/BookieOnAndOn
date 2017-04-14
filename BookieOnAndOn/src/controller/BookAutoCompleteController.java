package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.BookDAO;
import model.VO;

public class BookAutoCompleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		String title = request.getParameter("title");
		PrintWriter out = response.getWriter();
		ArrayList<VO> bookAutoCompleteList = BookDAO.getInstance().getBookAutoCompleteList(title);
		JSONArray jsa = new JSONArray(bookAutoCompleteList);
		out.print(jsa);
		return "AjaxView";
	}
}

