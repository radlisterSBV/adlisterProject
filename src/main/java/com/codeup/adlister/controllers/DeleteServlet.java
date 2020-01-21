package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="DeleteServlet", urlPatterns="/delete")
public class DeleteServlet extends HttpServlet {
    //handles post action from single ad servlet delete button
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        long id = Long.parseLong(request.getParameter("ad_id"));
        DaoFactory.getAdsDao().deleteAd(id);
        response.sendRedirect("/ads");
    }
}
