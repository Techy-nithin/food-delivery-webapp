<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.fooddelivery.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
<title>NammaFoods | Restaurants</title>

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

/* ================= HERO ================= */
.hero {
    text-align: center;
    padding: 70px 20px 50px;
    animation: fadeIn 1s ease;
}

.hero h1 {
    font-size: 38px;
    color: #222;
    margin-bottom: 10px;
}

.hero p {
    font-size: 17px;
    color: #555;
}

/* ================= GRID ================= */
.restaurant-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 35px;
    padding: 30px 60px 70px;
}

/* ================= CARD ================= */
.restaurant-card {
    background: linear-gradient(180deg, #ffffff, #fff7f2);
    border-radius: 22px;
    overflow: hidden;
    box-shadow: 0 14px 28px rgba(0,0,0,0.18);
    transition: transform 0.35s ease, box-shadow 0.35s ease;
    position: relative;
    cursor: pointer;
}

.restaurant-card:hover {
    transform: translateY(-12px) scale(1.03);
    box-shadow: 0 26px 45px rgba(0,0,0,0.35);
}

/* IMAGE */
.restaurant-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

/* GRADIENT OVERLAY */
.overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(to bottom, rgba(0,0,0,0.05), rgba(0,0,0,0.5));
}

/* OPEN TAG */
.status {
    position: absolute;
    top: 15px;
    left: 15px;
    background: linear-gradient(135deg, #2ecc71, #27ae60);
    color: white;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
}

/* DETAILS */
.restaurant-details {
    padding: 18px;
}

.restaurant-name {
    font-size: 20px;
    font-weight: 800;
    margin-bottom: 6px;
    color: #222;
}

.cuisine {
    font-size: 14px;
    color: #777;
    margin-bottom: 12px;
}

/* BOTTOM */
.bottom-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.rating {
    background: linear-gradient(135deg, #48c479, #2ecc71);
    color: white;
    padding: 6px 10px;
    border-radius: 10px;
    font-size: 14px;
    font-weight: bold;
}

.delivery-time {
    font-size: 14px;
    font-weight: 700;
    color: #444;
}

/* LINK RESET */
a {
    text-decoration: none;
}

/* ANIMATIONS */
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
        <a href="Restaurant">Home</a>
        <a href="<%= request.getContextPath() %>/login.jsp">Login</a>
        <a href="cart.jsp">Cart</a>
        <a href="<%= request.getContextPath() %>/profile.jsp">Profile</a>

    </div>
</div>

<!-- HERO -->
<div class="hero">
    <h1>Hungry? Discover the best food near you 🍽️</h1>
    <p>Fresh meals • Fast delivery • Top rated restaurants</p>
</div>

<!-- RESTAURANT LIST -->
<div class="restaurant-container">

<%
List<Restaurant> allRestaurants =
    (List<Restaurant>) request.getAttribute("allRestaurants");

for (Restaurant rest : allRestaurants) {
%>
<a href="menu?restaurantId=<%=rest.getRestaurantId()%>">
    <div class="restaurant-card">
        <span class="status">OPEN</span>
        <img src="<%=rest.getImageUrl()%>" alt="Restaurant Image">
        <div class="overlay"></div>

        <div class="restaurant-details">
            <div class="restaurant-name"><%=rest.getRestaurantName()%></div>
            <div class="cuisine"><%=rest.getCuisineType()%></div>

            <div class="bottom-info">
                <div class="rating">⭐ <%=rest.getRating()%></div>
                <div class="delivery-time"><%=rest.getDeliveryTime()%> mins</div>
            </div>
        </div>
    </div>
</a>
<%
}
%>

</div>

</body>
</html>
