USE radlister_db;

DROP TABLE IF EXISTS ad_cat;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password LONGBLOB NOT NULL,
    avatar_img_url VARCHAR(2045),
    PRIMARY KEY (id)
);
drop table ad_cat;
drop table users;
drop table ads;

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    img_url VARCHAR(2045),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);


CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE ad_cat (
    ad_id INT UNSIGNED NOT NULL,
    cat_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (cat_id) REFERENCES categories(id)
);

