package com.abhi.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.abhi.model.Vehicle;

@Component
public class VehicleDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	// Insert new vehicle
	@Transactional
	public String insertVehicle(Vehicle vehicle) {
		return (String) hibernateTemplate.save(vehicle);
	}

	// Delete vehicle by vehicleNo (primary key)
	@Transactional
	public void deleteVehicle(String vehicleNo) {
		Vehicle vehicle = hibernateTemplate.get(Vehicle.class, vehicleNo);
		if (vehicle != null) {
			hibernateTemplate.delete(vehicle);
		}
	}

	// Update vehicle
	@Transactional
	public void updateVehicle(Vehicle vehicle) {
		hibernateTemplate.update(vehicle);
	}

	// Get single vehicle by vehicleNo
	public Vehicle getVehicle(String vehicleNo) {
		return hibernateTemplate.get(Vehicle.class, vehicleNo);
	}

	// Get all vehicles
	public List<Vehicle> getAllVehicles() {
		return hibernateTemplate.loadAll(Vehicle.class);
	}

}
