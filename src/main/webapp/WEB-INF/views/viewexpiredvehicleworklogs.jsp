<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.abhi.model.WorkLog" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expired Work Logs | ServiceSathi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #1e293b;
            --primary-light: #334155;
            --accent: #3b82f6;
            --accent-hover: #2563eb;
            --warning: #f59e0b;
            --danger: #ef4444;
            --success: #10b981;
            --text-light: #f1f5f9;
            --text-muted: #94a3b8;
            --border-radius: 12px;
            --box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            --card-bg: rgba(30, 41, 59, 0.8);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.9)), 
                        url('https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            color: var(--text-light);
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 1.8rem;
            font-weight: 700;
        }
        
        .logo i {
            color: var(--accent);
            background: rgba(59, 130, 246, 0.15);
            width: 55px;
            height: 55px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .page-info {
            display: flex;
            align-items: center;
            gap: 12px;
            color: var(--text-muted);
        }
        
        .page-info i {
            color: var(--danger);
        }
        
        /* Navigation Tabs */
        .nav-tabs {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
        }
        
        .tab {
            flex: 1;
            padding: 15px;
            background: rgba(15, 23, 42, 0.6);
            border-radius: var(--border-radius);
            text-align: center;
            text-decoration: none;
            color: var(--text-light);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.08);
        }
        
        .tab:hover {
            background: rgba(59, 130, 246, 0.2);
            transform: translateY(-3px);
        }
        
        .tab.active {
            background: var(--accent);
            box-shadow: 0 5px 15px rgba(59, 130, 246, 0.3);
        }
        
        .tab i {
            font-size: 1.2rem;
        }
        
        /* Card styles */
        .card {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 30px;
            margin-bottom: 30px;
            border: 1px solid rgba(255, 255, 255, 0.08);
            position: relative;
            overflow: hidden;
        }
        
        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--warning), var(--danger));
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
        
        .card-title {
            font-size: 1.8rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .card-title i {
            color: var(--danger);
        }
        
        .stats {
            display: flex;
            gap: 15px;
        }
        
        .stat-card {
            background: rgba(15, 23, 42, 0.6);
            border-radius: 10px;
            padding: 15px 20px;
            text-align: center;
            min-width: 150px;
        }
        
        .stat-value {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--danger);
            margin-bottom: 5px;
        }
        
        .stat-label {
            font-size: 0.9rem;
            color: var(--text-muted);
        }
        
        /* Table styles */
        .table-container {
            overflow-x: auto;
            border-radius: var(--border-radius);
            border: 1px solid rgba(255, 255, 255, 0.08);
            background: rgba(15, 23, 42, 0.5);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 16px 20px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
        }
        
        th {
            background: rgba(30, 41, 59, 0.9);
            color: var(--accent);
            font-weight: 600;
            position: sticky;
            top: 0;
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        tr:hover {
            background: rgba(59, 130, 246, 0.05);
        }
        
        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }
        
        .status-expired {
            background: rgba(239, 68, 68, 0.15);
            color: var(--danger);
        }
        
        .no-data {
            text-align: center;
            padding: 40px;
            color: var(--text-muted);
        }
        
        .no-data i {
            font-size: 3rem;
            margin-bottom: 20px;
            color: var(--warning);
        }
        
        .no-data h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        
        .no-data p {
            font-size: 1.1rem;
            max-width: 500px;
            margin: 0 auto;
            line-height: 1.6;
        }
        
        /* Footer */
        .footer {
            text-align: center;
            margin-top: 50px;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.08);
            color: var(--text-muted);
            font-size: 0.9rem;
        }
        
        /* Responsive design */
        @media (max-width: 992px) {
            .header {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }
            
            .stats {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .nav-tabs {
                flex-wrap: wrap;
            }
        }
        
        @media (max-width: 768px) {
            .card-header {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }
            
            .card-title {
                justify-content: center;
            }
            
            th, td {
                padding: 12px 15px;
            }
        }
        
        @media (max-width: 576px) {
            .logo {
                font-size: 1.5rem;
            }
            
            .card {
                padding: 20px;
            }
            
            .card-title {
                font-size: 1.5rem;
            }
            
            .stat-card {
                min-width: 120px;
                padding: 12px 15px;
            }
            
            .stat-value {
                font-size: 1.5rem;
            }
            
            .tab {
                padding: 12px;
                font-size: 0.9rem;
            }
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .card {
            animation: fadeIn 0.6s ease forwards;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <div class="logo">
                <i class="fas fa-user-shield"></i>
                <span>ServiceSathi</span>
            </div>
            <div class="page-info">
                <i class="fas fa-exclamation-triangle"></i>
                <span>Expired Work Logs</span>
            </div>
        </div>
        
        <!-- Navigation Tabs -->
        <div class="nav-tabs">
            <a href="viewvehicleworklogs" class="tab">
                <i class="fas fa-clipboard-list"></i> All Work Logs
            </a>
            <a href="viewvehiclenearbyexpirylogs" class="tab">
                <i class="fas fa-clock"></i> Nearby Expiry
            </a>
            <a href="viewexpiredvehicleworklogs" class="tab active">
                <i class="fas fa-exclamation-circle"></i> Expired Logs
            </a>
        </div>
        
        <!-- Stats Card -->
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">
                    <i class="fas fa-exclamation-circle"></i> Expired Service Records
                </h2>
                <div class="stats">
                    <%
                        List<WorkLog> workLogs = (List<WorkLog>) request.getAttribute("workLogs");
                        int expiredLogsCount = (workLogs != null) ? workLogs.size() : 0;
                    %>
                    <div class="stat-card">
                        <div class="stat-value"><%= expiredLogsCount %></div>
                        <div class="stat-label">Expired Logs</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-value">142</div>
                        <div class="stat-label">Active Vehicles</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-value">12</div>
                        <div class="stat-label">Urgent Follow-ups</div>
                    </div>
                </div>
            </div>
            
            <!-- Table Container -->
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Vehicle No</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Service Date</th>
                            <th>Due Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (workLogs == null || workLogs.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="6">
                                <div class="no-data">
                                    <i class="fas fa-info-circle"></i>
                                    <h3>No Expired Work Logs Found</h3>
                                    <p>There are currently no expired maintenance logs for this vehicle.</p>
                                </div>
                            </td>
                        </tr>
                        <%
                            } else {
                                for (WorkLog log : workLogs) {
                        %>
                        <tr>
                            <td><%= log.getVehicleNo() %></td>
                            <td><%= log.getTitle() %></td>
                            <td><%= log.getDescription() %></td>
                            <td><%= log.getDate() %></td>
                            <td><%= log.getDueDate() %></td>
                            <td><span class="status-badge status-expired">Expired</span></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Footer -->
        <div class="footer">
            <p>ServiceSathi Admin Portal v2.0 &copy; 2023 | Expired Work Logs Report</p>
        </div>
    </div>

    <script>
        // Add animation to table rows
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateX(-20px)';
                
                setTimeout(() => {
                    row.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    row.style.opacity = '1';
                    row.style.transform = 'translateX(0)';
                }, 100 * index);
            });
        });
    </script>
</body>
</html>