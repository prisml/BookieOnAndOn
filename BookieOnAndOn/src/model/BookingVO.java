package model;

public class BookingVO {
	private String senderid;
	private String receiverid;
	public BookingVO() {
		super();
		// TODO Auto-generated constructor stub
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
	@Override
	public String toString() {
		return "BookingVO [senderid=" + senderid + ", receiverid=" + receiverid + "]";
	}
	
	

}
