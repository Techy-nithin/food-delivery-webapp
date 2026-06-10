package com.fooddelivery.controller;

import java.io.IOException;
import java.util.List;

import com.fooddelivery.daoimpl.MenuDAOImpl;
import com.fooddelivery.model.MenuItem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    
    
   @Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
       
       int restaurantid = Integer.parseInt(req.getParameter("restaurantId"));
       MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
       
       List<MenuItem> menuByRestaurantId = menuDAOImpl.getMenuByRestaurantId(restaurantid);
       for(MenuItem menu:menuByRestaurantId) {
           System.out.println(menu);
           
       }
       
       req.setAttribute("menuByRestaurantId", menuByRestaurantId);
       RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
       rd.forward(req, resp);
   }
}
