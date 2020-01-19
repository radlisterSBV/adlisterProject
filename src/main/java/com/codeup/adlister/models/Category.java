//              ****************************************************************
//                  i'm thinking we don't need category table, like andrew said
//                  we just display categories checkboxes,
//                  and add whichever is checked to array list
//                  then just add that arraylist as an object to the ad object.
//              ****************************************************************



package com.codeup.adlister.models;

public class Category {
    private long id;
    private String category;

    public Category(long id, String category) {
        this.id = id;
        this.category = category;
    }

    public Category(String category) {
        this.category = category;
    }

    public Category() {
    }

    public Category(String[] categories) {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}
