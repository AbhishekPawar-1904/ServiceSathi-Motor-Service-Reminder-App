<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.abhi.model.WorkLog" %>
<%
    List<WorkLog> expiredLogs = (List<WorkLog>) request.getAttribute("expiredLogs");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expired Work Logs | ServiceSathi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Raleway:wght@700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.9)),
                url('https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
            position: relative;
            color: #fff;
        }

        .floating-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }

        .floating-shapes div {
            position: absolute;
            border-radius: 50%;
            background: rgba(26, 117, 188, 0.08);
            animation: float 15s linear infinite;
            z-index: 0;
        }

        .floating-shapes div:nth-child(1) {
            width: 100px; height: 100px; top: 15%; left: 10%;
        }
        .floating-shapes div:nth-child(2) {
            width: 80px; height: 80px; top: 65%; left: 80%;
            animation-delay: -5s;
        }
        .floating-shapes div:nth-child(3) {
            width: 60px; height: 60px; top: 40%; left: 70%;
            animation-delay: -3s;
        }
        .floating-shapes div:nth-child(4) {
            width: 120px; height: 120px; top: 75%; left: 20%;
            animation-delay: -8s;
        }

        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 1; }
            100% { transform: translateY(-1000px) rotate(720deg); opacity: 0; }
        }

        /* Header Styles */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.12);
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logo-icon {
            font-size: 32px;
            color: #1a75bc;
            background: rgba(255, 255, 255, 0.1);
            padding: 10px;
            border-radius: 50%;
            box-shadow: 0 0 15px rgba(26, 117, 188, 0.4);
        }

        .logo-text {
            font-size: 24px;
            font-weight: 700;
            color: #fff;
            text-shadow: 0 0 10px rgba(26, 117, 188, 0.5);
        }

        .logo-subtext {
            font-size: 14px;
            color: #ccc;
            letter-spacing: 1px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-details {
            text-align: right;
        }

        .user-name {
            font-weight: 600;
            font-size: 16px;
        }

        .user-role {
            font-size: 14px;
            color: #1a75bc;
            font-weight: 500;
        }

        .logout-btn {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: white;
            padding: 10px 25px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(255, 75, 43, 0.3);
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(255, 75, 43, 0.5);
        }

        /* Main Content */
        .container {
            padding: 40px 50px;
            flex: 1;
            position: relative;
            z-index: 1;
        }

        .page-header {
            margin-bottom: 40px;
            text-align: center;
        }

        .page-title {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 10px;
            color: #fff;
            text-shadow: 0 0 10px rgba(26, 117, 188, 0.5);
        }

        .page-subtitle {
            font-size: 18px;
            color: #ccc;
            max-width: 700px;
            margin: 0 auto;
        }

        /* Table Container */
        .table-container {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 16px;
            padding: 30px;
            overflow: hidden;
            margin-bottom: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .table-title {
            font-size: 24px;
            font-weight: 600;
            color: #fff;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .table-title i {
            color: #ff9b2c;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 16px 20px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.12);
        }

        th {
            background: rgba(30, 41, 59, 0.9);
            color: #ff9b2c;
            font-weight: 600;
            position: sticky;
            top: 0;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover {
            background: rgba(255, 155, 44, 0.05);
        }

        .status-badge {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 50px;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .status-expired {
            background: rgba(255, 75, 43, 0.15);
            color: #ff4b2b;
        }

        /* No Data Message */
        .no-data {
            text-align: center;
            padding: 50px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 16px;
            margin: 20px 0;
        }

        .no-data i {
            font-size: 48px;
            color: #ff9b2c;
            margin-bottom: 20px;
        }

        .no-data h3 {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .no-data p {
            font-size: 16px;
            color: #ccc;
            max-width: 500px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* Back Button */
        .back-container {
            text-align: center;
            margin-top: 30px;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 12px 30px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            gap: 10px;
            border: 1px solid rgba(255, 255, 255, 0.12);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .back-btn:hover {
            background: rgba(26, 117, 188, 0.2);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(26, 117, 188, 0.3);
        }

        /* Footer */
        footer {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border-top: 1px solid rgba(255, 255, 255, 0.12);
            padding: 20px 50px;
            text-align: center;
            font-size: 14px;
            color: #ccc;
            position: relative;
            z-index: 1;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .copyright {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .system-info {
            display: flex;
            gap: 30px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header {
                padding: 15px 20px;
                flex-direction: column;
                gap: 15px;
            }
            
            .container {
                padding: 30px 20px;
            }
            
            .page-title {
                font-size: 28px;
            }
            
            .page-subtitle {
                font-size: 16px;
            }
            
            .table-header {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }
            
            .table-title {
                justify-content: center;
            }
            
            .footer-content {
                flex-direction: column;
                gap: 15px;
            }
            
            .system-info {
                flex-direction: column;
                gap: 10px;
            }
            
            th, td {
                padding: 12px 15px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .table-container {
                padding: 20px;
            }
            
            .table-title {
                font-size: 20px;
            }
            
            .no-data {
                padding: 30px 20px;
            }
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .table-container, .no-data {
            animation: fadeIn 0.6s ease-out;
        }
    </style>
</head>
<body>

    <!-- Floating background shapes -->
    <div class="floating-shapes">
        <div></div><div></div><div></div><div></div>
    </div>

    <!-- Header -->
    <header>
        <div class="logo">
            <div class="logo-icon">
                <i class="fas fa-tools"></i>
            </div>
            <div>
                <div class="logo-text">ServiceSathi</div>
                <div class="logo-subtext">GARAGE MANAGEMENT SYSTEM</div>
            </div>
        </div>
        
        <div class="user-info">
            
            <a href="logout" class="logout-btn">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="page-header">
            <h1 class="page-title">Expired Work Logs</h1>
            <p class="page-subtitle">Manage expired service records and overdue maintenance</p>
        </div>
        
        <!-- Table Container -->
        <div class="table-container">
            <div class="table-header">
                <h2 class="table-title">
                    <i class="fas fa-file-alt"></i> Expired Service Records
                </h2>
            </div>
            
            <% if (expiredLogs != null && !expiredLogs.isEmpty()) { %>
                <table>
                    <thead>
                        <tr>
                            <th>Vehicle No</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Service Date</th>
                            <th>Due Date</th>
                            <th>Garage Contact</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (WorkLog log : expiredLogs) { %>
                            <tr>
                                <td><%= log.getVehicleNo() %></td>
                                <td><%= log.getTitle() %></td>
                                <td><%= log.getDescription() %></td>
                                <td><%= log.getDate() %></td>
                                <td><%= log.getDueDate() %></td>
                                <td><%= log.getGarageContact() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <div class="no-data">
                    <i class="fas fa-info-circle"></i>
                    <h3>No Expired Work Logs Found</h3>
                    <p>All service records are up-to-date. No expired work logs to display at this time.</p>
                </div>
            <% } %>
        </div>
        
        <!-- Back Button -->
        <div class="back-container">
            <a href="backtogaragedashboard" class="back-btn">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="copyright">
                <i class="far fa-copyright"></i>
                <span>2023 ServiceSathi. All rights reserved</span>
            </div>
            <div class="system-info">
                <div>Last Login: Today at 14:30</div>
                <div>Version: 3.2.1</div>
            </div>
        </div>
    </footer>

    <script>
        // Add row hover effects
        document.querySelectorAll('tbody tr').forEach(row => {
            row.addEventListener('mouseenter', () => {
                row.style.transform = 'translateX(5px)';
                row.style.transition = 'transform 0.3s ease';
            });
            
            row.addEventListener('mouseleave', () => {
                row.style.transform = 'translateX(0)';
            });
        });
        
        // Show notification for expired logs
        document.addEventListener('DOMContentLoaded', function() {
            const expiredCount = <%= expiredLogs != null ? expiredLogs.size() : 0 %>;
            if (expiredCount > 0) {
                const notification = document.createElement('div');
                notification.innerHTML = `
                    <div style="position: fixed; bottom: 20px; right: 20px; background: linear-gradient(135deg, #ff416c, #ff4b2b); color: white; padding: 15px 25px; border-radius: 12px; box-shadow: 0 10px 25px rgba(255, 75, 43, 0.4); z-index: 1000; display: flex; align-items: center; gap: 10px; animation: slideIn 0.5s ease;">
                        <i class="fas fa-exclamation-triangle"></i>
                        <span>${expiredCount} expired work logs found!</span>
                    </div>
                `;
                document.body.appendChild(notification);
                
                // Auto-remove after 5 seconds
                setTimeout(() => {
                    notification.style.animation = 'slideOut 0.5s ease forwards';
                    setTimeout(() => {
                        notification.remove();
                    }, 500);
                }, 5000);
            }
        });
    </script>
</body>
</html>