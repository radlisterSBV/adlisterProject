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
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        String avatarImage = request.getParameter("avatar_img_url");

        User user = DaoFactory.getUsersDao().findByUsername(username);
        User userEmail = DaoFactory.getUsersDao().findByEmail(email);


        // validate input
        boolean usernameEmpty = username.isEmpty();
//        boolean usernameExists = userEm.getUsername().equalsIgnoreCase(username);
        boolean emailEmpty = email.isEmpty();
        boolean passwordIssue = password.isEmpty() || (! password.equals(passwordConfirmation));

        if (usernameEmpty) {
            response.sendRedirect("/register?errorUsernameEmpty");
            return;
        }

        if (DaoFactory.getUsersDao().findByUsername(username) != null) {
                if (user.getUsername().equalsIgnoreCase(username)) {
                    response.sendRedirect("/register?errorUsernameExists");
                    return;
                }
        }

        if (emailEmpty) {
            response.sendRedirect("/register?errorEmailEmpty");
            return;
        }

        if (DaoFactory.getUsersDao().findByEmail(email) != null) {
            if (userEmail.getEmail().equalsIgnoreCase(email)) {
                response.sendRedirect("/register?errorEmailExists");
                return;
            }
        }

        if (passwordIssue) {
            response.sendRedirect("/register?errorPasswordIssue");
            return;
        }

        // create and save a new user
        if(request.getParameter("avatar_img_url") == null || request.getParameter("avatar_img_url").isEmpty())
        {
            String defaultAvatar = "https://ramcotubular.com/wp-content/uploads/default-avatar.jpg";
            User newUser = new User (username, email, password, defaultAvatar);
            DaoFactory.getUsersDao().insert(newUser);
            response.sendRedirect("/login");
            return;
        } else {
            User newUser = new User(username, email, password, avatarImage);
            DaoFactory.getUsersDao().insert(newUser);
            response.sendRedirect("/login");

        }

    }
}
