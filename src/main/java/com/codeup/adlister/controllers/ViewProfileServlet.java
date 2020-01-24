package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionEvent;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.codeup.adlister.dao.DaoFactory.getAdsDao;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") != null){
            User user = (User) request.getSession().getAttribute("user");
            request.setAttribute("newAd", DaoFactory.getAdsDao().findAdByUserId(user.getId()));
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        }
        else {
            response.sendRedirect("/login");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Ad newAd = new Ad(Long.parseLong(request.getParameter("ad_id")), request.getParameter("title"), request.getParameter("url"), request.getParameter("description"));
        request.getSession().setAttribute("newAd", newAd);
        try {
            getAdsDao().updateAdById(newAd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/ads/updateAd.jsp").forward(request,response);
    }


}
