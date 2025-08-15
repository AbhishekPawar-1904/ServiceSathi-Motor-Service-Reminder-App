package com.abhi.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Vehicle {
	@Override
	public String toString() {
		return "Vehicle [vehicleNo=" + vehicleNo + ", chassisNo=" + chassisNo + ", name=" + name + ", ownerName="
				+ ownerName + ", contact=" + contact + ", address=" + address + ", email=" + email + ", password="
				+ password + "]";
	}

	public Vehicle(String vehicleNo, String chassisNo, String name, String ownerName, String contact, String address,
			String email, String password) {
		super();
		this.vehicleNo = vehicleNo;
		this.chassisNo = chassisNo;
		this.name = name;
		this.ownerName = ownerName;
		this.contact = contact;
		this.address = address;
		this.email = email;
		this.password = password;
	}

	public Vehicle() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	private String vehicleNo; // Primary key

	private String chassisNo;
	private String name;
	private String ownerName;
	private String contact;
	private String address;

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public String getChassisNo() {
		return chassisNo;
	}

	public void setChassisNo(String chassisNo) {
		this.chassisNo = chassisNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	private String email;
	private String password;

}
