package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookingDAO;

public class AddBookingController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String senderid=request.getParameter("senderid");
		String receiverid=request.getParameter("receiverid");
		System.out.println(senderid+receiverid);
		boolean flag=false;
		flag=BookingDAO.getInstance().BookingCheck(senderid, receiverid);
		PrintWriter out=response.getWriter();
		if(flag==true){
			BookingDAO.getInstance().addBooking(senderid, receiverid);
			out.println("booking 되었습니다");
		}else{
			out.println("이미 booking 되어 있습니다");
			
		}
		
		out.close();
	
		return "AjaxView";
	}

}
