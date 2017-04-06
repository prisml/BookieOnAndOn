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
		if (command.equals("main")) {
			c = new MainController();
		} else if (command.equals("genre")) {
			c = new GenreListController();
		} else if (command.equals("detail")) {
			c = new BookDetailController();
		} else if (command.equals("getReviewList")) {
			c = new GetReviewListController();
		} else if(command.equals("saw")) {
			c = new SawController();
		} else if(command.equals("wish")) {
			c = new WishController();
		}
		return c;
	}
}