package com.abhi.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Garage {
	@Id
	private String contact; // Assuming contact is unique and acts as the
							// primary key

	private String name;
	private String address;
	private String pincode;
	private String latitude;

	@Override
	public String toString() {
		return "Garage [contact=" + contact + ", name=" + name + ", address=" + address + ", pincode=" + pincode
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", email=" + email + ", password=" + password
				+ "]";
	}

	public Garage(String latitude) {
		super();
		this.latitude = latitude;
	}

	public Garage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String d) {
		this.contact = d;
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

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private String longitude;
	private String email;
	private String password;

}
