package com.khadri.mart.grosary.form;

public class GrosaryForm {

	private String grosaryName;
	private int grosaryQty;
	private Double grosaryPrice;

	public GrosaryForm(String grosaryName, int grosaryQty, Double grosaryPrice) {
		super();
		this.grosaryName = grosaryName;
		this.grosaryQty = grosaryQty;
		this.grosaryPrice = grosaryPrice;
	}

	public String getGrosaryName() {
		return grosaryName;
	}

	public int getGrosaryQty() {
		return grosaryQty;
	}

	public Double getGrosaryPrice() {
		return grosaryPrice;
	}

	public void setGrosaryName(String grosaryName) {
		this.grosaryName = grosaryName;
	}

	public void setGrosaryQty(int grosaryQty) {
		this.grosaryQty = grosaryQty;
	}

	public void setGrosaryPrice(Double grosaryPrice) {
		this.grosaryPrice = grosaryPrice;
	}

}
