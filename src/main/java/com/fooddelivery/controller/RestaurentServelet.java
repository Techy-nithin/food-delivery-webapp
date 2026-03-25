package com.fooddelivery.controller;

import java.io.IOException;
import java.util.List;

import com.fooddelivery.daoimpl.RestaurantDAOImpl;
import com.fooddelivery.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Restaurant")
public class RestaurentServelet extends HttpServlet{
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
        List<Restaurant> allRestaurants = restaurantDAOImpl.getAllRestaurants();
        for( Restaurant rest:allRestaurants) {
            System.out.println(rest);
        }
        
        req.setAttribute("allRestaurants", allRestaurants);
        
        RequestDispatcher rd = req.getRequestDispatcher("Restarant.jsp");
        rd.forward(req, resp);
        
        
        
    }

}
