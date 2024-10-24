package com.CarProject.Favorite;

public class FavoriteBean {
	private int cfIdx ; // 찜하기 식별번호
	private int mIdx ; // 회원 식별번호
	private int cd2Idx ; // 상세보기2 식별번호
	
	
	public FavoriteBean() {
	}
	
	
	public int getCfIdx() {
		return cfIdx;
	}
	public void setCfIdx(int cfIdx) {
		this.cfIdx = cfIdx;
	}
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public int getCd2Idx() {
		return cd2Idx;
	}
	public void setCd2Idx(int cd2Idx) {
		this.cd2Idx = cd2Idx;
	}
	@Override
	public String toString() {
		return "FavoriteBean [cfIdx=" + cfIdx + ", mIdx=" + mIdx + ", cd2Idx=" + cd2Idx + "]";
	}
}
