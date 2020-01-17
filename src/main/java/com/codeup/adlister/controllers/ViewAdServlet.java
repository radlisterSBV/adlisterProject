package com.codeup.adlister.controllers;


import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name= "controllers.ViewAdServlet", urlPatterns= "/ad")

public class ViewAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ad", DaoFactory.getAdsDao().findById(Long.parseLong(request.getParameter("ad_id"))));

        request.getRequestDispatcher("/WEB-INF/single_ad.jsp").forward(request, response);

    }
}
