package controller;

public class HandlerMapping {
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping(){}
	public static HandlerMapping getInstance(){
		return instance;
	}
	public Controller create(String command){
		Controller c=null;
		if(command.equals("main")){
			c = new MainController();
		}else if(command.equals("login")){
			c = new LoginController();
		}else if(command.equals("register")){
			c = new RegisterController();
		}else if(command.equals("logout")){
			c = new LogOutController();
		}else if(command.equals("idCheck")){
			c = new IdCheckController();
		}

		return c;
	}
}