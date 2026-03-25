package com.fooddelivery.controller;

import java.io.IOException;

import com.fooddelivery.daoimpl.UserDAOImpl;
import com.fooddelivery.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/Signup")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = new User();
        user.setName(req.getParameter("name"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        user.setPhone(req.getParameter("phone"));
        user.setAddress(req.getParameter("address"));

        UserDAOImpl userDAO = new UserDAOImpl();
        boolean success = userDAO.registerUser(user);

        if (success) {
            // Auto-login after signup
            User loggedUser = userDAO.loginUser(user.getEmail(), user.getPassword());
            HttpSession session = req.getSession();
            session.setAttribute("user", loggedUser);
            resp.sendRedirect("Restaurant");
        } else {
            resp.sendRedirect("signup.jsp?error=failed");
        }
    }
}
