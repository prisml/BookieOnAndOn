package controller;

public class HandlerMapping {
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping(){}
	public static HandlerMapping getInstance(){
		return instance;
	}
	public Controller create(String command){
		Controller c=null;
		System.out.println("command: "+command);
		if(command.equals("")) {
			c = new BookingListController();
		}
		return c;
	}
}