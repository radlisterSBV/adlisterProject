package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import static com.codeup.adlister.util.Password.hash;

@WebServlet(name="UpdateUserServlet", urlPatterns="/updateUser")
public class UpdateUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/updateUser.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("passwordConfirmation");
        Long id = Long.parseLong(request.getParameter("userId"));

        boolean passwordIssue = password.isEmpty() || (! password.equals(passwordConfirmation));

        if (passwordIssue) {
            response.sendRedirect("/updateUser?errorPasswordIssue");
            return;
        }

        User newUser = new User(
                id, username, email, hash(password)
        );
        try {
            DaoFactory.getUsersDao().updateUser(newUser);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/profile");
    }
}
