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
		if(command.equals("genre")){
			c = new GenreListController();
	}
		return c;
	}
}