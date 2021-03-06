package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import javax.servlet.http.Part;
import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    //show one of the ads
    Ad findAdById(Long id);
    void deleteAd(Long id);
    void updateAdById(Ad ad) throws SQLException;
    Ad findAdByUserId(Long id);
}
