package com.fooddelivery.dao;

import java.util.List;
import com.fooddelivery.model.MenuItem;

public interface MenuDAO {
    
    // Add new menu item
    boolean addMenuItem(MenuItem menuItem);

    // Get all menu items for a specific restaurant
    List<MenuItem> getMenuByRestaurantId(int restaurantId);
    
    // Get all menu
    MenuItem getMenuById(int menuId);
}
