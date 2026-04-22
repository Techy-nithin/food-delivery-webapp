package com.fooddelivery.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import com.fooddelivery.dao.OrderDAO;
import com.fooddelivery.model.Order;
import com.fooddelivery.model.OrderItem;
import com.fooddelivery.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public int createOrder(Order order) {

        int orderId = 0;

         String sql = """
                INSERT INTO orders
                (user_id, restaurant_id, delivery_address, payment_method, order_status, total_amount)
                VALUES (?, ?, ?, ?, ?, ?)
                """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

             ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setString(3, order.getDeliveryAddress());
            ps.setString(4, order.getPaymentMethod());
            ps.setString(5, order.getOrderStatus());
            ps.setDouble(6, order.getTotalAmount());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }


    @Override
    public boolean addOrderItems(int orderId, List<OrderItem> items) {

        String sql = "INSERT INTO order_items (order_id, menu_id, item_name, price, quantity) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            for (OrderItem item : items) {
                ps.setInt(1, orderId);
                ps.setInt(2, item.getMenuId());
                ps.setString(3, item.getItemName());
                ps.setDouble(4, item.getPrice());
                ps.setInt(5, item.getQuantity());
                ps.addBatch();
            }

            ps.executeBatch();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
