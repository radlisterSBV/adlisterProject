package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");


    // THIS IS HOW YOU GET THE VALUES FROM THE CHECKBOXES ACCORDING TO INTERNET
        String[] categories = request.getParameterValues("category");
        //SETTING ATTRIBUTE FOR USE IN INDEX.JSP
        request.setAttribute("categories",categories);
        //NOT ADDING CATEGORIES TO AD, JUST GOING TO DISPLAY CATEGORIES IN JSP
        Ad ad = new Ad(
            user.getId(),
            Long.parseLong(request.getParameter("user_id")),
            request.getParameter("title"),
            request.getParameter("description"),
            request.getParameter("url")
        );
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");
    }
}
