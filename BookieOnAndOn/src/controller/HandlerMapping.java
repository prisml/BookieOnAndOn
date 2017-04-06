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
		}
		else if(command.equals("bookSearch")){
			c = new BookSearchController();
		}
		return c;
	}
}