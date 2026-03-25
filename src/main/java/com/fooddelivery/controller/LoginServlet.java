package com.fooddelivery.controller;

import java.io.IOException;

import com.fooddelivery.daoimpl.UserDAOImpl;
import com.fooddelivery.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAOImpl userDAO = new UserDAOImpl();
        User user = userDAO.loginUser(email, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            resp.sendRedirect("Restaurant");
        } else {
            resp.sendRedirect("login.jsp?error=invalid");
        }
    }
}
