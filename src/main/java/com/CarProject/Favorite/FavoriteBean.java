package com.CarProject.Favorite;

public class FavoriteBean {
	private int cfIdx ; // 찜하기 식별번호
	private int mIdx ; // 회원 식별번호
	private int cIdx ; // 상세보기2 식별번호
	private String name;
	private String brand;
	private String carName;
	private String carImage;
	
	
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


	public int getcIdx() {
		return cIdx;
	}


	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBrand() {
		return brand;
	}


	public void setBrand(String brand) {
		this.brand = brand;
	}


	public String getCarName() {
		return carName;
	}


	public void setCarName(String carName) {
		this.carName = carName;
	}


	public String getCarImage() {
		return carImage;
	}


	public void setCarImage(String carImage) {
		this.carImage = carImage;
	}


	@Override
	public String toString() {
		return "FavoriteBean [cfIdx=" + cfIdx + ", mIdx=" + mIdx + ", cIdx=" + cIdx + ", name=" + name + ", brand="
				+ brand + ", carName=" + carName + ", carImage=" + carImage + "]";
	}

}
