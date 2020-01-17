package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchBar = request.getParameter("searchBar");
        if (searchBar != null) {
            List<Ad> allAds = DaoFactory.getAdsDao().all();
            for (int i =0; i < allAds.size(); i++) {
                if (allAds.get(i).getTitle().equalsIgnoreCase(searchBar) || allAds.get(i).getDescription().equalsIgnoreCase(searchBar)) {
                    request.setAttribute("searchBar", allAds.get(i));
                    request.getRequestDispatcher("/WEB-INF/ads/searchIndex.jsp");
                    break;
                }
            }
        } else {
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp");
        }
    }
}
