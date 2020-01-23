package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name="DeleteUserServlet", urlPatterns="/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    //handles post action from single ad servlet delete button
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        long id = Long.parseLong(request.getParameter("userId"));
        DaoFactory.getUsersDao().deleteUser(id);
        request.getSession().removeAttribute("user");
        response.sendRedirect("/home");
    }
}

