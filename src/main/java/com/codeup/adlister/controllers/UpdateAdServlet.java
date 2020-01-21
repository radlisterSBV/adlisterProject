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
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String url = request.getParameter("url");
        Long id = Long.parseLong(request.getParameter("ad_id"));
        System.out.println("id = " + id);
        System.out.println(title + description + url);
        Ad newAd = new Ad(
                id, title, description, url
        );
        try {
            DaoFactory.getAdsDao().updateAdById(newAd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/profile");

//        request.getRequestDispatcher("/WEB-INF/ads/updateAd.jsp").forward(request, response);
//        DaoFactory.getAdsDao().deleteAd(Long.parseLong(request.getParameter("ad_id")));
//        DaoFactory.getAdsDao().insert(newAd);
//        response.sendRedirect("/profile");
    }
}
