package com.fooddelivery.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.model.Restaurant;
import com.fooddelivery.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> list = new ArrayList<>();

        String sql = "SELECT * FROM restaurants WHERE is_active = true";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Restaurant r = new Restaurant();
                r.setRestaurantId(rs.getInt("restaurant_id"));
                r.setRestaurantName(rs.getString("restaurant_name"));
                r.setCuisineType(rs.getString("cuisine_type"));
                r.setAddress(rs.getString("address"));
                r.setRating(rs.getDouble("rating"));
                r.setDeliveryTime(rs.getInt("delivery_time"));
                r.setActive(rs.getBoolean("is_active"));
                r.setImageUrl(rs.getString("image_url"));
                
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    @Override
    public boolean addRestaurant(Restaurant r) {

        String sql = "INSERT INTO restaurants " +
                     "(restaurant_name, cuisine_type, address, rating, delivery_time, image_url, is_active) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getRestaurantName());
            ps.setString(2, r.getCuisineType());
            ps.setString(3, r.getAddress());
            ps.setDouble(4, r.getRating());
            ps.setInt(5, r.getDeliveryTime());
            ps.setString(6, r.getImageUrl());
            ps.setBoolean(7, r.isActive());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}
