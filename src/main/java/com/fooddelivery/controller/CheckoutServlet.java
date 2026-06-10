package com.fooddelivery.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fooddelivery.daoimpl.OrderDAOImpl;
import com.fooddelivery.daoimpl.OrderItemDAOImpl;
import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.Order;
import com.fooddelivery.model.OrderItem;
import com.fooddelivery.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrder")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // 1️⃣ Get logged-in user
        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // 2️⃣ Get cart & restaurant
        Cart cart = (Cart) session.getAttribute("cart");
        Integer restaurantId = (Integer) session.getAttribute("oldRestarantId");

        if (cart == null || cart.getItems().isEmpty() || restaurantId == null) {
            resp.sendRedirect("Restaurant");
            return;
        }

        // 3️⃣ Get checkout form data
        String deliveryAddress = req.getParameter("deliveryAddress");
        String paymentMethod = req.getParameter("paymentMethod");

        if (deliveryAddress == null || deliveryAddress.trim().isEmpty()) {
            resp.sendRedirect("checkout.jsp?error=address_required");
            return;
        }

        if (paymentMethod == null || paymentMethod.isEmpty()) {
            paymentMethod = "COD";
        }

        // 4️⃣ Create Order
        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setDeliveryAddress(deliveryAddress);
        order.setPaymentMethod(paymentMethod);
        order.setOrderStatus("PLACED");
        order.setTotalAmount(cart.getTotalPrice());

        // 5️⃣ Insert Order
        OrderDAOImpl orderDAO = new OrderDAOImpl();
        int orderId = orderDAO.createOrder(order);

        if (orderId <= 0) {
            resp.sendRedirect("checkout.jsp?error=order_failed");
            return;
        }

        // Save orderId for success page
        session.setAttribute("orderId", orderId);

        // 6️⃣ Insert Order Items
        OrderItemDAOImpl orderItemDAO = new OrderItemDAOImpl();
        List<OrderItem> orderItems = new ArrayList<>();

        for (CartItem item : cart.getItems().values()) {
            OrderItem oi = new OrderItem();
            oi.setMenuId(item.getMenuId());
            oi.setItemName(item.getItemName());
            oi.setPrice(item.getPrice());
            oi.setQuantity(item.getQuantity());
            orderItems.add(oi);
        }

        boolean itemsInserted = orderItemDAO.addOrderItems(orderId, orderItems);
        if (!itemsInserted) {
            resp.sendRedirect("checkout.jsp?error=items_failed");
            return;
        }

        // 7️⃣ Clear cart
        cart.clear();
        session.removeAttribute("cart");

        // 8️⃣ Redirect to success page
        resp.sendRedirect("order_success.jsp");
    }
}
