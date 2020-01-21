package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name="UpdateAdServlet", urlPatterns="/update")
public class UpdateAdServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getRequestDispatcher("/WEB-INF/ads/updateAd.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        this successfully handles post request from single ad page
        Ad ad = (Ad) request.getSession().getAttribute("ad");
        Ad newAd = new Ad(Long.parseLong(request.getParameter("ad_id")), request.getParameter("title"),request.getParameter("url"), request.getParameter("description"));
        try {
            DaoFactory.getAdsDao().updateAdById(newAd);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/ads/updateAd.jsp").forward(request, response);

    }
}
