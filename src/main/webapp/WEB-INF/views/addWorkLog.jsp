<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Work Log | GaragePro</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
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
	color: #fff;
}

.floating-shapes div {
	position: absolute;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.06);
	animation: float 15s linear infinite;
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

@
keyframes fadeInUp {from { opacity:0;
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
	font-size: 28px;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 15px;
}

.form-header i {
	font-size: 34px;
	color: #e67e22;
	background: #ffffff15;
	padding: 12px;
	border-radius: 50%;
	box-shadow: 0 0 15px rgba(230, 126, 34, 0.4);
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

.form-group.full-width {
	grid-column: 1/-1;
}

label {
	color: #ccc;
	font-weight: 500;
	margin-bottom: 6px;
	display: flex;
	align-items: center;
	gap: 8px;
}

label i {
	color: #e67e22;
	font-size: 14px;
}

input, textarea, select {
	padding: 12px 15px;
	border-radius: 8px;
	border: none;
	background-color: rgba(255, 255, 255, 0.1);
	color: #fff;
	font-size: 16px;
	transition: 0.3s ease;
}

textarea {
	min-height: 120px;
	resize: vertical;
}

input:focus, textarea:focus, select:focus {
	outline: none;
	background-color: rgba(255, 255, 255, 0.2);
	box-shadow: 0 0 0 3px rgba(230, 126, 34, 0.2);
}

input::placeholder, textarea::placeholder {
	color: #aaa;
	font-style: italic;
}

.submit-btn {
	grid-column: 1/-1;
	padding: 16px;
	background: linear-gradient(to right, #e67e22, #d35400);
	color: white;
	border: none;
	border-radius: 50px;
	font-size: 18px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	margin-top: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
}

.submit-btn:hover {
	transform: scale(1.03);
	background: linear-gradient(to right, #d35400, #e67e22);
	box-shadow: 0 0 20px rgba(230, 126, 34, 0.6);
}

.date-time-group {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 15px;
}

@media ( max-width : 768px) {
	.form-wrapper {
		padding: 30px 20px;
	}
	.form-header {
		font-size: 22px;
	}
	.form-header i {
		font-size: 28px;
	}
	.date-time-group {
		grid-template-columns: 1fr;
	}
}

.form-footer {
	grid-column: 1/-1;
	text-align: center;
	margin-top: 20px;
	color: #aaa;
	font-size: 14px;
	border-top: 1px solid rgba(255, 255, 255, 0.1);
	padding-top: 20px;
}

.form-footer a {
	color: #e67e22;
	text-decoration: none;
	transition: color 0.3s;
}

.form-footer a:hover {
	color: #ff9c4a;
	text-decoration: underline;
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

	<div class="form-wrapper">
		<div class="form-header">
			<i class="fas fa-wrench"></i> Add Work Log
		</div>

		<form action="SubmitAddWorkLog" method="post">
			<div class="form-group">
				<label for="vehicleNo"><i class="fas fa-car"></i> Vehicle
					Number</label> <input type="text" id="vehicleNo" name="vehicleNo" required
					placeholder="ABC-123">
			</div>

			<div class="form-group">
				<label for="title"><i class="fas fa-heading"></i> Work Title</label>
				<input type="text" id="title" name="title" required
					placeholder="Brake system repair">
			</div>

			<div class="form-group full-width">
				<label for="description"><i class="fas fa-file-alt"></i>
					Description</label>
				<textarea id="description" name="description" required
					placeholder="Describe the work performed..."></textarea>
			</div>

			<div class="form-group">
				<label for="category"><i class="fas fa-tags"></i> Category</label> <select
					id="category" name="category" required>
					<option value="" disabled selected>Select category</option>
					<option value="maintenance">Maintenance</option>
					<option value="repair">Repair</option>
					<option value="diagnostics">Diagnostics</option>
					<option value="tire_service">Tire Service</option>
					<option value="electrical">Electrical</option>
				</select>
			</div>

			<div class="form-group">
				<label for="date"><i class="far fa-calendar"></i> Date</label> <input
					type="date" id="date" name="date" required>
			</div>

			<div class="form-group">
				<label for="time"><i class="far fa-clock"></i> Time</label> <input
					type="time" id="time" name="time" required>
			</div>

			<div class="form-group">
				<label for="email"><i class="far fa-envelope"></i> Customer
					Email</label> <input type="email" id="email" name="email" required
					placeholder="customer@example.com">
			</div>

			<div class="form-group">
				<label for="contact"><i class="fas fa-phone"></i> Contact
					Number</label> <input type="text" id="contact" name="contact" required
					placeholder="+1 (555) 123-4567">
			</div>

			<div class="form-group">
				<label for="dueDate"><i class="fas fa-calendar-check"></i>
					Due Date</label> <input type="date" id="dueDate" name="dueDate" required>
			</div>

			<button type="submit" class="submit-btn">
				<i class="fas fa-plus-circle"></i> Add Work Log
			</button>

			<div class="form-footer">
				<p>
					GaragePro Work Management System &copy; 2023 | <a href="#">View
						All Work Logs</a>
				</p>
			</div>
		</form>
	</div>

	<script>
        // Set default dates
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date();
            const tomorrow = new Date();
            tomorrow.setDate(today.getDate() + 1);
            
            // Format dates to YYYY-MM-DD
            const formatDate = (date) => {
                return date.toISOString().split('T')[0];
            };
            
            document.getElementById('date').value = formatDate(today);
            document.getElementById('dueDate').value = formatDate(tomorrow);
            
            // Set current time
            const now = new Date();
            const hours = now.getHours().toString().padStart(2, '0');
            const minutes = now.getMinutes().toString().padStart(2, '0');
            document.getElementById('time').value = `${hours}:${minutes}`;
            
            // Add auto-complete for vehicle number
            const vehicleInput = document.getElementById('vehicleNo');
            vehicleInput.addEventListener('input', function() {
                if (vehicleInput.value.length > 0) {
                    vehicleInput.style.background = "rgba(230, 126, 34, 0.15)";
                } else {
                    vehicleInput.style.background = "rgba(255, 255, 255, 0.1)";
                }
            });
        });
    </script>
</body>
</html>