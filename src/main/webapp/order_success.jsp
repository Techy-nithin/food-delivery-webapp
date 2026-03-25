<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>NammAFoodS  | Order Placed </title>

<style>
* { box-sizing: border-box; }

body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #fff5f0, #ffe8dd);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* ================= SUCCESS CARD ================= */
.success-box {
    background: white;
    padding: 45px 40px;
    width: 420px;
    border-radius: 22px;
    box-shadow: 0 25px 55px rgba(0,0,0,0.25);
    text-align: center;
    animation: popIn 0.9s ease;
    position: relative;
}

/* CHECK ICON */
.check-circle {
    width: 90px;
    height: 90px;
    background: linear-gradient(135deg, #4caf50, #2ecc71);
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    font-size: 48px;
    margin: auto;
    box-shadow: 0 12px 25px rgba(76,175,80,0.6);
    animation: bounce 1.2s ease;
}

h2 {
    margin-top: 25px;
    margin-bottom: 10px;
    color: #222;
}

.order-id {
    margin-top: 10px;
    font-size: 18px;
    color: #555;
}

.order-id span {
    font-size: 22px;
    font-weight: 800;
    color: #ff4d2d;
}

/* BUTTON */
.btn {
    margin-top: 30px;
    display: inline-block;
    padding: 14px 34px;
    background: linear-gradient(135deg, #ff6a00, #ff2f00);
    color: white;
    text-decoration: none;
    border-radius: 40px;
    font-weight: 800;
    font-size: 16px;
    transition: transform 0.3s, box-shadow 0.3s;
    box-shadow: 0 12px 30px rgba(255,47,0,0.45);
}

.btn:hover {
    transform: translateY(-4px);
    box-shadow: 0 20px 45px rgba(255,47,0,0.6);
}

/* CONFETTI */
.confetti {
    position: absolute;
    width: 100%;
    height: 100%;
    top: -20px;
    left: 0;
    pointer-events: none;
}

/* ANIMATIONS */
@keyframes popIn {
    from { opacity: 0; transform: scale(0.7); }
    to { opacity: 1; transform: scale(1); }
}

@keyframes bounce {
    0% { transform: scale(0.5); }
    60% { transform: scale(1.15); }
    100% { transform: scale(1); }
}
</style>
</head>

<body>

<div class="success-box">

    <div class="check-circle">✓</div>

    <h2>Order Placed Successfully!</h2>

    <div class="order-id">
        Your Order ID<br>
        <span>#<%= session.getAttribute("orderId") %></span>
    </div>

    <a href="Restaurant" class="btn">
        Order More Food 🍔
    </a>

</div>

</body>
</html>
