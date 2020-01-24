package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
//@MultipartConfig(fileSizeThreshold =  1024 * 1024 * 2,
//maxFileSize = 1024 * 1024 * 10,
//maxRequestSize = 1024 * 1024 * 50)
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            request.setAttribute("loggedInOut", "/WEB-INF/partials/loggedInNavbar.jsp");
            request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
        } else {
            request.setAttribute("loggedInOut", "/WEB-INF/partials/navbar.jsp");
            response.sendRedirect("/login");
        }
    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        User user = (User) request.getSession().getAttribute("user");
//        Ad newAd = (Ad) request.getSession().getAttribute("newAd");

        if(request.getParameter("url") == null || request.getParameter("url").isEmpty())
        {
            String defaultUrl = "http://localhost:8080/img/logo.png";
            Ad ad = new Ad(
                    user.getId(),
                    request.getParameter("title"),
                    request.getParameter("description"),
                    defaultUrl
            );
            DaoFactory.getAdsDao().insert(ad);
            response.sendRedirect("/profile");

            return;
        } else {
            Ad ad = new Ad(
                    user.getId(),
                    request.getParameter("title"),
                    request.getParameter("description"),
                    request.getParameter("url")
            );
            DaoFactory.getAdsDao().insert(ad);
            response.sendRedirect("/profile");


        }




//        request.getSession().removeAttribute("newAd");
    }


}
