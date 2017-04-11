package model;

import java.sql.Blob;

public class BookVO implements VO{
	private String bookno;
	private String title;
	private String author;
	private String pub;
	private String pubdate;
	private String genre;
	private String summary;
	private double rate;
	private Blob bookcover;
	public BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BookVO(String title) {
		this.title = title;
	}

	public BookVO(String bookno, String title, String author, String pub, String pubdate, double rate){
		this.bookno = bookno;
		this.title = title;
		this.author = author;
		this.pub = pub;
		this.pubdate = pubdate;
		this.rate = rate;
	}
	
	public BookVO(String bookno, String title, String author, String pub, String pubdate, String genre, String summary,
			double rate, Blob bookcover) {
		super();
		this.bookno = bookno;
		this.title = title;
		this.author = author;
		this.pub = pub;
		this.pubdate = pubdate;
		this.genre = genre;
		this.summary = summary;
		this.rate = rate;
		this.bookcover = bookcover;
	}
	public BookVO(String bookno, String title, String author, String pub, String pubdate, String genre, String summary,
			double rate) {
		super();
		this.bookno = bookno;
		this.title = title;
		this.author = author;
		this.pub = pub;
		this.pubdate = pubdate;
		this.genre = genre;
		this.summary = summary;
		this.rate = rate;
	}
	public String getBookno() {
		return bookno;
	}
	public void setBookno(String bookno) {
		this.bookno = bookno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPub() {
		return pub;
	}
	public void setPub(String pub) {
		this.pub = pub;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public Blob getBookcover() {
		return bookcover;
	}
	public void setBookcover(Blob bookcover) {
		this.bookcover = bookcover;
	}
	
	@Override
	public String toString() {
		return "BookVO [bookno=" + bookno + ", title=" + title + ", author=" + author + ", pub=" + pub + ", pubdate="
				+ pubdate + ", genre=" + genre + ", summary=" + summary + ", rate=" + rate + ", bookcover=" + bookcover
				+ "]";
	}
}
