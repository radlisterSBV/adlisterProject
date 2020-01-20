package com.codeup.adlister.controllers;

import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "controllers.HelloWorldServlet", urlPatterns = "/home")
public class HelloWorldServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getSession().getAttribute("user") != null) {
            request.setAttribute("loggedInOut", "/WEB-INF/partials/loggedInNavbar.jsp");
        } else {
            request.setAttribute("loggedInOut", "/WEB-INF/partials/navbar.jsp");
        }
        request.getRequestDispatcher("/WEB-INFindex.jsp").forward(request, response);
    }
}
