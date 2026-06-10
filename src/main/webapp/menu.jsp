<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.fooddelivery.model.MenuItem" %>

<!DOCTYPE html>
<html>
<head>
<title>NammAFoodS | Menu</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #fff5f0, #ffe8dd);
}

/* ================= NAVBAR ================= */
.navbar {
    background: linear-gradient(90deg, #ff4d2d, #ff784e);
    padding: 16px 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
    box-shadow: 0 6px 20px rgba(0,0,0,0.3);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo {
    font-size: 28px;
    font-weight: 800;
    letter-spacing: 1px;
}

.nav-links a {
    color: white;
    margin-left: 28px;
    text-decoration: none;
    font-size: 16px;
    font-weight: 600;
    position: relative;
}

.nav-links a::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -6px;
    width: 0;
    height: 2px;
    background: white;
    transition: 0.3s;
}

.nav-links a:hover::after {
    width: 100%;
}

/* ================= HEADER ================= */
.menu-header {
    text-align: center;
    padding: 60px 20px 40px;
    animation: fadeIn 1s ease;
}

.menu-header h1 {
    font-size: 38px;
    margin-bottom: 8px;
    color: #222;
}

.menu-header p {
    color: #555;
    font-size: 16px;
}

/* ================= GRID ================= */
.menu-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 35px;
    padding: 0 60px 80px;
}

/* ================= CARD ================= */
.menu-card {
    background: linear-gradient(180deg, #ffffff, #fff7f2);
    border-radius: 22px;
    overflow: hidden;
    box-shadow: 0 14px 28px rgba(0,0,0,0.18);
    transition: transform 0.35s ease, box-shadow 0.35s ease;
    position: relative;
}

.menu-card:hover {
    transform: translateY(-10px) scale(1.03);
    box-shadow: 0 26px 45px rgba(0,0,0,0.35);
}

/* IMAGE */
.menu-card img {
    width: 100%;
    height: 190px;
    object-fit: cover;
}

/* DETAILS */
.menu-details {
    padding: 18px;
}

.item-name {
    font-size: 19px;
    font-weight: 800;
    margin-bottom: 6px;
    color: #222;
}

.item-desc {
    font-size: 13px;
    color: #666;
    line-height: 1.5;
    margin-bottom: 14px;
}

/* BOTTOM */
.menu-bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.price {
    font-size: 17px;
    font-weight: bold;
    color: #2e7d32;
}

/* ================= BUTTON ================= */
.add-cart-btn {
    background: linear-gradient(135deg, #ff6a00, #ff2f00);
    color: white;
    border: none;
    padding: 10px 22px;
    border-radius: 30px;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 6px 14px rgba(255, 47, 0, 0.35);
}

.add-cart-btn:hover {
    transform: translateY(-3px) scale(1.05);
    box-shadow: 0 12px 24px rgba(255, 47, 0, 0.5);
}

.add-cart-btn:active {
    transform: scale(0.95);
}

/* ANIMATION */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">NammAFoodS</div>
    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/Restaurant">Home</a>
        <a href="cart.jsp">Cart</a>
        <a href="<%= request.getContextPath() %>/profile.jsp">Profile</a>

    </div>
</div>

<!-- HEADER -->
<div class="menu-header">
    <h1>Explore Our Delicious Menu 🍽️</h1>
    <p>Fresh ingredients • Chef special • Best taste</p>
</div>

<!-- MENU ITEMS -->
<div class="menu-container">

<%
List<MenuItem> menuByRestaurantId =
    (List<MenuItem>) request.getAttribute("menuByRestaurantId");

for (MenuItem menu : menuByRestaurantId) {
%>

<div class="menu-card">
    <img src="<%= request.getContextPath() + "/" + menu.getImageUrl() %>" alt="Food">

    <div class="menu-details">
        <div class="item-name"><%= menu.getItemName() %></div>
        <div class="item-desc"><%= menu.getDescription() %></div>

        <div class="menu-bottom">
            <div class="price">₹<%= menu.getPrice() %></div>

            <form action="Cart" method="post">
                <input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
                <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId() %>">
                <input type="hidden" name="quantity" value="1">
                <input type="hidden" name="action" value="add">
                <button type="submit" class="add-cart-btn">Add to Cart</button>
            </form>
        </div>
    </div>
</div>

<%
}
%>

</div>

</body>
</html>
