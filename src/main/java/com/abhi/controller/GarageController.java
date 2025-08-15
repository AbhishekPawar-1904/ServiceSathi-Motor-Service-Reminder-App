package com.abhi.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.abhi.dao.GarageDao;
import com.abhi.dao.VehicleDao;
import com.abhi.dao.WorkLogDao;
import com.abhi.model.Garage;
import com.abhi.model.Vehicle;
import com.abhi.model.WorkLog;

@Controller
public class GarageController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	GarageDao garageDao = context.getBean("garageDao", GarageDao.class);
	VehicleDao vehicleDao = context.getBean("vehicleDao", VehicleDao.class);
	WorkLogDao workLogDao = context.getBean("workLogDao", WorkLogDao.class);

	Vehicle vehicle = new Vehicle();
	WorkLog workLog = new WorkLog();

	// Garage login page
	@RequestMapping("/garageLogin")
	public String garageLoginPage() {
		return "garageLogin";
	}

	// Submit garage login
	@RequestMapping(path = "/submitgaragelogin", method = RequestMethod.POST)
	public String submitLogin(HttpServletRequest request, Model model, HttpSession session) {
		String contact = request.getParameter("contact");
		String password = request.getParameter("password");

		Garage garage = garageDao.getGarage(contact);

		if (garage != null && garage.getPassword().equals(password)) {
			session.setAttribute("garageContact", garage.getContact());
			session.setAttribute("garageAddress", garage.getAddress());
			model.addAttribute("garage", garage);
			return "garageDashboard";
		} else {
			return "index";
		}
	}

	// Add Vehicle
	@RequestMapping("/addvehicle")
	public String openaddVehicle() {
		return "addVehicles";
	}

	@RequestMapping(path = "/SubmitAddVehicle", method = RequestMethod.POST)
	public String submitAddNewVehicle(HttpServletRequest request) {
		vehicle.setVehicleNo(request.getParameter("vehicleNo"));
		vehicle.setChassisNo(request.getParameter("chassisNo"));
		vehicle.setName(request.getParameter("name"));
		vehicle.setOwnerName(request.getParameter("ownerName"));
		vehicle.setContact(request.getParameter("contact"));
		vehicle.setAddress(request.getParameter("address"));
		vehicle.setEmail(request.getParameter("email"));
		vehicle.setPassword(request.getParameter("password"));

		String i = vehicleDao.insertVehicle(vehicle);
		return (i != null) ? "garageDashboard" : "addVehicles";
	}

	// Search Vehicle
	@RequestMapping("/GarageSearchVehicle")
	public String searchVehiclePage() {
		return "SearchVehicle";
	}

	@RequestMapping(path = "/Submitsearch", method = RequestMethod.GET)
	public String searchVehicle(Model m, HttpServletRequest request) {
		String vehicleNo = request.getParameter("vehicleNo");
		if (vehicleNo != null) {
			vehicle = vehicleDao.getVehicle(vehicleNo);
			m.addAttribute("vehicle", vehicle);
			return "SearchVehicle";
		}
		return vehicleNo;
	}

	// Return to dashboard
	@RequestMapping("/backtogaragedashboard")
	public String backToDashboard() {
		return "garageDashboard";
	}

	// Add Work Log
	@RequestMapping("/openworklog")
	public String openWorkLogPage() {
		return "addWorkLog";
	}

	@RequestMapping(path = "/SubmitAddWorkLog", method = RequestMethod.POST)
	public String addWorkLog(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String garageContact = (String) session.getAttribute("garageContact");
		String garageAddress = (String) session.getAttribute("garageAddress");

		workLog.setVehicleNo(request.getParameter("vehicleNo"));
		workLog.setTitle(request.getParameter("title"));
		workLog.setDescription(request.getParameter("description"));
		workLog.setDate(request.getParameter("date"));
		workLog.setTime(request.getParameter("time"));
		workLog.setEmail(request.getParameter("email"));
		workLog.setContact(request.getParameter("contact"));
		workLog.setAddress(garageAddress);
		workLog.setGarageContact(garageContact);
		workLog.setDueDate(request.getParameter("dueDate"));

		int i = workLogDao.insertWorkLog(workLog);
		return (i > 0) ? "garageDashboard" : "addWorkLog";
	}

	// Search Work Log
	@RequestMapping("/OpenSearchVehicleWorkLog")
	public String searchWorkLogPageOpen() {
		return "SearchVehicleWorkLog";
	}

	@RequestMapping(path = "/SearchWorkLog", method = RequestMethod.POST)
	public String searchWorkLogByVehicleNo(@RequestParam("vehicleNo") String vehicleNo, Model m) {
		List<WorkLog> logs = workLogDao.getWorkLogsByVehicleNo(vehicleNo);
		m.addAttribute("logs", logs);
		m.addAttribute("vehicleNo", vehicleNo);
		return "SearchVehicleWorkLog";
	}

	// View Nearby Expiring Work Logs
	@RequestMapping("/nearbyexpiry")
	public String showNearbyExpiringWorkLogs(HttpSession session, Model model) {
		String garageContact = (String) session.getAttribute("garageContact");

		if (garageContact == null || garageContact.trim().isEmpty()) {
			return "redirect:/garageLogin";
		}

		List<WorkLog> expiringLogs = workLogDao.getNearbyExpiryWorkLogs(garageContact);
		model.addAttribute("expiringLogs", expiringLogs);
		return "nearbyExpiryLogs";
	}

	@RequestMapping("/garageExpired")
	public String showExpiredLogs(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String contact = (String) session.getAttribute("garageContact");

		if (contact == null) {
			return "redirect:/garageLogin"; // Not logged in
		}

		List<WorkLog> expiredLogs = workLogDao.getExpiredWorkLogs(contact);
		model.addAttribute("expiredLogs", expiredLogs);

		return "expiredworklogs"; // This must match the JSP filename without
									// `.jsp`
	}

}
