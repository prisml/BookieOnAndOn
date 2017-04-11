package model;

public class MemberVO implements VO{
	private String id;
	private String password;
	private String name;
	private String tel;

	public MemberVO(String id, String password, String name, String tel) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.tel = tel;
	}
	public MemberVO(String name, String tel, String id) {
		this.name = name;
		this.tel = tel;
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", tel=" + tel + "]";
	}
}
	
	



