<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Vehicle | ServiceSathi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.9)),
            url('https://images.unsplash.com/photo-1494976388531-d1058494cdd8?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }

        .floating-shapes div {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.06);
            animation: float 15s linear infinite;
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

        .form-wrapper {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            padding: 50px 40px;
            border-radius: 20px;
            width: 90%;
            max-width: 850px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);
            animation: fadeInUp 1s ease-in-out;
            z-index: 2;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
            color: #fff;
            font-size: 28px;
            position: relative;
        }

        .form-header i {
            font-size: 34px;
            color: #00d4ff;
            margin-right: 12px;
            background: #ffffff15;
            padding: 12px;
            border-radius: 50%;
            box-shadow: 0 0 15px rgba(0, 212, 255, 0.4);
            transition: transform 0.3s ease;
        }

        .form-header i:hover {
            transform: rotate(15deg) scale(1.1);
        }

        form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            color: #ccc;
            font-weight: 500;
            margin-bottom: 6px;
        }

        input {
            padding: 12px;
            border-radius: 8px;
            border: none;
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-size: 16px;
            transition: 0.3s ease;
        }

        input:focus {
            outline: none;
            background-color: rgba(255, 255, 255, 0.2);
        }

        input::placeholder {
            color: #ccc;
        }

        .submit-btn {
            grid-column: 1 / -1;
            padding: 14px;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            transform: scale(1.03);
            background: linear-gradient(to right, #0072ff, #00c6ff);
            box-shadow: 0 0 15px rgba(0, 198, 255, 0.4);
        }

        @media (max-width: 768px) {
            .form-wrapper {
                padding: 30px 20px;
            }

            .form-header {
                font-size: 22px;
            }

            .form-header i {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>

    <div class="floating-shapes">
        <div></div><div></div><div></div><div></div>
    </div>

    <div class="form-wrapper">
        <div class="form-header">
            <i class="fas fa-car"></i> Add New Vehicle
        </div>

        <form action="SubmitAddVehicle" method="post">
            <div class="form-group">
                <label for="vehicleNo">Vehicle Number</label>
                <input type="text" id="vehicleNo" name="vehicleNo" required>
            </div>
            <div class="form-group">
                <label for="chassisNo">Chassis Number</label>
                <input type="text" id="chassisNo" name="chassisNo" required>
            </div>
            <div class="form-group">
                <label for="name">Vehicle Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="ownerName">Owner Name</label>
                <input type="text" id="ownerName" name="ownerName" required>
            </div>
            <div class="form-group">
                <label for="contact">Contact</label>
                <input type="text" id="contact" name="contact" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit" class="submit-btn">Add Vehicle</button>
        </form>
    </div>

</body>
</html>
