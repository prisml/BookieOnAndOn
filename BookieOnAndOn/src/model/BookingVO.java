package model;

public class BookingVO implements VO{
	private String senderid;
	private String receiverid;
	private int receiveridcount;
	public BookingVO() {
		super();
	}
	public BookingVO(int receiveridcount) {
		this.receiveridcount = receiveridcount;
	}
	public BookingVO(String senderid, String receiverid) {
		super();
		this.senderid = senderid;
		this.receiverid = receiverid;
	}
	public String getSenderid() {
		return senderid;
	}
	public void setSenderid(String senderid) {
		this.senderid = senderid;
	}
	public String getReceiverid() {
		return receiverid;
	}
	public void setReceiverid(String receiverid) {
		this.receiverid = receiverid;
	}
	public int getReceiveridcount() {
		return receiveridcount;
	}
	public void setReceiveridcount(int receiveridcount) {
		this.receiveridcount = receiveridcount;
	}
	@Override
	public String toString() {
		return "BookingVO [senderid=" + senderid + ", receiverid=" + receiverid + ", receiveridcount=" + receiveridcount
				+ "]";
	}
}
