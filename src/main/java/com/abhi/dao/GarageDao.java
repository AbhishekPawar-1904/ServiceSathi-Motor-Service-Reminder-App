package com.abhi.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.abhi.model.Garage;

@Component
public class GarageDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	// Insert new garage
	@Transactional
	public String insertGarage(Garage garage) {
		return (String) hibernateTemplate.save(garage);
	}

	// Delete garage by contact ID
	@Transactional
	public void deleteGarage(String contactId) {
		Garage garage = hibernateTemplate.get(Garage.class, contactId);
		if (garage != null) {
			hibernateTemplate.delete(garage);
		}
	}

	// Update garage
	@Transactional
	public void updateGarage(Garage garage) {
		hibernateTemplate.update(garage);
	}

	// Get single garage by contact ID
	public Garage getGarage(String contactId) {
		return hibernateTemplate.get(Garage.class, contactId);
	}

	// Get all garages
	public List<Garage> getAllGarages() {
		return hibernateTemplate.loadAll(Garage.class);
	}

}
