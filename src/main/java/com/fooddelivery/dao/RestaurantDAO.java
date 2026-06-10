package com.fooddelivery.dao;

import java.util.List;
import com.fooddelivery.model.Restaurant;

public interface RestaurantDAO {

    // add new restaurant
    boolean addRestaurant(Restaurant restaurant);

    // get all active restaurants
    List<Restaurant> getAllRestaurants();

//    // get restaurant by id
//    Restaurant getRestaurantById(int restaurantId);
//
//    // update restaurant details
//    boolean updateRestaurant(Restaurant restaurant);
//
//    // activate / deactivate restaurant
//    boolean updateRestaurantStatus(int restaurantId, boolean isActive);
}
