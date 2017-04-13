package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookingDAO;

public class BookingCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String senderid=request.getParameter("senderid");
		String receiverid=request.getParameter("receiverid");
		boolean flag=false;
		flag=BookingDAO.getInstance().BookingCheck(senderid, receiverid);

		out.print(flag);
		out.close();
		
		return "AjaxView";
	}

}
