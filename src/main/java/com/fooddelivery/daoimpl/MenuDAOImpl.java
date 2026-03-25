package com.fooddelivery.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.model.MenuItem;
import com.fooddelivery.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    private static final String GET_MENU_BY_RESTAURANT =
        "SELECT * FROM menu_items WHERE restaurant_id = ? AND is_available = true";

    @Override
    public List<MenuItem> getMenuByRestaurantId(int restaurantId) {

        List<MenuItem> menuList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_MENU_BY_RESTAURANT)) {

            ps.setInt(1, restaurantId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    MenuItem item = new MenuItem();

                    item.setMenuId(rs.getInt("menu_id"));
                    item.setRestaurantId(rs.getInt("restaurant_id"));
                    item.setItemName(rs.getString("item_name"));
                    item.setDescription(rs.getString("description"));
                    item.setPrice(rs.getDouble("price"));
                    item.setImageUrl(rs.getString("image_url"));
                    item.setAvailable(rs.getBoolean("is_available"));

                    menuList.add(item);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }
    
    @Override
    public boolean addMenuItem(MenuItem item) {

        String sql = "INSERT INTO menu_items " +
                     "(restaurant_id, item_name, description, price, image_url, is_available) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, item.getRestaurantId());
            ps.setString(2, item.getItemName());
            ps.setString(3, item.getDescription());
            ps.setDouble(4, item.getPrice());
            ps.setString(5, item.getImageUrl());
            ps.setBoolean(6, item.isAvailable());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    private static final String GET_MENU_BY_ID =
            "SELECT * FROM menu_items WHERE menu_id = ? AND is_available = true";

        @Override
        public MenuItem getMenuById(int menuId) {

            MenuItem item = null;

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(GET_MENU_BY_ID)) {

                ps.setInt(1, menuId);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        item = new MenuItem();
                        item.setMenuId(rs.getInt("menu_id"));
                        item.setRestaurantId(rs.getInt("restaurant_id"));
                        item.setItemName(rs.getString("item_name"));
                        item.setDescription(rs.getString("description"));
                        item.setPrice(rs.getDouble("price"));
                        item.setImageUrl(rs.getString("image_url"));
                        item.setAvailable(rs.getBoolean("is_available"));
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return item;
        }


}
