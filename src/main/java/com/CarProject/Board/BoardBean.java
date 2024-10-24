package com.CarProject.Board;

public class BoardBean {
	private int bIdx ; // 게시판 식별번호
	private int mIdx ; // 회원 식별번호
	private String title ; // 제목
	private String content ; // 내용
	private String image1 ; // 이미지1
	private String image2 ; // 이미지2
	private String image3 ; // 이미지3
	private String announcement ; // 공지사항
	
	
	public BoardBean() {
	}
	
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getAnnouncement() {
		return announcement;
	}
	public void setAnnouncement(String announcement) {
		this.announcement = announcement;
	}
	
	@Override
	public String toString() {
		return "BoardBean [bIdx=" + bIdx + ", mIdx=" + mIdx + ", title=" + title + ", content=" + content + ", image1="
				+ image1 + ", image2=" + image2 + ", image3=" + image3 + ", announcement=" + announcement + "]";
	}
	
}