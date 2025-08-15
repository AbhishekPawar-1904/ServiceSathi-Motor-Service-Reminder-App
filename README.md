# ServiceSathi: Motor Service Reminder App

## 📌 Overview
**ServiceSathi** is a comprehensive **Motor Service Reminder application** built to streamline the process of managing vehicle maintenance and service schedules.  
It bridges the gap between **vehicle owners**, **garages**, and **administrators** by providing a centralized platform for service tracking, work log management, and timely reminders.

With ServiceSathi, garages can efficiently log work details, track upcoming and overdue services, and maintain customer records.  
Vehicle owners can view their service history, receive reminders for upcoming maintenance, and ensure their vehicles remain in optimal condition.  
Administrators can manage registered garages, monitor service activities, and assist with vehicle-related queries.

The system supports three distinct roles, each with specific features:  
- **Admin**: Manage garages and oversee vehicle data.  
- **Garage**: Add vehicles, log services, and track due dates.  
- **Vehicle Owner**: Access service history and receive timely reminders.

By automating reminders and providing a structured work log system, **ServiceSathi** reduces manual follow-ups, improves customer satisfaction, and ensures that vehicle maintenance is never overlooked.


---

## 🎯 Features

### **Admin**
- Login
- Add, View, Delete Garage
- Search Vehicle

### **Garage**
- Login (using contact & password)
- Add Vehicle
- Search Vehicle
- Add Work Log
- Search Vehicle Work Log
- View Nearby (1 month) Expiry Work Logs
- View Expired Work Logs

### **Vehicle Owner**
- Login (using vehicleNo & password)
- View Work Logs
- View Nearby (1 month) Expiry Work Logs
- View Expired Work Logs

---

## 🗄 Database Design

| Table Name | Columns |
|------------|---------|
| **Garage** | contact **(PK)**, name, address, pincode, latitude, longitude, email, password |
| **Vehicle** | vehicleNo **(PK)**, chassisNo, name, ownerName, contact, address, email, password |
| **WorkLog** | vehicleNo, title, description, date, time, email, contact, address, garageContact, dueDate |

---

## 🛠 Tech Stack
- **Backend**: Java (Spring MVC )
- **Frontend**: JSP, HTML, CSS
- **Database**: MySQL (XAMPP/phpMyAdmin)
- **Server**: Apache Tomcat
- **Build Tool**: Maven

---

## 🚀 Installation & Setup
1. **Clone the repository**
   ```bash
   git clone https://github.com/AbhishekPawar-1904/ServiceSathi-Motor-Service-Reminder-App.git
   cd ServiceSathi-Motor-Service-Reminder-App

 ### 2. Import into IDE
- Open **Eclipse**
- Select **Import** → **Existing Maven Project**.
- Choose the project folder.

### 3. Configure Database
- Create a **MySQL database**.
- Import the provided SQL script: `database.sql`.

### 4. Run the Project
- Deploy the project on **Apache Tomcat**.
- Open your browser and go to:
 http://localhost:8080/ServiceSathi

