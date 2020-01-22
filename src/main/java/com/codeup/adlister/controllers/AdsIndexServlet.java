package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("searchResults") != null) {
                request.getRequestDispatcher("/WEB-INF/ads/searchIndex.jsp").forward(request, response);
        }
         else {
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User logged = (User) request.getSession().getAttribute("user");
        if (logged != null) {
            request.setAttribute("loggedInOut", "/WEB-INF/partials/loggedInNavbar.jsp");
        } else {
            request.setAttribute("loggedInOut", "/WEB-INF/partials/navbar.jsp");
        }
        List<Ad> bucket = new ArrayList<>();
        String searchBar = request.getParameter("searchBar");
        List<Ad> adList = DaoFactory.getAdsDao().all();
        if (searchBar != null) {
            for (int i = 0; i < adList.size(); i++) {
                if (adList.get(i).getTitle().contains(searchBar)) {
                    bucket.add(adList.get(i));
                }
            }
            request.setAttribute("searchResults", bucket);
            request.getRequestDispatcher("/WEB-INF/ads/searchIndex.jsp").forward(request,response);
        }
    }
}


