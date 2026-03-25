<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.fooddelivery.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    // Login guard
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>NammAFoodS | My Profile</title>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(135deg, #fff5f0, #ffe8dd);
    }

    /* NAVBAR */
    .navbar {
        background: linear-gradient(90deg, #ff4d2d, #ff784e);
        padding: 16px 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: white;
        box-shadow: 0 4px 12px rgba(0,0,0,0.25);
    }

    .logo {
        font-size: 26px;
        font-weight: bold;
    }

    .nav-links a {
        color: white;
        margin-left: 30px;
        text-decoration: none;
        font-size: 16px;
        font-weight: 500;
    }

    /* PROFILE CARD */
    .profile-container {
        max-width: 500px;
        margin: 70px auto;
        background: white;
        padding: 35px;
        border-radius: 20px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.25);
        animation: fadeUp 0.6s ease;
    }

    @keyframes fadeUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #222;
    }

    .profile-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 16px;
        font-size: 15px;
        padding-bottom: 8px;
        border-bottom: 1px solid #eee;
    }

    .label {
        font-weight: bold;
        color: #555;
    }

    .value {
        color: #222;
    }

    .actions {
        text-align: center;
        margin-top: 30px;
    }

    .btn {
        display: inline-block;
        padding: 12px 30px;
        border-radius: 30px;
        background: linear-gradient(135deg, #ff6a00, #ff2f00);
        color: white;
        text-decoration: none;
        font-weight: bold;
        transition: all 0.3s ease;
        box-shadow: 0 6px 16px rgba(255,47,0,0.35);
    }

    .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(255,47,0,0.5);
    }
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">FoodDelivery</div>
    <div class="nav-links">
        <a href="Restaurant">Home</a>
        <a href="cart.jsp">Cart</a>
        <a href="profile.jsp">Profile</a>
    </div>
</div>

<!-- PROFILE -->
<div class="profile-container">

    <h2>My Profile</h2>

    <div class="profile-row">
        <div class="label">Name</div>
        <div class="value"><%= user.getName() %></div>
    </div>

    <div class="profile-row">
        <div class="label">Email</div>
        <div class="value"><%= user.getEmail() %></div>
    </div>

    <div class="profile-row">
        <div class="label">Phone</div>
        <div class="value"><%= user.getPhone() != null ? user.getPhone() : "-" %></div>
    </div>

    <div class="profile-row">
        <div class="label">Address</div>
        <div class="value"><%= user.getAddress() != null ? user.getAddress() : "-" %></div>
    </div>

    <div class="actions">
        <a href="Restaurant" class="btn">Order Food</a>
    </div>

</div>

</body>
</html>
