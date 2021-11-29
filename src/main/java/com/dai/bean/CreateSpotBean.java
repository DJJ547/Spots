package com.dai.bean;

public class CreateSpotBean {
	private String name;
	private String address;
	private String city;
	private String zipcode;
	
	public CreateSpotBean() {
		super();
	}
	
	public CreateSpotBean(String name, String address, String city, String zipcode) {
		this.name = name;
		this.address = address;
		this.city = city;
		this.zipcode = zipcode;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
}
