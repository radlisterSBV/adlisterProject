package com.codeup.adlister.controllers;


import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name= "controllers.ViewAdServlet", urlPatterns= "/ad")

public class ViewAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            request.setAttribute("loggedInOut", "/WEB-INF/partials/loggedInNavbar.jsp");
            request.setAttribute("ad", DaoFactory.getAdsDao().findAdById(Long.parseLong(request.getParameter("ad_id"))));
            request.getRequestDispatcher("/WEB-INF/ads/single_ad.jsp").forward(request, response);
        } else {
            //user is not allowed to edit ads if they are not logged in--
            //still need to specify that the userId matches the logged in user.
            request.setAttribute("loggedInOut", "/WEB-INF/partials/navbar.jsp");
            request.setAttribute("ad", DaoFactory.getAdsDao().findAdById(Long.parseLong(request.getParameter("ad_id"))));
            request.getRequestDispatcher("/WEB-INF/ads/loggedOutSingleAd.jsp");
        }
    }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            long id = Long.parseLong(request.getParameter("ad_id"));
//            DaoFactory.getAdsDao().deleteAd(id);
            response.sendRedirect("/ads");

        }
    }
