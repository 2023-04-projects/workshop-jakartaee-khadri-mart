package com.khadri.mart.fruits.form;

public class FruitsForm {
	private String itemName;
	private int itemQty;
	private Double itemPrice;
	
	
	public FruitsForm(String itemName, int itemQty, Double itemPrice) {
		super();
		this.itemName = itemName;
		this.itemQty = itemQty;
		this.itemPrice = itemPrice;
	}

	public String getItemName() {
		return itemName;
	}
	 
	public int getItemQty() {
		return itemQty;
	}
	  
	public Double getItemPrice() {
		return itemPrice;
	}
	 
}
