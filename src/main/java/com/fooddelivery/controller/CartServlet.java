package com.fooddelivery.controller;

import java.io.IOException;

import com.fooddelivery.daoimpl.MenuDAOImpl;
import com.fooddelivery.model.Cart;
import com.fooddelivery.model.CartItem;
import com.fooddelivery.model.MenuItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        Integer oldRestaurantId = (Integer) session.getAttribute("oldRestarantId");

        String action = req.getParameter("action");

        // -------- ADD ITEM --------
        if ("add".equals(action)) {

            int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

            if (cart == null || oldRestaurantId == null || !oldRestaurantId.equals(restaurantId)) {
                cart = new Cart();
                session.setAttribute("cart", cart);
                session.setAttribute("oldRestarantId", restaurantId);
            }

            addItemToCart(req, cart);
        }

        // -------- UPDATE ITEM (+ / -) --------
        else if ("update".equals(action)) {
            if (cart != null) {
                updateItemOfCart(req, cart);
            }
        }

        // -------- REMOVE ITEM --------
        else if ("remove".equals(action)) {
            if (cart != null) {
                removeItemFromCart(req, cart);
            }
        }

        resp.sendRedirect(req.getContextPath() + "/cart.jsp");
    }

    private void removeItemFromCart(HttpServletRequest req, Cart cart) {
        int menuId= Integer.parseInt(req.getParameter("menuId"));
        
        cart.removeItem(menuId);
        
    }

    private void updateItemOfCart(HttpServletRequest req, Cart cart) {
        int menuId=Integer.parseInt(req.getParameter("menuId"));
        int quantity= Integer.parseInt(req.getParameter("quantity"));
        
        cart.updateItem(menuId, quantity);
        
    }

    private void addItemToCart(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity=Integer.parseInt(req.getParameter("quantity"));
        
        MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
        
        MenuItem menu = menuDAOImpl.getMenuById(menuId);
        
        String itemName = menu.getItemName();
        double price = menu.getPrice();
        
        CartItem cartItem = new CartItem(menuId, itemName, price, quantity);
        
        cart.addItem(cartItem);
        
    }



}
