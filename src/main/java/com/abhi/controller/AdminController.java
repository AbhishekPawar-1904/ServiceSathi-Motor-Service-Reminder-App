package com.abhi.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.abhi.dao.GarageDao;
import com.abhi.dao.VehicleDao;
import com.abhi.model.Garage;
import com.abhi.model.Vehicle;


@Controller
public class AdminController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	GarageDao garageDao=context.getBean("garageDao",GarageDao.class);
	Garage garage =new Garage();
	VehicleDao vehicleDao=context.getBean("vehicleDao",VehicleDao.class);
	Vehicle vehicle=new Vehicle();
	
	@RequestMapping("/")
	public String welcomepage()
	{
		System.out.println("index page is open");
		return "index";
	}

	@RequestMapping("/logout")
	public String logoutwelcomepage()
	{
		System.out.println("index page is open");
		return "index";
	}
	
	//admin Login
	@RequestMapping("/adminLogin")
	public String adminLoginPage()
	{
		System.out.println("adminpage is open");
		return "adminlogin";
	}
	@RequestMapping(path="/submitadminlogin", method=RequestMethod.POST)
	public String submitLogin(HttpServletRequest request)
	{
		String email=request.getParameter("email");
		String password =request.getParameter("password");
		if(email.equals("admin@gmail.com")&&password.equals("admin123"))
		{
			return"admindashboard";
		}
		else {
			return"index";
		}
		
	}

	//addGarage
	@RequestMapping("/addgarage")
	public String openaddGarage()
	{
		System.out.println("index page is open");
		return "addGarage";
	}
	@RequestMapping(path="/SubmitAddGarage", method=RequestMethod.POST)
	public String submitddNewAccount(HttpServletRequest request) {
	    Garage garage = new Garage(); // ✅ NEW object every request

	    garage.setContact(request.getParameter("contactId"));
	    garage.setName(request.getParameter("name"));
	    garage.setAddress(request.getParameter("address"));
	    garage.setPincode(request.getParameter("pincode"));
	    garage.setLatitude(request.getParameter("latitude"));
	    garage.setLongitude(request.getParameter("longitude"));
	    garage.setEmail(request.getParameter("email"));
	    garage.setPassword(request.getParameter("password"));

	    String i = garageDao.insertGarage(garage);
	    if (i!=null) {
	        System.out.println("Added successfully");
	        return "admindashboard";
	    }
	    else{
	    	return "addGarage";
	    }
	}
	
	
	//view garage
	@RequestMapping("/viewGarage")
	public String openViewAll(Model m)
	{
		List<Garage> allGarage = garageDao.getAllGarages();
		m.addAttribute("allGarage",allGarage);
		return "viewGarages";
	}	
	
	//delete account 
		@RequestMapping(path="/delete", method=RequestMethod.GET)
		public String deleteAccount(HttpServletRequest request)
		{
			String cid = request.getParameter("contact");
			garageDao.deleteGarage(cid);
			return "redirect:/viewGarage";
		}
		
		
		//search vehicle 
		@RequestMapping("/adminSearchVehicle")
	    public String searchVehiclePage() {
	        System.out.println("Opening Search Vehicle page...");
	        return "SearchVehicleAdmin";
	    }
		
		@RequestMapping(path="/Submitsearchvehicle",method=RequestMethod.GET)
		public String adminSerachVehicle(Model m,HttpServletRequest request)
		{
			String vehicleNo=request.getParameter("vehicleNo");
			if(vehicleNo!=null)
			{
				vehicle = vehicleDao.getVehicle(vehicleNo);
				m.addAttribute("vehicle",vehicle);
				return "SearchVehicleAdmin";
			}
			return vehicleNo;
			
		}
		
		//back to admin dash board 
		@RequestMapping("/backtoadmindashboard")
		public String backto()
		{
			
			return "admindashboard";
		}
		
}
