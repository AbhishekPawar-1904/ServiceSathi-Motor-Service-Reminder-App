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

### **Garage Table**
| Column       | Type     |
|--------------|----------|
| contact (PK) | String   |
| name         | String   |
| address      | String   |
| pincode      | String   |
| latitude     | Double   |
| longitude    | Double   |
| email        | String   |
| password     | String   |

### **Vehicle Table**
| Column       | Type     |
|--------------|----------|
| vehicleNo (PK) | String |
| chassisNo    | String   |
| name         | String   |
| ownerName    | String   |
| contact      | String   |
| address      | String   |
| email        | String   |
| password     | String   |

### **Work Log Table** (`workLog_tbl`)
| Column        | Type     |
|---------------|----------|
| vehicleNo     | String   |
| title         | String   |
| description   | String   |
| date          | Date     |
| time          | Time     |
| email         | String   |
| contact       | String   |
| address       | String   |
| garageContact | String   |
| dueDate       | Date     |

---

## 🛠 Tech Stack
- **Backend**: Java (Spring MVC / Spring ORM)
- **Frontend**: JSP, HTML, CSS, JavaScript
- **Database**: MySQL (XAMPP/phpMyAdmin)
- **Server**: Apache Tomcat
- **Build Tool**: Maven

---

## 🚀 Installation & Setup
1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR-USERNAME/ServiceSathi-Motor-Service-Reminder-App.git
   cd ServiceSathi-Motor-Service-Reminder-App

 ### 2 Import into IDE
- Open **Eclipse** or **IntelliJ IDEA**.
- Select **Import** → **Existing Maven Project**.
- Choose the project folder.

### 3 Configure Database
- Create a **MySQL database**.
- Import the provided SQL script: `database.sql`.

### 4 Run the Project
- Deploy the project on **Apache Tomcat**.
- Open your browser and go to:
 http://localhost:8080/ServiceSathi

