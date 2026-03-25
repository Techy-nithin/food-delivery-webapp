<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.fooddelivery.model.Cart" %>
<%@ page import="com.fooddelivery.model.CartItem" %>

<%
    Cart cart = (Cart) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
<title>NammAFoodS | Checkout </title>

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
    color: white;
    padding: 18px 50px;
    font-size: 26px;
    font-weight: 800;
    box-shadow: 0 6px 18px rgba(0,0,0,0.3);
    position: sticky;
    top: 0;
    z-index: 1000;
}

/* ================= CHECKOUT CONTAINER ================= */
.checkout-container {
    width: 650px;
    margin: 60px auto;
    background: white;
    padding: 35px;
    border-radius: 18px;
    box-shadow: 0 20px 45px rgba(0,0,0,0.25);
    animation: fadeUp 0.8s ease;
}

h2 {
    margin-bottom: 25px;
    color: #222;
    font-size: 24px;
}

/* ================= ORDER SUMMARY ================= */
.item-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 14px;
    font-size: 15px;
    padding-bottom: 8px;
    border-bottom: 1px dashed #eee;
}

.item-name {
    font-weight: 600;
}

.total-row {
    margin-top: 25px;
    font-size: 20px;
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    color: #222;
}

/* ================= FORM ================= */
label {
    font-weight: 700;
    display: block;
    margin-top: 22px;
    margin-bottom: 6px;
}

textarea, select {
    width: 100%;
    padding: 12px;
    border-radius: 10px;
    border: 1px solid #ccc;
    font-size: 15px;
    transition: border 0.3s, box-shadow 0.3s;
}

textarea:focus, select:focus {
    border-color: #ff4d2d;
    outline: none;
    box-shadow: 0 0 10px rgba(255,77,45,0.3);
}

textarea {
    height: 90px;
    resize: none;
}

/* ================= BUTTON ================= */
.place-order-btn {
    width: 100%;
    margin-top: 35px;
    padding: 16px;
    border-radius: 35px;
    border: none;
    font-size: 18px;
    font-weight: 800;
    cursor: pointer;
    background: linear-gradient(135deg, #ff6a00, #ff2f00);
    color: white;
    transition: transform 0.3s, box-shadow 0.3s;
    box-shadow: 0 10px 25px rgba(255,47,0,0.45);
}

.place-order-btn:hover {
    transform: translateY(-4px);
    box-shadow: 0 18px 40px rgba(255,47,0,0.6);
}

/* ================= ANIMATION ================= */
@keyframes fadeUp {
    from { opacity: 0; transform: translateY(25px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    NammAFoodS
</div>

<div class="checkout-container">

    <h2>Order Summary</h2>

    <% for (CartItem item : cart.getItems().values()) { %>
        <div class="item-row">
            <div class="item-name">
                <%= item.getItemName() %> × <%= item.getQuantity() %>
            </div>
            <div>
                ₹<%= item.getPrice() * item.getQuantity() %>
            </div>
        </div>
    <% } %>

    <div class="total-row">
        <span>Total</span>
        <span>₹<%= cart.getTotalPrice() %></span>
    </div>

    <!-- CHECKOUT FORM -->
    <form action="<%=request.getContextPath()%>/PlaceOrder" method="post">

        <label>Delivery Address</label>
        <textarea name="deliveryAddress"
                  required
                  placeholder="House no, Street, Area, City"></textarea>

        <label>Payment Method</label>
        <select name="paymentMethod" required>
            <option value="COD">Cash on Delivery</option>
            <option value="UPI">UPI</option>
            <option value="CARD">Card</option>
        </select>

        <button type="submit" class="place-order-btn">
            Place Order 🚀
        </button>

    </form>

</div>

</body>
</html>
