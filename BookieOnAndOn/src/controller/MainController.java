package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController  implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		return "bookieOnAndOn/main.jsp";
	}
}







