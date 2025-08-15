<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Garage Login | ServiceSathi</title>
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
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.login-container {
	width: 100%;
	max-width: 450px;
	margin: 0 auto;
}

.logo-header {
	text-align: center;
	margin-bottom: 40px;
}

.logo {
	font-size: 2.8rem;
	font-weight: 700;
	display: inline-flex;
	align-items: center;
	gap: 15px;
	margin-bottom: 10px;
	color: #fff;
}

.logo i {
	color: #e67e22;
	background: rgba(230, 126, 34, 0.15);
	width: 70px;
	height: 70px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 20px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.tagline {
	font-size: 1.2rem;
	color: #94a3b8;
	letter-spacing: 0.5px;
}

.login-card {
	background: rgba(30, 41, 59, 0.85);
	backdrop-filter: blur(12px);
	border-radius: 20px;
	padding: 40px;
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.4);
	border: 1px solid rgba(255, 255, 255, 0.08);
	position: relative;
	overflow: hidden;
}

.login-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 5px;
	background: linear-gradient(to right, #e67e22, #d35400);
}

.login-title {
	font-size: 2rem;
	font-weight: 700;
	text-align: center;
	margin-bottom: 35px;
	color: #e2e8f0;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 15px;
}

.login-title i {
	color: #e67e22;
	font-size: 1.8rem;
}

.form-group {
	margin-bottom: 25px;
}

.form-label {
	display: block;
	margin-bottom: 10px;
	font-weight: 600;
	color: #cbd5e1;
	font-size: 1.05rem;
}

.input-group {
	position: relative;
}

.input-group i {
	position: absolute;
	left: 18px;
	top: 50%;
	transform: translateY(-50%);
	color: #94a3b8;
	font-size: 1.2rem;
}

.form-control {
	width: 100%;
	padding: 16px 20px 16px 55px;
	background: rgba(15, 23, 42, 0.6);
	border: 1px solid rgba(255, 255, 255, 0.1);
	border-radius: 12px;
	font-size: 1.05rem;
	color: #e2e8f0;
	transition: all 0.3s ease;
}

.form-control:focus {
	outline: none;
	border-color: #e67e22;
	box-shadow: 0 0 0 3px rgba(230, 126, 34, 0.25);
	background: rgba(15, 23, 42, 0.8);
}

.btn-login {
	width: 100%;
	padding: 17px;
	background: linear-gradient(to right, #e67e22, #d35400);
	color: white;
	border: none;
	border-radius: 12px;
	font-size: 1.1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	margin-top: 15px;
	box-shadow: 0 5px 15px rgba(230, 126, 34, 0.3);
}

.btn-login:hover {
	background: linear-gradient(to right, #d35400, #c0392b);
	transform: translateY(-3px);
	box-shadow: 0 8px 20px rgba(230, 126, 34, 0.4);
}

.btn-login:active {
	transform: translateY(0);
}

.forgot-link {
	display: block;
	text-align: center;
	margin-top: 25px;
	color: #94a3b8;
	text-decoration: none;
	transition: color 0.3s ease;
	font-size: 1rem;
}

.forgot-link:hover {
	color: #e67e22;
}

.divider {
	height: 1px;
	background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.1),
		transparent);
	margin: 35px 0;
}

.security-note {
	text-align: center;
	font-size: 0.9rem;
	color: #64748b;
	margin-top: 25px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
}

.security-note i {
	color: #e67e22;
}

/* Responsive design */
@media ( max-width : 576px) {
	.login-card {
		padding: 30px;
	}
	.logo {
		font-size: 2.3rem;
	}
	.logo i {
		width: 60px;
		height: 60px;
		font-size: 1.8rem;
	}
	.login-title {
		font-size: 1.7rem;
	}
}

@media ( max-width : 400px) {
	.login-card {
		padding: 25px 20px;
	}
	.logo {
		font-size: 2rem;
		flex-direction: column;
		gap: 10px;
	}
	.logo i {
		width: 55px;
		height: 55px;
	}
	.tagline {
		font-size: 1rem;
	}
	.login-title {
		font-size: 1.5rem;
	}
}

/* Animation */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.login-card {
	animation: fadeIn 0.8s ease-out forwards;
}
</style>
</head>
<body>
	<div class="login-container">
		<div class="logo-header">
			<div class="logo">
				<i class="fas fa-tools"></i> <span>ServiceSathi</span>
			</div>
			<div class="tagline">Garage Technician Access Portal</div>
		</div>

		<div class="login-card">
			<h1 class="login-title">
				<i class="fas fa-lock"></i> Garage Login
			</h1>

			<form action="submitgaragelogin" method="post">
				<div class="form-group">
					<label class="form-label" for="contact">Contact Number</label>
					<div class="input-group">
						<i class="fas fa-phone"></i> <input type="text" id="contact"
							name="contact" class="form-control"
							placeholder="Enter your contact number" required>
					</div>
				</div>

				<div class="form-group">
					<label class="form-label" for="password">Password</label>
					<div class="input-group">
						<i class="fas fa-key"></i> <input type="password" id="password"
							name="password" class="form-control"
							placeholder="Enter your password" required>
					</div>
				</div>

				<button type="submit" class="btn-login">
					<i class="fas fa-sign-in-alt"></i> Login to Dashboard
				</button>

				<div class="divider"></div>

				<div class="security-note">
					<i class="fas fa-shield-alt"></i> Secure access for authorized
					technicians only
				</div>
			</form>
		</div>
	</div>
</body>
</html>