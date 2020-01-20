package com.codeup.adlister.controllers;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.HelloWorldServlet", urlPatterns = "/")
public class HelloWorldServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getSession().getAttribute("user") != null) {
            request.setAttribute("loggedInOut", "/WEB-INF/partials/loggedInNavbar.jsp");
        } else {
            request.setAttribute("loggedInOut", "/WEB-INF/partials/navbar.jsp");
        }
        response.getWriter().println("<h1>Hello, World!</h1>");
    }
}
