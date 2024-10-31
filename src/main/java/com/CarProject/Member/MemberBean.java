package com.CarProject.Member;

public class MemberBean {
	private int mIdx ; // 회원 식별번호
	private String name ; // 이름
	private int age ; // 나이
	private int residentNumber; // 주민번호
	private String gender ; // 성별
	private String address ; // 주소
	private String phone ; // 핸드폰 번호
	private String mail ; // 이메일 주소
	private String id ; // 아이디
	private String password ; // 비밀번호
	private String adminCheck; // 관리자여부 ( 1: 일반회원, 2: 관리자)
	
	
	public MemberBean() {
	}
	

	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getresidentNumber() {
		return residentNumber;
	}
	public void setresidentNumber(int residentNumber) {
		this.residentNumber = residentNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
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
	public String getadminCheck() {
		return adminCheck;
	}
	public void setadminCheck(String adminCheck) {
		this.adminCheck = adminCheck;
	}


	@Override
	public String toString() {
		return "MemberBean [mIdx=" + mIdx + ", name=" + name + ", age=" + age + ", residentNumber=" + residentNumber
				+ ", gender=" + gender + ", address=" + address + ", phone=" + phone + ", mail=" + mail + ", id=" + id
				+ ", password=" + password + ", adminCheck=" + adminCheck + "]";
	}
	
	
	
	
}
