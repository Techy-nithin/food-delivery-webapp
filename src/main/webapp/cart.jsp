<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.fooddelivery.model.Cart" %>
<%@ page import="com.fooddelivery.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<title>NammAFoodS | Cart</title>

<style>
* { box-sizing: border-box; }

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
}

/* ================= CART CONTAINER ================= */
.cart-container {
    max-width: 900px;
    margin: 50px auto;
    padding: 20px;
    animation: fadeUp 0.8s ease;
}

h2 {
    margin-bottom: 25px;
    color: #222;
}

/* ADD MORE */
.add-more {
    display: inline-block;
    margin-bottom: 30px;
    color: #ff4d2d;
    font-weight: 700;
    text-decoration: none;
    transition: transform 0.3s;
}

.add-more:hover {
    transform: translateX(5px);
}

/* ================= CART ITEM ================= */
.cart-item {
    background: white;
    border-radius: 18px;
    padding: 20px;
    margin-bottom: 22px;
    box-shadow: 0 12px 28px rgba(0,0,0,0.18);
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: transform 0.3s, box-shadow 0.3s;
}

.cart-item:hover {
    transform: translateY(-6px);
    box-shadow: 0 20px 40px rgba(0,0,0,0.3);
}

.item-info {
    flex: 1;
}

.item-name {
    font-size: 19px;
    font-weight: 800;
    margin-bottom: 6px;
}

.item-price {
    color: #2e7d32;
    font-weight: bold;
    margin-bottom: 14px;
}

/* ================= QUANTITY ================= */
.quantity-box {
    display: flex;
    align-items: center;
    gap: 12px;
}

.qty-btn {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    border: none;
    background: linear-gradient(135deg, #ff6a00, #ff2f00);
    color: white;
    font-size: 20px;
    cursor: pointer;
    font-weight: bold;
    transition: all 0.25s ease;
    box-shadow: 0 6px 14px rgba(255,47,0,0.35);
}

.qty-btn:hover {
    transform: scale(1.15);
}

.qty-btn:active {
    transform: scale(0.9);
}

.qty {
    font-size: 16px;
    font-weight: bold;
    min-width: 20px;
    text-align: center;
}

/* REMOVE */
.remove-btn {
    background: none;
    border: none;
    color: #ff2f00;
    font-weight: bold;
    cursor: pointer;
    transition: transform 0.2s;
}

.remove-btn:hover {
    transform: scale(1.1);
}

/* ================= SUMMARY ================= */
.summary {
    background: white;
    border-radius: 18px;
    padding: 25px;
    box-shadow: 0 16px 35px rgba(0,0,0,0.25);
    margin-top: 40px;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 12px;
    font-size: 16px;
}

.summary-total {
    font-size: 20px;
    font-weight: bold;
}

.checkout-btn {
    width: 100%;
    margin-top: 20px;
    padding: 15px;
    border-radius: 30px;
    border: none;
    font-size: 17px;
    font-weight: 800;
    cursor: pointer;
    background: linear-gradient(135deg, #ff6a00, #ff2f00);
    color: white;
    transition: transform 0.3s, box-shadow 0.3s;
    box-shadow: 0 10px 25px rgba(255,47,0,0.45);
}

.checkout-btn:hover {
    transform: translateY(-4px);
    box-shadow: 0 18px 40px rgba(255,47,0,0.6);
}

/* ================= EMPTY CART ================= */
.empty-cart {
    background: white;
    border-radius: 22px;
    padding: 70px 30px;
    box-shadow: 0 18px 40px rgba(0,0,0,0.25);
    text-align: center;
}

.empty-cart h2 {
    font-size: 28px;
    margin-bottom: 10px;
}

.empty-cart p {
    color: #666;
    margin-bottom: 28px;
}

.browse-btn {
    display: inline-block;
    padding: 14px 32px;
    border-radius: 30px;
    text-decoration: none;
    font-weight: bold;
    color: white;
    background: linear-gradient(135deg, #ff6a00, #ff2f00);
    transition: transform 0.3s;
}

.browse-btn:hover {
    transform: scale(1.1);
}

/* ANIMATION */
@keyframes fadeUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">NammAFoodS</div>
</div>

<div class="cart-container">

<h2>Your Cart</h2>

<%
Cart cart = (Cart) session.getAttribute("cart");
Integer restaurantId = (Integer) session.getAttribute("oldRestarantId");

if (cart != null && !cart.getItems().isEmpty()) {
%>

<a href="menu?restaurantId=<%= restaurantId %>" class="add-more">+ Add more items</a>

<%
for (CartItem item : cart.getItems().values()) {
%>

<div class="cart-item">
    <div class="item-info">
        <div class="item-name"><%= item.getItemName() %></div>
        <div class="item-price">₹<%= item.getPrice() %></div>

        <div class="quantity-box">
            <form action="Cart" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                <button type="submit" class="qty-btn">−</button>
            </form>

            <span class="qty"><%= item.getQuantity() %></span>

            <form action="Cart" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                <button class="qty-btn">+</button>
            </form>
        </div>
    </div>

    <form action="Cart" method="post">
        <input type="hidden" name="action" value="remove">
        <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
        <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
        <button class="remove-btn">Remove</button>
    </form>
</div>

<% } %>

<div class="summary">
    <div class="summary-row">
        <span>Subtotal</span>
        <span>₹<%= cart.getTotalPrice() %></span>
    </div>
    <div class="summary-row summary-total">
        <span>Total</span>
        <span>₹<%= cart.getTotalPrice() %></span>
    </div>

    <form action="checkout.jsp" method="post">
        <button class="checkout-btn">Proceed to Checkout</button>
    </form>
</div>

<%
} else {
%>

<div class="empty-cart">
    <h2>Your cart is empty 😔</h2>
    <p>Add delicious food from nearby restaurants</p>
    <a href="Restaurant" class="browse-btn">Browse Restaurants</a>
</div>

<% } %>

</div>
</body>
</html>
