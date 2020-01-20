//              ****************************************************************
//                  i've tried fiddling with categories to avoid making a table,
//                  but everything i've found online says i have to make a cat table.
//                  we do this because you can't store an array of things
//                  as a single entry in an array. (according to the internet)
//              ****************************************************************




package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import java.util.List;

public interface Categories {
    // get a list of all the ads
    List<Category> all();
    // insert a new ad and return the new ad's id
    Long insert(Category category);
    //show one of the ads
    Category findByCategory(String category);
}
