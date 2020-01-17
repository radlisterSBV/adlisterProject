package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // validate input
        boolean usernameEmpty = username.isEmpty();
        boolean emailEmpty = email.isEmpty();
        boolean passwordIssue = password.isEmpty() || (! password.equals(passwordConfirmation));
//            || email.isEmpty()
//            || password.isEmpty()
//            || (! password.equals(passwordConfirmation));

        if (usernameEmpty) {
            response.sendRedirect("/register?errorUsernameEmpty");
            return;
        }

        if (emailEmpty) {
            response.sendRedirect("/register?errorEmailEmpty");
            return;
        }

        if (passwordIssue) {
            response.sendRedirect("/register?errorPasswordIssue");
            return;
        }

//        if (inputHasErrors) {
//            response.sendRedirect("/register?error");
//            return;
//        }

        // create and save a new user
        User user = new User(username, email, password);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
