<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.abhi.model.WorkLog"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Upcoming Expiries | ServiceSathi</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Raleway:wght@700;800&display=swap"
	rel="stylesheet">
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
	justify-content: center;
	align-items: center;
	overflow: auto;
	position: relative;
	padding: 20px;
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
}

.floating-shapes div:nth-child(1) {
	width: 80px;
	height: 80px;
	top: 20%;
	left: 10%;
	animation-duration: 20s;
}

.floating-shapes div:nth-child(2) {
	width: 120px;
	height: 120px;
	top: 65%;
	left: 80%;
	animation-duration: 25s;
	animation-delay: -5s;
}

.floating-shapes div:nth-child(3) {
	width: 60px;
	height: 60px;
	top: 40%;
	left: 70%;
	animation-duration: 18s;
	animation-delay: -2s;
}

.floating-shapes div:nth-child(4) {
	width: 100px;
	height: 100px;
	top: 75%;
	left: 15%;
	animation-duration: 22s;
	animation-delay: -8s;
}

@
keyframes float { 0% {
	transform: translateY(0) rotate(0deg);
	opacity: 1;
}

100%
{
transform
:
 
translateY
(-1000px)
 
rotate
(720deg);

                
opacity
:
 
0;
}
}
.container {
	width: 90%;
	max-width: 1200px;
	z-index: 10;
	padding: 20px;
}

header {
	text-align: center;
	margin-bottom: 30px;
	animation: fadeInDown 1s ease;
}

.logo {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
}

.logo-icon {
	font-size: 48px;
	color: #1a75bc;
	margin-right: 15px;
	animation: pulse 2s infinite;
	transform-origin: center;
}

.logo-text {
	font-size: 42px;
	font-weight: 800;
	color: #fff;
	text-shadow: 0 0 15px rgba(26, 117, 188, 0.7);
	letter-spacing: 2px;
	font-family: 'Raleway', sans-serif;
	position: relative;
	display: inline-block;
}

.logo-text::after {
	content: "";
	position: absolute;
	bottom: -10px;
	left: 0;
	width: 100%;
	height: 4px;
	background: linear-gradient(90deg, #1a75bc, #2ecc71, #f39c12);
	border-radius: 2px;
	transform: scaleX(0);
	transform-origin: right;
	transition: transform 0.5s ease;
}

.logo:hover .logo-text::after {
	transform: scaleX(1);
	transform-origin: left;
}

.header {
	text-align: center;
	margin-bottom: 30px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(12px);
	border-radius: 20px;
	padding: 20px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
	border: 1px solid rgba(255, 255, 255, 0.12);
}

.header h2 {
	font-size: 1.8rem;
	margin-bottom: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	color: white;
}

.header h2 i {
	color: #f39c12;
}

.header p {
	color: rgba(255, 255, 255, 0.8);
}

.table-container {
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(12px);
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
	border: 1px solid rgba(255, 255, 255, 0.12);
	overflow: hidden;
	overflow-x: auto;
	margin-bottom: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px 15px;
	text-align: center;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
	color: rgba(255, 255, 255, 0.9);
}

th {
	background-color: rgba(26, 117, 188, 0.5);
	color: white;
	font-weight: 600;
	position: sticky;
	top: 0;
}

tr:nth-child(even) {
	background-color: rgba(255, 255, 255, 0.05);
}

tr:hover {
	background-color: rgba(255, 255, 255, 0.1);
}

.no-data {
	text-align: center;
	padding: 30px;
	color: #f39c12;
	font-weight: 500;
}

.no-data i {
	font-size: 1.5rem;
	margin-bottom: 10px;
	color: #f39c12;
}

.btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 12px 30px;
	background: rgba(255, 255, 255, 0.12);
	border: 1px solid rgba(255, 255, 255, 0.2);
	border-radius: 50px;
	color: white;
	font-size: 16px;
	font-weight: 500;
	text-decoration: none;
	transition: all 0.3s;
	cursor: pointer;
	position: relative;
	overflow: hidden;
}

.btn::after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(255, 255, 255, 0.2);
	transform: translateX(-100%) skewX(-15deg);
	transition: transform 0.4s ease;
}

