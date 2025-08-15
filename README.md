# ServiceSathi: Motor Service Reminder App

## 📌 Overview
**ServiceSathi** is a Motor Service Reminder application designed to help vehicle owners, garages, and administrators efficiently manage vehicle service schedules, work logs, and reminders.  
The system supports three roles: **Admin**, **Garage**, and **Vehicle Owner**, each with dedicated functionalities.

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
   git clone https://github.com/YOUR-USERNAME/ServiceSathi-Motor-Service-Reminder-App.git
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

