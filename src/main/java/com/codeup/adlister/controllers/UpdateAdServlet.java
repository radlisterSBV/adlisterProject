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

@WebServlet(name="UpdateAdServlet", urlPatterns="/update")
public class UpdateAdServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Ad ad = (Ad) request.getAttribute("ad");
        request.setAttribute("ad",ad);
        request.getRequestDispatcher("/WEB-INF/ads/updateAd.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        request.setAttribute("ad", DaoFactory.getAdsDao().findAdById(Long.parseLong(request.getParameter("ad_id"))));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        long id = Long.parseLong(request.getParameter("ad_id"));

        Ad ad = new Ad(id, request.getParameter("title"), request.getParameter("descrption"),request.getParameter("urL"));


        DaoFactory.getAdsDao().updateAdById(ad);

        request.getRequestDispatcher("/ad?ad_id=" + id).forward(request, response);
    }
}
