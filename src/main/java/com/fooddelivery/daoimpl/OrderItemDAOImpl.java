package com.fooddelivery.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fooddelivery.dao.OrderItemDAO;
import com.fooddelivery.model.OrderItem;
import com.fooddelivery.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public boolean addOrderItems(int orderId, List<OrderItem> items) {

        String sql =
            "INSERT INTO order_items (order_id, menu_id, item_name, price, quantity) " +
            "VALUES (?, ?, ?, ?, ?)";

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

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> list = new ArrayList<>();

        String sql = "SELECT * FROM order_items WHERE order_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderItem item = new OrderItem();

                item.setOrderItemId(rs.getInt("order_item_id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setMenuId(rs.getInt("menu_id"));
                item.setItemName(rs.getString("item_name"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));

                list.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
