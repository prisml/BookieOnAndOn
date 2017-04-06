package controller;


public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();

	private HandlerMapping() {
	}

	public static HandlerMapping getInstance() {
		return instance;
	}

	public Controller create(String command) {
		Controller c = null;
		System.out.println(command+command.length());
		if (command.equals("main")) {
			c = new MainController();
		} else if(command.equals("sawBookList")){
			c= new SawBookListController();
		} else if (command.equals("genre")) {
			c = new GenreListController();
		} else if (command.equals("detail")) {
			c = new BookDetailController();
		} else if (command.equals("getReviewList")) {
			c = new GetReviewListController();
		}
		return c;
	}
}