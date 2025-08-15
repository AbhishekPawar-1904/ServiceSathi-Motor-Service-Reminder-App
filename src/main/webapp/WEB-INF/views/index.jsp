<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServiceSathi | Automotive Service Portal</title>
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
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	position: relative;
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
}

header {
	text-align: center;
	margin-bottom: 50px;
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

.tagline {
	color: rgba(255, 255, 255, 0.85);
	font-size: 18px;
	margin-top: 15px;
	font-weight: 300;
	max-width: 600px;
	margin: 15px auto 0;
}

.portals-container {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 30px;
	perspective: 1000px;
}

.portal {
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(12px);
	border-radius: 20px;
	padding: 30px;
	width: 320px;
	text-align: center;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
	border: 1px solid rgba(255, 255, 255, 0.12);
	transition: transform 0.4s, box-shadow 0.4s, background 0.4s;
	animation: fadeInUp 0.8s ease;
	cursor: pointer;
	position: relative;
	overflow: hidden;
	z-index: 2;
}

.portal::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1),
		transparent);
	z-index: -1;
	transform: translateX(-100%);
	transition: transform 0.6s ease;
}

.portal:hover::before {
	transform: translateX(100%);
}

.portal:nth-child(1) {
	animation-delay: 0.2s;
}

.portal:nth-child(2) {
	animation-delay: 0.4s;
}

.portal:nth-child(3) {
	animation-delay: 0.6s;
}

.portal:hover {
	transform: translateY(-15px) scale(1.03);
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
	background: rgba(255, 255, 255, 0.12);
}

.portal-icon {
	font-size: 64px;
	margin-bottom: 20px;
	transition: transform 0.3s;
}

.admin .portal-icon {
	color: #1a75bc;
	text-shadow: 0 0 15px rgba(26, 117, 188, 0.5);
}

.technician .portal-icon {
	color: #f39c12;
	text-shadow: 0 0 15px rgba(243, 156, 18, 0.5);
}

.vehicle .portal-icon {
	color: #2ecc71;
	text-shadow: 0 0 15px rgba(46, 204, 113, 0.5);
}

.portal:hover .portal-icon {
	transform: scale(1.1) rotate(5deg);
}

.portal-title {
	color: white;
	font-size: 28px;
	margin-bottom: 15px;
	font-weight: 600;
}

.portal-desc {
	color: rgba(255, 255, 255, 0.8);
	font-size: 15px;
	margin-bottom: 25px;
	line-height: 1.6;
	min-height: 75px;
}

.login-btn {
	display: inline-block;
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

.login-btn::after {
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

.login-btn:hover::after {
	transform: translateX(100%) skewX(-15deg);
}

.login-btn:hover {
	background: rgba(255, 255, 255, 0.2);
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.admin .login-btn:hover {
	background: linear-gradient(to right, #1a75bc, #3498db);
}

.technician .login-btn:hover {
	background: linear-gradient(to right, #f39c12, #f1c40f);
}

.vehicle .login-btn:hover {
	background: linear-gradient(to right, #2ecc71, #1abc9c);
}

.stats-container {
	display: flex;
	justify-content: center;
	gap: 30px;
	margin-top: 40px;
	animation: fadeIn 1.5s ease;
}

.stat {
	background: rgba(255, 255, 255, 0.08);
	border-radius: 15px;
	padding: 15px 25px;
	text-align: center;
	min-width: 150px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s;
}

.stat:hover {
	transform: translateY(-5px);
}

.stat-value {
	font-size: 32px;
	font-weight: 700;
	color: #1a75bc;
	margin-bottom: 5px;
}

.stat-label {
	color: rgba(255, 255, 255, 0.8);
	font-size: 14px;
}

.footer {
	text-align: center;
	margin-top: 50px;
	color: rgba(255, 255, 255, 0.6);
	font-size: 14px;
	animation: fadeIn 1.5s ease;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
}

.social-icons {
	display: flex;
	gap: 20px;
	margin-bottom: 10px;
}

.social-icon {
	color: rgba(255, 255, 255, 0.7);
	font-size: 18px;
	transition: all 0.3s;
}

.social-icon:hover {
	color: #1a75bc;
	transform: translateY(-3px);
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
	.portals-container {
		gap: 20px;
	}
	.portal {
		width: 280px;
	}
	.stats-container {
		flex-wrap: wrap;
	}
}

@media ( max-width : 768px) {
	.portals-container {
		flex-direction: column;
		align-items: center;
	}
	.portal {
		width: 90%;
		max-width: 400px;
	}
	.logo-text {
		font-size: 36px;
	}
}

@media ( max-width : 480px) {
	.logo-text {
		font-size: 32px;
	}
	.portal-title {
		font-size: 24px;
	}
	.portal {
		padding: 25px 20px;
	}
	.stat {
		min-width: 120px;
		padding: 12px 15px;
	}
	.stat-value {
		font-size: 26px;
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
			<p class="tagline">Your Trusted Automotive Service Partner</p>
		</header>

		<div class="portals-container">
			<div class="portal admin">
				<div class="portal-icon">
					<i class="fas fa-user-shield"></i>
				</div>
				<h2 class="portal-title">Admin Portal</h2>
				<p class="portal-desc">Access the administrative dashboard to
					manage services, view reports, and configure system settings.</p>
				<a href="adminLogin" class="login-btn">Login as Admin</a>
			</div>

			<div class="portal technician">
				<div class="portal-icon">
					<i class="fas fa-tools"></i>
				</div>
				<h2 class="portal-title">Technician Portal</h2>
				<p class="portal-desc">Manage service requests, update job
					statuses, and communicate with vehicle owners.</p>
				<a href="garageLogin" class="login-btn">Login as Technician</a>
			</div>

			<div class="portal vehicle">
				<div class="portal-icon">
					<i class="fas fa-car-side"></i>
				</div>
				<h2 class="portal-title">Vehicle Portal</h2>
				<p class="portal-desc">Track your vehicle service history,
					schedule appointments, and receive real-time updates.</p>
				<a href="vehicleLoginOpen" class="login-btn">Vehicle Login</a>
			</div>
		</div>

		<div class="stats-container">
			<div class="stat">
				<div class="stat-value">10,000+</div>
				<div class="stat-label">Vehicles Serviced</div>
			</div>
			<div class="stat">
				<div class="stat-value">99%</div>
				<div class="stat-label">Customer Satisfaction</div>
			</div>
			<div class="stat">
				<div class="stat-value">24/7</div>
				<div class="stat-label">Service Support</div>
			</div>
		</div>

		<div class="footer">
			<div class="social-icons">
				<a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social-icon"><i class="fab fa-twitter"></i></a> <a
					href="#" class="social-icon"><i class="fab fa-instagram"></i></a> <a
					href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<p>&copy; 2025 ServiceSathi. All rights reserved. | Premium
				Automotive Solutions</p>
		</div>
	</div>

	<script>
        // Portal hover animations
        document.querySelectorAll('.portal').forEach(portal => {
            portal.addEventListener('mousemove', (e) => {
                const rect = portal.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                
                const moveX = (x - rect.width / 2) / 20;
                const moveY = (y - rect.height / 2) / 20;
                
                portal.style.transform = `translate(${moveX}px, ${moveY}px) translateY(-15px) scale(1.03)`;
            });
            
            portal.addEventListener('mouseleave', () => {
                portal.style.transform = 'translateY(-15px) scale(1.03)';
            });
        });

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