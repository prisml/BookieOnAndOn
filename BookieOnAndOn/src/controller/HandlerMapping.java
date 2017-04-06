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
		} else if (command.equals("bookingList")){
			c = new BookingListController();
		} else if(command.equals("bookSearch")){
			c = new BookSearchController();
		} else if(command.equals("sawBookList")){
			c = new SawBookListController();
		} else if(command.equals("wishBookList")){
			c = new WishBookListController();
		} else if (command.equals("genre")) {
			c = new GenreListController();
		} else if (command.equals("detail")) {
			c = new BookDetailController();
		} else if (command.equals("getReviewList")) {
			c = new GetReviewListController();
		} else if(command.equals("mypage")){
			c = new MyPageController();
		}
		return c;
	}
}