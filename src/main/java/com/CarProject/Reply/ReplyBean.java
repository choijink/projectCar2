package com.CarProject.Reply;

public class ReplyBean {
	private int rIdx; // 댓글 식별번호
	private int bIdx ; // 게시판 식별번호
	private int mIdx ; // 회원 식별번호
	private String name;
    private String content;
    private String regdate;

	public ReplyBean() {
	}
	
	public int getrIdx() {
		return rIdx;
	}
	
	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}
	
	public int getRIdx() {
		return rIdx;
	}
	
	public void setRIdx(int rIdx) {
		this.rIdx = rIdx;
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
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

}

