package controller;

public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();

	private HandlerMapping() {
	}

	public static HandlerMapping getInstance() {
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
		} else if (command.equals("bookingList")){
			c = new BookingListController();
		} else if(command.equals("bookSearch")){
			c = new BookSearchController();
		} else if(command.equals("bookAutoComplete")){
			c = new BookAutoCompleteController();
		} else if(command.equals("sawBookList")){
			c = new SawBookListController();
		} else if(command.equals("wishBookList")){
			c = new WishBookListController();
		} else if (command.equals("genre")) {
			c = new GenreListController();
		} else if (command.equals("detail")) {
			c = new BookDetailController();
		} else if (command.equals("getReviewList")) {
			c = new ReviewListController();
		} else if(command.equals("saw")) {
			c = new SawController();
		} else if(command.equals("wish")) {
			c = new WishController();
		} else if(command.equals("mypage")){
			c = new MyPageController();
		} else if(command.equals("reviewRegist")){
			c = new ReviewRegistController();
		} else if(command.equals("reviewUpdate")){
			c = new ReviewUpdateController();
		} else if(command.equals("reviewDelete")){
			c = new ReviewDeleteController();
		} else if(command.equals("update")){
			c = new UpdateController();
		} else if(command.equals("findId")){
			c= new FindIdController();
		} else if(command.equals("findPw")){
			c= new FindPasswordController();
		} else if(command.equals("reviewRead")){
			c = new ReviewReadController();
		} else if(command.equals("bookingMemberDelete")){
			c = new BookingMemberDeleteController();
		} else if(command.equals("getWish")){
			c = new GetWishController();
		} else if(command.equals("getSaw")){
			c = new GetSawController();
		} else if(command.equals("addBooking")){
			c = new AddBookingController();
		} else if(command.equals("bookingCheck")){
			c = new BookingCheckController();
		}
		return c;
	}
}