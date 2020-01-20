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

//        String ad = request.getParameter("ad_id");
        request.setAttribute("ad", DaoFactory.getAdsDao().findAdById(Long.parseLong(request.getParameter("ad_id"))));
//        request.setAttribute("ad_id", ad_id);

        request.getRequestDispatcher("/WEB-INF/ads/single_ad.jsp").forward(request, response);


    }




//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws IOException, ServletException {
//
//
//        String ad_id = request.getParameter("ad_id");
////        request.setAttribute("ad_id", ad_id);
//        request.setAttribute("ad", DaoFactory.getAdsDao().findById(Long.parseLong(request.getParameter("ad_id"))));
//
//
//        //null checking
//        if (ad_id != null){
//
//            response.sendRedirect("/ad");
//        } else {
//            request.getRequestDispatcher("/WEB-INF/single_ad.jsp").forward(request, response);
//
//        }
//
//    }


}
