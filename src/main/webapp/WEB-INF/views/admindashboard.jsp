<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard | ServiceSathi</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
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
	color: #fff;
	line-height: 1.6;
}

/* Full-width header */
header {
	background: rgba(15, 23, 42, 0.95);
	backdrop-filter: blur(10px);
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
	padding: 1.2rem 2rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
	width: 100%;
	position: sticky;
	top: 0;
	z-index: 100;
}

.logo {
	font-size: 1.8rem;
	font-weight: 700;
	display: flex;
	align-items: center;
	color: #e2e8f0;
}

.logo i {
	margin-right: 0.8rem;
	color: #3b82f6;
	background: rgba(59, 130, 246, 0.15);
	width: 50px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 12px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.admin-info {
	display: flex;
	align-items: center;
	gap: 20px;
}

.admin-details {
	text-align: right;
}

.admin-name {
	font-weight: 600;
	font-size: 1.1rem;
}

.admin-role {
	font-size: 0.9rem;
	color: #94a3b8;
}

.logout-btn {
	background: rgba(239, 68, 68, 0.15);
	border: none;
	padding: 0.7rem 1.4rem;
	border-radius: 8px;
	color: #fff;
	text-decoration: none;
	transition: 0.3s ease;
	display: flex;
	align-items: center;
	gap: 8px;
	font-weight: 500;
}

.logout-btn:hover {
	background: rgba(239, 68, 68, 0.25);
	transform: translateY(-2px);
}

.container {
	max-width: 1000px;
	margin: 40px auto;
	padding: 0 1.5rem;
}

.page-title {
	font-size: 2.3rem;
	font-weight: 800;
	margin-bottom: 2.5rem;
	color: #fff;
	text-align: center;
	position: relative;
	padding-bottom: 15px;
	text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
}

.page-title::after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 120px;
	height: 4px;
	background: linear-gradient(to right, #3b82f6, #8b5cf6);
	border-radius: 2px;
}

.card-container {
	display: flex;
	flex-direction: column;
	gap: 1.8rem;
	margin-top: 1.5rem;
}

/* Medium-sized cards */
.card {
	background: rgba(30, 41, 59, 0.7);
	backdrop-filter: blur(10px);
	border-radius: 16px;
	padding: 1.8rem;
	transition: all 0.3s ease;
	text-decoration: none;
	color: #fff;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
	display: flex;
	align-items: center;
	gap: 25px;
	border: 1px solid rgba(255, 255, 255, 0.08);
	position: relative;
	overflow: hidden;
}

.card:hover {
	transform: translateY(-5px);
	background: rgba(30, 41, 59, 0.85);
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.35);
}

.card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: linear-gradient(120deg, transparent, rgba(59, 130, 246, 0.1),
		transparent);
	transform: translateX(-100%);
	transition: transform 0.6s ease;
}

.card:hover::before {
	transform: translateX(100%);
}

.card i {
	font-size: 2.4rem;
	width: 70px;
	height: 70px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(30, 64, 175, 0.2);
	border-radius: 16px;
	color: #3b82f6;
	transition: all 0.3s ease;
	flex-shrink: 0;
}

.card:hover i {
	transform: scale(1.08);
	background: rgba(30, 64, 175, 0.3);
}

.card-content {
	flex: 1;
	text-align: left;
}

.card-title {
	font-size: 1.5rem;
	font-weight: 700;
	margin-bottom: 0.6rem;
	color: #e2e8f0;
}

.card-desc {
	font-size: 1.05rem;
	color: #cbd5e1;
	line-height: 1.6;
}

.stats-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 1.5rem;
	margin-top: 3rem;
}

.stat-card {
	background: rgba(30, 41, 59, 0.7);
	border-radius: 12px;
	padding: 1.5rem;
	text-align: center;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.stat-value {
	font-size: 2.2rem;
	font-weight: 700;
	color: #3b82f6;
	margin-bottom: 0.5rem;
}

.stat-label {
	font-size: 1rem;
	color: #94a3b8;
}

.footer {
	text-align: center;
	margin-top: 4rem;
	padding: 1.5rem;
	color: #64748b;
	font-size: 0.9rem;
	border-top: 1px solid rgba(255, 255, 255, 0.05);
}

@media ( max-width : 768px) {
	header {
		flex-direction: column;
		text-align: center;
		gap: 1.2rem;
		padding: 1.5rem;
	}
	.admin-info {
		flex-direction: column;
		width: 100%;
	}
	.admin-details {
		text-align: center;
	}
	.logout-btn {
		width: 100%;
		justify-content: center;
	}
	.page-title {
		font-size: 2rem;
	}
	.card {
		flex-direction: column;
		text-align: center;
		padding: 1.8rem 1.5rem;
	}
	.card-content {
		text-align: center;
	}
	.card i {
		width: 70px;
		height: 70px;
		font-size: 2rem;
	}
	.card-title {
		font-size: 1.4rem;
	}
	.card-desc {
		font-size: 1rem;
	}
	.stats-container {
		grid-template-columns: 1fr;
	}
}

@media ( max-width : 480px) {
	.page-title {
		font-size: 1.8rem;
	}
	.logo {
		font-size: 1.5rem;
	}
	.logo i {
		width: 40px;
		height: 40px;
		font-size: 1.2rem;
	}
}
</style>
</head>
<body>
	<!-- Full-width header -->
	<header>
		<div class="logo">
			<i class="fas fa-user-shield"></i> <span>ServiceSathi Admin</span>
		</div>
		<div class="admin-info">
			
			<a href="logout" class="logout-btn"> <i
				class="fas fa-sign-out-alt"></i> Logout
			</a>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<h1 class="page-title">Admin Dashboard</h1>

		<div class="card-container">
			<a href="addgarage" class="card"> <i class="fas fa-plus-circle"></i>
				<div class="card-content">
					<div class="card-title">Add New Garage</div>
					<div class="card-desc">Register new service centers with
						detailed information including location, services offered, and
						contact details</div>
				</div>
			</a> <a href="viewGarage" class="card"> <i class="fas fa-tools"></i>
				<div class="card-content">
					<div class="card-title">Manage Garages</div>
					<div class="card-desc">View, edit, and update existing garage
						details. Monitor performance metrics and service history</div>
				</div>
			</a> <a href="adminSearchVehicle" class="card"> <i
				class="fas fa-search"></i>
				<div class="card-content">
					<div class="card-title">Search Vehicles</div>
					<div class="card-desc">Find and review vehicle service
						records and maintenance history across all registered garages</div>
				</div>
			</a>
		</div>

		<div class="stats-container">
			<div class="stat-card">
				<div class="stat-value">142</div>
				<div class="stat-label">Registered Garages</div>
			</div>
			<div class="stat-card">
				<div class="stat-value">3,842</div>
				<div class="stat-label">Active Vehicles</div>
			</div>
			<div class="stat-card">
				<div class="stat-value">12,487</div>
				<div class="stat-label">Service Records</div>
			</div>
			<div class="stat-card">
				<div class="stat-value">98%</div>
				<div class="stat-label">Satisfaction Rate</div>
			</div>
		</div>

		<div class="footer">
			<p>ServiceSathi Admin Portal v2.0 &copy; 2023 | All Rights
				Reserved</p>
		</div>
	</div>

	<script>
        // Add animation to cards on page load
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, 200 * index);
            });
        });
    </script>
</body>
</html>