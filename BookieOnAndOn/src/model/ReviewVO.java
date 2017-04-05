package model;

public class ReviewVO implements VO{
	private String bookno;
	private String id;
	private int star;
	private String rvcontent;
	private String rvdate;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(String bookno, String id, int star, String rvcontent, String rvdate) {
		super();
		this.bookno = bookno;
		this.id = id;
		this.star = star;
		this.rvcontent = rvcontent;
		this.rvdate = rvdate;
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
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getRvcontent() {
		return rvcontent;
	}
	public void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}
	public String getRvdate() {
		return rvdate;
	}
	public void setRvdate(String rvdate) {
		this.rvdate = rvdate;
	}
	@Override
	public String toString() {
		return "ReviewVO [bookno=" + bookno + ", id=" + id + ", star=" + star + ", rvcontent=" + rvcontent + ", rvdate="
				+ rvdate + "]";
	}
	
	
	
	
	

}
