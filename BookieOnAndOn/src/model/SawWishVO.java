package model;

public class SawWishVO implements VO{
	private String bookno; 
	private String id;
	public SawWishVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SawWishVO(String bookno, String id) {
		super();
		this.bookno = bookno;
		this.id = id;
	}
	public String getBookno() {
		return bookno;
	}
	public void setBookno(String bookno) {
		this.bookno = bookno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "SawWishVO [bookno=" + bookno + ", id=" + id + "]";
	}
	
	

}
