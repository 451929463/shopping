package cn.tri.shop.pojo;

public class User {
	private int uid ;
	private String uname ;
	private String upwd ;
	
	private String email ;
	private String sex ;
	private String realname ;
				
	private String phonenum ;
	private int activenum ;
	private int activestatus ;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public int getActivenum() {
		return activenum;
	}
	public void setActivenum(int activenum) {
		this.activenum = activenum;
	}
	public int getActivestatus() {
		return activestatus;
	}
	public void setActivestatus(int activestatus) {
		this.activestatus = activestatus;
	}
	
	
	public User() {
		super();
	}
	public User(int uid, String uname, String upwd, String email, String sex,
			String realname, String phonenum, int activenum, int activestatus) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upwd = upwd;
		this.email = email;
		this.sex = sex;
		this.realname = realname;
		this.phonenum = phonenum;
		this.activenum = activenum;
		this.activestatus = activestatus;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upwd=" + upwd
				+ ", email=" + email + ", sex=" + sex + ", realname="
				+ realname + ", phonenum=" + phonenum + ", activenum="
				+ activenum + ", activestatus=" + activestatus + "]";
	}
}
