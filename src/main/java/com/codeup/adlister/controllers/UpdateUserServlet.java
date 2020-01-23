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
        String avatarImage = request.getParameter("avatar_img_url");
        Long id = Long.parseLong(request.getParameter("userId"));

        boolean passwordIssue = password.isEmpty() || (! password.equals(passwordConfirmation));

        if (passwordIssue) {
            response.sendRedirect("/updateUser?errorPasswordIssue");
            return;
        }

        if(request.getParameter("avatar_img_url") == null || request.getParameter("avatar_img_url").isEmpty())
        {
            String defaultAvatar = "https://ramcotubular.com/wp-content/uploads/default-avatar.jpg";

            User newUserNoImg = new User(
                    id, username, email, hash(password), defaultAvatar
            );
            try {
                DaoFactory.getUsersDao().updateUser(newUserNoImg);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.getSession().removeAttribute("user");

            request.getSession().setAttribute("user", newUserNoImg);
            response.sendRedirect("/profile");
            return;
        } else {
            User newUserWImg = new User(
                    id, username, email, hash(password), avatarImage
            );
            try {
                DaoFactory.getUsersDao().updateUser(newUserWImg);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.getSession().removeAttribute("user");

            request.getSession().setAttribute("user", newUserWImg);
            response.sendRedirect("/profile");

        }

    }
}
