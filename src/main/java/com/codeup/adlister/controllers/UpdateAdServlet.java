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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.getRequestDispatcher("/WEB-INF/ads/updateAd.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
////    setting attribute ad based on id passed in updateAd.jsp
        request.setAttribute("ad", DaoFactory.getAdsDao().findAdById(Long.parseLong(request.getParameter("ad_id"))));
        //turning attribute into Ad
        Ad addly = new Ad(
1,"yes", "no", "i guess"
//                request.getParameter("title"),
//                request.getParameter("description"),
//                request.getParameter("url")
        );
        //passing addly into update function
        try {
            DaoFactory.getAdsDao().updateAdById(addly);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        request.getRequestDispatcher("/WEB-INF/ads/updateAd.jsp").forward(request, response);
    }
}
