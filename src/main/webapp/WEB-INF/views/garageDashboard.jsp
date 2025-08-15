<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Garage Management | ServiceSathi</title>
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
	width: 100px;
	height: 100px;
	top: 15%;
	left: 10%;
}

.floating-shapes div:nth-child(2) {
	width: 80px;
	height: 80px;
	top: 65%;
	left: 80%;
	animation-delay: -5s;
}

.floating-shapes div:nth-child(3) {
	width: 60px;
	height: 60px;
	top: 40%;
	left: 70%;
	animation-delay: -3s;
}

.floating-shapes div:nth-child(4) {
	width: 120px;
	height: 120px;
	top: 75%;
	left: 20%;
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

/* Dashboard Grid */
.dashboard-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr); /* Three cards per row */
	gap: 30px;
}

.dashboard-card {
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(10px);
	border: 1px solid rgba(255, 255, 255, 0.12);
	border-radius: 16px;
	padding: 30px;
	text-align: center;
	transition: all 0.4s ease;
	position: relative;
	overflow: hidden;
	text-decoration: none;
	color: inherit;
	height: 100%; /* Ensure consistent height */
}

.dashboard-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
	border-color: rgba(26, 117, 188, 0.5);
}

.dashboard-card::after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 4px;
	background: linear-gradient(to right, #1a75bc, #3498db);
	transform: scaleX(0);
	transform-origin: left;
	transition: transform 0.4s ease;
}

.dashboard-card:hover::after {
	transform: scaleX(1);
}

.card-icon {
	font-size: 48px;
	margin-bottom: 20px;
	color: #1a75bc;
	transition: transform 0.3s ease;
}

.dashboard-card:hover .card-icon {
	transform: scale(1.1) rotate(5deg);
}

.card-title {
	font-size: 22px;
	font-weight: 600;
	margin-bottom: 15px;
	color: #fff;
}

.card-desc {
	font-size: 15px;
	color: #ccc;
	margin-bottom: 20px;
	line-height: 1.6;
}

.notification-badge {
	position: absolute;
	top: 20px;
	right: 20px;
	background: linear-gradient(135deg, #ff416c, #ff4b2b);
	color: white;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 600;
	font-size: 14px;
	box-shadow: 0 4px 10px rgba(255, 75, 43, 0.3);
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
@media ( max-width : 1200px) {
	.dashboard-grid {
		grid-template-columns: repeat(2, 1fr);
		/* Two cards per row on medium screens */
	}
}

@media ( max-width : 768px) {
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
	.dashboard-grid {
		grid-template-columns: 1fr; /* Single column on small screens */
	}
	.footer-content {
		flex-direction: column;
		gap: 15px;
	}
	.system-info {
		flex-direction: column;
		gap: 10px;
	}
}

@media ( max-width : 480px) {
	.dashboard-card {
		padding: 20px;
	}
	.card-icon {
		font-size: 40px;
	}
	.card-title {
		font-size: 20px;
	}
}

/* Animations */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.dashboard-card {
	animation: fadeIn 0.6s ease-out;
}

.dashboard-card:nth-child(1) {
	animation-delay: 0.1s;
}

.dashboard-card:nth-child(2) {
	animation-delay: 0.2s;
}

.dashboard-card:nth-child(3) {
	animation-delay: 0.3s;
}

.dashboard-card:nth-child(4) {
	animation-delay: 0.4s;
}

.dashboard-card:nth-child(5) {
	animation-delay: 0.5s;
}

.dashboard-card:nth-child(6) {
	animation-delay: 0.6s;
}
</style>
</head>
<body>

	<!-- Floating background shapes -->
	<div class="floating-shapes">
		<div></div>
		<div></div>
		<div></div>
		<div></div>
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

			<a href="logout" class="logout-btn"> <i
				class="fas fa-sign-out-alt"></i> Logout
			</a>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="page-header">
			<h1 class="page-title">Garage Management Dashboard</h1>
			<p class="page-subtitle">Efficiently manage your garage
				operations with ServiceSathi</p>
		</div>

		<!-- Dashboard Grid with exactly 3 cards per row -->
		<div class="dashboard-grid">
			<a href="addvehicle" class="dashboard-card">
				<div class="card-icon">
					<i class="fas fa-car"></i>
				</div>
				<h3 class="card-title">Add Vehicle</h3>
				<p class="card-desc">Register new vehicles for service and
					maintenance</p>
			</a> <a href="GarageSearchVehicle" class="dashboard-card">
				<div class="card-icon">
					<i class="fas fa-search"></i>
				</div>
				<h3 class="card-title">Search Vehicle</h3>
				<p class="card-desc">Find detailed information about any vehicle</p>
			</a> <a href="openworklog" class="dashboard-card">
				<div class="card-icon">
					<i class="fas fa-clipboard-list"></i>
				</div>
				<h3 class="card-title">Add Work Log</h3>
				<p class="card-desc">Record service details and maintenance
					activities</p>
			</a> <a href="OpenSearchVehicleWorkLog" class="dashboard-card">
				<div class="card-icon">
					<i class="fas fa-file-alt"></i>
				</div>
				<h3 class="card-title">Work Log History</h3>
				<p class="card-desc">View past service records and maintenance
					history</p>
				<div class="notification-badge">3</div>
			</a> <a href="nearbyexpiry" class="dashboard-card">
				<div class="card-icon">
					<i class="fas fa-clock"></i>
				</div>
				<h3 class="card-title">Upcoming Expiries</h3>
				<p class="card-desc">View services and inspections due soon</p>
				<div class="notification-badge">5</div>
			</a> <a href="garageExpired" class="dashboard-card">
				<div class="card-icon">
					<i class="fas fa-exclamation-triangle"></i>
				</div>
				<h3 class="card-title">Expired Services</h3>
				<p class="card-desc">Manage overdue maintenance and inspections</p>
				<div class="notification-badge">2</div>
			</a>
		</div>
	</div>

	<!-- Footer -->
	<footer>
		<div class="footer-content">
			<div class="copyright">
				<i class="far fa-copyright"></i> <span>2023 ServiceSathi. All
					rights reserved</span>
			</div>
			<div class="system-info">
				<div>Last Login: Today at 14:30</div>
				<div>Version: 3.2.1</div>
			</div>
		</div>
	</footer>

	<script>
        // Add interactive hover effect to cards
        document.querySelectorAll('.dashboard-card').forEach(card => {
            card.addEventListener('mousemove', (e) => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                
                const moveX = (x - rect.width / 2) / 15;
                const moveY = (y - rect.height / 2) / 15;
                
                card.style.transform = `translate(${moveX}px, ${moveY}px) translateY(-8px)`;
            });
            
            card.addEventListener('mouseleave', () => {
                card.style.transform = 'translateY(-8px)';
            });
        });

        // Add pulse animation to notification badges
        const badges = document.querySelectorAll('.notification-badge');
        setInterval(() => {
            badges.forEach(badge => {
                badge.style.transform = 'scale(1.1)';
                setTimeout(() => {
                    badge.style.transform = 'scale(1)';
                }, 300);
            });
        }, 3000);
    </script>
</body>
</html>