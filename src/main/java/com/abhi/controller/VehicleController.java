package com.abhi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List; // Ensure this import exists
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.abhi.dao.VehicleDao;
import com.abhi.dao.WorkLogDao;
import com.abhi.model.Vehicle;
import com.abhi.model.WorkLog;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Controller
public class VehicleController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");

	VehicleDao vehicleDao = context.getBean("vehicleDao", VehicleDao.class);
	WorkLogDao workLogDao = context.getBean("workLogDao", WorkLogDao.class);

	// 👇 Open vehicle login page
	@RequestMapping("/vehicleLoginOpen")
	public String vehicleLoginOpen() {
		System.out.println("Vehicle login page opened");
		return "vehicleLogin";
	}

	@RequestMapping("/backtodashoardV")
	public String backtodashboard() {
		return "vehicleDashboard";
	}

	// 👇 Handle vehicle login form submission
	@RequestMapping(path = "/submitvehiclelogin", method = RequestMethod.POST)
	public String submitLogin(HttpServletRequest request, Model model, HttpSession session) {
		String vehicleNo = request.getParameter("vehicleNo");
		String password = request.getParameter("password");

		Vehicle vehicle = vehicleDao.getVehicle(vehicleNo);

		if (vehicle != null && vehicle.getPassword().equals(password)) {
			session.setAttribute("garageContact", vehicle.getVehicleNo());
			session.setAttribute("garageAddress", vehicle.getName());
			model.addAttribute("garage", vehicle);
			return "vehicleDashboard";
		} else {
			model.addAttribute("error", "Invalid vehicle number or password.");
			return "vehicleLogin";
		}
	}

	// 👇 View all work logs for the logged-in vehicle (Fixed for Java <1.7)
	@RequestMapping("/viewvehicleworklogs")
	public String viewVehicleWorkLogs(HttpSession session, Model model) {
		String vehicleNo = (String) session.getAttribute("garageContact");

		if (vehicleNo == null) {
			return "redirect:/vehicleLoginOpen";
		}

		// Replaced stream with traditional loop
		List<WorkLog> allLogs = workLogDao.getAllWorkLogs();
		List<WorkLog> vehicleLogs = new ArrayList<WorkLog>(); // Explicit type

		for (WorkLog log : allLogs) {
			if (vehicleNo.equals(log.getVehicleNo())) {
				vehicleLogs.add(log);
			}
		}

		model.addAttribute("workLogs", vehicleLogs);
		return "viewvehicleworklogs";
	}

	// ✅ View nearby expiry work logs (due within next 30 days)
	@RequestMapping("/viewvehiclenearbyexpirylogs")
	public String viewNearbyExpiryLogs(HttpSession session, Model model) {
		String vehicleNo = (String) session.getAttribute("garageContact");

		if (vehicleNo == null) {
			return "redirect:/vehicleLoginOpen";
		}

		List<WorkLog> allLogs = workLogDao.getAllWorkLogs();
		List<WorkLog> nearbyLogs = new ArrayList<WorkLog>(); // Explicit type

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(today);
		calendar.add(Calendar.DAY_OF_MONTH, 30);
		Date next30Days = calendar.getTime();

		for (WorkLog log : allLogs) {
			if (!vehicleNo.equals(log.getVehicleNo()))
				continue;

			String dueDateStr = log.getDueDate();
			if (dueDateStr == null || dueDateStr.trim().isEmpty())
				continue;

			try {
				Date dueDate = sdf.parse(dueDateStr.trim());
				if (!dueDate.before(today) && !dueDate.after(next30Days)) {
					nearbyLogs.add(log);
				}
			} catch (ParseException e) {
				System.out.println("Invalid date format: " + dueDateStr);
			}
		}

		model.addAttribute("workLogs", nearbyLogs);
		return "viewvehiclenearbyexpirylogs";
	}

	// ✅ View expired work logs (due date is before today)
	@RequestMapping("/viewexpiredvehicleworklogs")
	public String viewExpiredVehicleWorkLogs(HttpSession session, Model model) {
		String vehicleNo = (String) session.getAttribute("garageContact");

		if (vehicleNo == null) {
			return "redirect:/vehicleLoginOpen";
		}

		List<WorkLog> allLogs = workLogDao.getAllWorkLogs();
		List<WorkLog> expiredLogs = new ArrayList<WorkLog>(); // Explicit type

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();

		for (WorkLog log : allLogs) {
			if (!vehicleNo.equals(log.getVehicleNo()))
				continue;

			String dueDateStr = log.getDueDate();
			if (dueDateStr == null || dueDateStr.trim().isEmpty())
				continue;

			try {
				Date dueDate = sdf.parse(dueDateStr.trim());
				if (dueDate.before(today)) {
					expiredLogs.add(log);
				}
			} catch (ParseException e) {
				System.out.println("Invalid date format: " + dueDateStr);
			}
		}

		model.addAttribute("workLogs", expiredLogs);
		return "viewexpiredvehicleworklogs";
	}
}