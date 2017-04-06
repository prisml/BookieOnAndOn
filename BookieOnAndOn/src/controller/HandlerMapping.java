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
		System.out.println("command: "+command);
		if (command.equals("main")) {
			c = new MainController();
		} else if (command.equals("bookingList"))
			c = new BookingListController();
		return c;
	}
}