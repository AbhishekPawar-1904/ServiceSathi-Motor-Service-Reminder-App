<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Vehicle Dashboard | ServiceSathi</title>
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
            overflow: auto;
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

        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-1000px) rotate(720deg);
                opacity: 0;
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

        @keyframes drive {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(calc(100vw + 200px));
            }
        }

        /* Header Styles */
        header {
            background: rgba(26, 117, 188, 0.7);
            color: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 10;
            position: relative;
            backdrop-filter: blur(10px);
        }
        
        .logo {
            display: flex;
            align-items: center;
        }
        
        .logo-icon {
            font-size: 36px;
            color: #fff;
            margin-right: 15px;
            animation: pulse 2s infinite;
        }
        
        .logo-text {
            font-size: 28px;
            font-weight: 800;
            color: #fff;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
            letter-spacing: 1px;
            font-family: 'Raleway', sans-serif;
        }
        
        .logout-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 10px 20px;
            background: rgba(255, 255, 255, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 50px;
            color: white;
            font-size: 16px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            z-index: 2;
        }
        
        .logout-btn::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            transform: translateX(-100%) skewX(-15deg);
            transition: transform 0.4s ease;
            z-index: -1;
        }
        
        .logout-btn:hover::after {
            transform: translateX(100%) skewX(-15deg);
        }
        
        .logout-btn:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        /* Main Content */
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1.5rem;
            width: 100%;
            z-index: 10;
            position: relative;
        }
        
        .dashboard-title {
            text-align: center;
            margin-bottom: 3rem;
            color: white;
            position: relative;
            padding-bottom: 1rem;
        }
        
        .dashboard-title h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
        }
        
        .dashboard-title p {
            font-size: 1.2rem;
            color: rgba(255, 255, 255, 0.8);
            max-width: 600px;
            margin: 0 auto;
        }
        
        .dashboard-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(to right, #1a75bc, #2ecc71, #f39c12);
            border-radius: 2px;
        }
        
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        
        .card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 2.5rem 2rem;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.12);
            transition: all 0.4s ease;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            color: white;
            position: relative;
            overflow: hidden;
            z-index: 2;
        }
        
        .card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            z-index: -1;
            transform: translateX(-100%);
            transition: transform 0.6s ease;
        }
        
        .card:hover::before {
            transform: translateX(100%);
        }
        
        .card:hover {
            transform: translateY(-15px) scale(1.03);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
            background: rgba(255, 255, 255, 0.12);
        }
        
        .card i {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            transition: transform 0.3s;
            display: block;
        }
        
        .card:nth-child(1) i {
            color: #2ecc71;
            text-shadow: 0 0 15px rgba(46, 204, 113, 0.5);
        }
        
        .card:nth-child(2) i {
            color: #f39c12;
            text-shadow: 0 0 15px rgba(243, 156, 18, 0.5);
        }
        
        .card:nth-child(3) i {
            color: #e74c3c;
            text-shadow: 0 0 15px rgba(231, 76, 60, 0.5);
        }
        
        .card:hover i {
            transform: scale(1.1) rotate(5deg);
        }
        
        .card-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.8rem;
        }
        
        .card-desc {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1rem;
            line-height: 1.6;
        }

        /* Animations */
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .card-container {
                gap: 1.5rem;
            }
        }

        @media (max-width: 768px) {
            header {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
                padding: 1rem;
            }
            
            .logo {
                justify-content: center;
                margin-bottom: 10px;
            }
            
            .dashboard-title h1 {
                font-size: 2rem;
            }
            
            .card-container {
                grid-template-columns: 1fr;
                max-width: 500px;
                margin: 0 auto;
            }
        }

        @media (max-width: 480px) {
            .logo-text {
                font-size: 24px;
            }
            
            .dashboard-title h1 {
                font-size: 1.8rem;
            }
            
            .dashboard-title p {
                font-size: 1rem;
            }
            
            .card {
                padding: 2rem 1.5rem;
            }
            
            .card i {
                font-size: 3rem;
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

    <!-- Header -->
    <header>
        <div class="logo">
            <div class="logo-icon">
                <i class="fas fa-car"></i>
            </div>
            <div class="logo-text">ServiceSathi</div>
        </div>
        <a href="logout" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="dashboard-title">
            <h1>Vehicle Dashboard</h1>
            <p>Manage your vehicle's service history and upcoming maintenance</p>
        </div>
        
        <div class="card-container">
            <a href="viewvehicleworklogs" class="card">
                <i class="fas fa-clipboard-check"></i>
                <div class="card-title">All Work Logs</div>
                <div class="card-desc">View complete service history for your vehicle</div>
            </a>
            
            <a href="viewvehiclenearbyexpirylogs" class="card">
                <i class="fas fa-clock"></i>
                <div class="card-title">Upcoming Expiries</div>
                <div class="card-desc">Check services that are due soon</div>
            </a>
            
            <a href="viewexpiredvehicleworklogs" class="card">
                <i class="fas fa-calendar-times"></i>
                <div class="card-title">Expired Services</div>
                <div class="card-desc">View overdue maintenance tasks</div>
            </a>
        </div>
    </div>

    <script>
        // Card hover animations
        document.querySelectorAll('.card').forEach(card => {
            card.addEventListener('mousemove', (e) => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                
                const moveX = (x - rect.width / 2) / 20;
                const moveY = (y - rect.height / 2) / 20;
                
                card.style.transform = `translate(${moveX}px, ${moveY}px) translateY(-15px) scale(1.03)`;
            });
            
            card.addEventListener('mouseleave', () => {
                card.style.transform = 'translateY(-15px) scale(1.03)';
            });
        });

        // Car animation
        const cars = document.querySelectorAll('.car-animation');
        cars.forEach(car => {
            car.style.animationDelay = `${Math.random() * 5}s`;
        });
    </script>
</body>
</html>