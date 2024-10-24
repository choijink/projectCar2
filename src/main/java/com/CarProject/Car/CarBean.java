package com.CarProject.Car;

public class CarBean {
//	 car main
	private int cIdx ; // 차량 식별 번
	private String domesticImport ; // 국내/수
	private String brand ; // 브랜
	private String vehicleSize ; // 차량크기(대형, 중형, 등등...)
	private String carModel ; // 차종(세단, 스포, 등등...)
	private String carName ; // 모델명(k5, AMG A클래스, 등등...)
	private String brandMark ; // 브랜드 로고 이미
	private String carImage ; // 차량 이미
	

//	 cardetail1
	private int cd1Idx ; //
	private String fuelType ; // 유종(가솔린, 디젤, EV)
	private String displacement ; // 배기량
	private String fuelEfficiency ; // 유종(가솔린, 디젤, EV)
	private String seatingCapacity ; // 인승
	private String engineType ; // 엔진형식
	private String driveType ; // 구동방식(사륜, 전륜, 후륜)
	private String maxPower ; // 최고 출력
	private String maxTorque ; // 최고 토크
	private String length ; // 전장
	private String width ; // 전폭
	private String height ; // 전고
	private String wheelBase ; // 축거
	private String curbWeight ; // 공차중량
	private String grade ; // 등급
	
	
//	 cardetail2
	private int cd2Idx ; //
	private String trim ; // 트림
	private String price ; // 가격
	
	
	
	public CarBean() {
		
	}
	
	

	public int getcIdx() {
		return cIdx;
	}
	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}
	public String getDomesticImport() {
		return domesticImport;
	}
	public void setDomesticImport(String domesticImport) {
		this.domesticImport = domesticImport;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getVehicleSize() {
		return vehicleSize;
	}
	public void setVehicleSize(String vehicleSize) {
		this.vehicleSize = vehicleSize;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getBrandMark() {
		return brandMark;
	}
	public void setBrandMark(String brandMark) {
		this.brandMark = brandMark;
	}
	public String getCarImage() {
		return carImage;
	}
	public void setCarImage(String carImage) {
		this.carImage = carImage;
	}
	public int getCd1Idx() {
		return cd1Idx;
	}
	public void setCd1Idx(int cd1Idx) {
		this.cd1Idx = cd1Idx;
	}
	public String getFuelType() {
		return fuelType;
	}
	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}
	public String getDisplacement() {
		return displacement;
	}
	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}
	public String getFuelEfficiency() {
		return fuelEfficiency;
	}
	public void setFuelEfficiency(String fuelEfficiency) {
		this.fuelEfficiency = fuelEfficiency;
	}
	public String getSeatingCapacity() {
		return seatingCapacity;
	}
	public void setSeatingCapacity(String seatingCapacity) {
		this.seatingCapacity = seatingCapacity;
	}
	public String getEngineType() {
		return engineType;
	}
	public void setEngineType(String engineType) {
		this.engineType = engineType;
	}
	public String getDriveType() {
		return driveType;
	}
	public void setDriveType(String driveType) {
		this.driveType = driveType;
	}
	public String getMaxPower() {
		return maxPower;
	}
	public void setMaxPower(String maxPower) {
		this.maxPower = maxPower;
	}
	public String getMaxTorque() {
		return maxTorque;
	}
	public void setMaxTorque(String maxTorque) {
		this.maxTorque = maxTorque;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWheelBase() {
		return wheelBase;
	}
	public void setWheelBase(String wheelBase) {
		this.wheelBase = wheelBase;
	}
	public String getCurbWeight() {
		return curbWeight;
	}
	public void setCurbWeight(String curbWeight) {
		this.curbWeight = curbWeight;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getCd2Idx() {
		return cd2Idx;
	}
	public void setCd2Idx(int cd2Idx) {
		this.cd2Idx = cd2Idx;
	}
	public String getTrim() {
		return trim;
	}
	public void setTrim(String trim) {
		this.trim = trim;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	@Override
	public String toString() {
		return "CarBean [cIdx=" + cIdx + ", domesticImport=" + domesticImport + ", brand=" + brand + ", vehicleSize="
				+ vehicleSize + ", carModel=" + carModel + ", carName=" + carName + ", brandMark=" + brandMark
				+ ", carImage=" + carImage + ", cd1Idx=" + cd1Idx + ", fuelType=" + fuelType + ", displacement="
				+ displacement + ", fuelEfficiency=" + fuelEfficiency + ", seatingCapacity=" + seatingCapacity
				+ ", engineType=" + engineType + ", driveType=" + driveType + ", maxPower=" + maxPower + ", maxTorque="
				+ maxTorque + ", length=" + length + ", width=" + width + ", height=" + height + ", wheelBase="
				+ wheelBase + ", curbWeight=" + curbWeight + ", grade=" + grade + ", cd2Idx=" + cd2Idx + ", trim="
				+ trim + ", price=" + price + "]";
	}

	
	
	
	
}
