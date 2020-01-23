package com.codeup.adlister.models;

import com.codeup.adlister.util.Password;

public class User {
    private long id;
    private String username;
    private String email;
    private String password;
    private String avatar_image_url;

    public User() {}

    public User(String username, String email, String password, String avatar_image_url) {
        this.username = username;
        this.email = email;
        setPassword(password);
        this.avatar_image_url = avatar_image_url;

    }

    public User(long id, String username, String email, String password) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;



    }

    public User(long id, String username, String email, String password, String avatar_image_url) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.avatar_image_url = avatar_image_url;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = Password.hash(password);
    }

    public String getUrl() { return avatar_image_url; }

    public void setUrl(String avatar_image_url) { this.avatar_image_url = avatar_image_url; }
}