.btn:hover::after {
	transform: translateX(100%) skewX(-15deg);
}

.btn:hover {
	background: rgba(255, 255, 255, 0.2);
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.btn:hover {
	background: linear-gradient(to right, #1a75bc, #3498db);
}

/* Animations */
@
keyframes fadeInDown {from { opacity:0;
	transform: translateY(-30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes pulse { 0% {
	transform: scale(1);
}

50%
{
transform
:
 
scale
(1
.1
);

            
}
100%
{
transform
:
 
scale
(1);

            
}
}
.car-animation {
	position: absolute;
	bottom: 10%;
	left: -100px;
	font-size: 48px;
	animation: drive 20s linear infinite;
	z-index: 5;
	opacity: 0.8;
	color: #1a75bc;
}

@
keyframes drive { 0% {
	transform: translateX(0);
}

100%
{
transform
:
 
translateX
(calc(100vw
+
200
px
));

            
}
}

/* Responsive Design */
@media ( max-width : 992px) {
	.portal {
		width: 280px;
	}
}

@media ( max-width : 768px) {
	.logo-text {
		font-size: 36px;
	}
	th, td {
		padding: 8px 10px;
		font-size: 14px;
	}
}

@media ( max-width : 480px) {
	.logo-text {
		font-size: 32px;
	}
	.header h2 {
		font-size: 1.4rem;
	}
	.table-container {
		padding: 15px;
	}
}
</style>
</head>
<body>
	<div class="floating-shapes">
		<div></div>
		<div></div>
		<div></div>
		<div></div>
	</div>

	<div class="car-animation">
		<i class="fas fa-car"></i>
	</div>

	<div class="container">
		<header>
			<div class="logo">
				<div class="logo-icon">
					<i class="fas fa-car"></i>
				</div>
				<div class="logo-text">ServiceSathi</div>
			</div>

			<div class="header">
				<h2>
					<i class="fas fa-clock"></i> Upcoming Expiring Work Logs
				</h2>
				<p>Work logs expiring within the next month</p>
			</div>
		</header>

		<%
			List<WorkLog> expiringLogs = (List<WorkLog>) request.getAttribute("expiringLogs");
			if (expiringLogs == null || expiringLogs.isEmpty()) {
		%>
		<div class="no-data">
			<i class="fas fa-info-circle"></i>
			<p>No upcoming expiring work logs found.</p>
		</div>
		<%
			} else {
		%>
		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>Vehicle No</th>
						<th>Title</th>
						<th>Description</th>
						<th>Due Date</th>
						<th>Owner Contact</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (WorkLog log : expiringLogs) {
					%>
					<tr>
						<td><%=log.getVehicleNo()%></td>
						<td><%=log.getTitle()%></td>
						<td><%=log.getDescription()%></td>
						<td><%=log.getDueDate()%></td>
						<td><%=log.getContact()%></td>
						<td><%=log.getEmail()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<%
			}
		%>

		<div style="text-align: center; margin-top: 20px;">
			<a href="backtogaragedashboard" class="btn"> <i
				class="fas fa-arrow-left"></i> Back to Dashboard
			</a>
		</div>
	</div>

	<script>
        // Stats counter animation
        const stats = document.querySelectorAll('.stat-value');
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    animateValue(entry.target, 0, parseInt(entry.target.textContent), 2000);
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.5 });
        
        stats.forEach(stat => {
            if (!isNaN(parseInt(stat.textContent))) {
                observer.observe(stat);
            }
        });

        function animateValue(element, start, end, duration) {
            let startTimestamp = null;
            const step = (timestamp) => {
                if (!startTimestamp) startTimestamp = timestamp;
                const progress = Math.min((timestamp - startTimestamp) / duration, 1);
                const value = Math.floor(progress * (end - start) + start);
                element.textContent = value + (element.textContent.includes('%') ? '%' : '+');
                if (progress < 1) {
                    window.requestAnimationFrame(step);
                }
            };
            window.requestAnimationFrame(step);
        }
        
        // Car animation
        const cars = document.querySelectorAll('.car-animation');
        cars.forEach(car => {
            car.style.animationDelay = `${Math.random() * 5}s`;
        });
    </script>
</body>
</html>