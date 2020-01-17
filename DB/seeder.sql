USE radlister_db;

INSERT INTO users(username, email, password)
VALUES ('jacob', 'sdf@sdsdf.com', 'password1'),
    ('chris', 'wer@sdfwer.com', 'password2'),
    ('alyssa', 'kdfk@weri.com', 'password3'),
       ('christian', 'iieke@sdfi.com','password4');;

INSERT INTO ads(user_id, title, description, img_url)
VALUES (1,'mow lawn', 'this is an ad','url'),
       (3,'housekeeping', 'boop', 'url'),
       (1,'new truck', 'hey', 'url'),
       (2,'laptop for sale','yes', 'url'),
       (4,'shirts','no', 'url');

INSERT INTO categories(category)
    VALUES ('services'),
           ('vehicles'),
           ('clothing'),
           ('tech'),
           ('appliances'),
           ('furniture');

INSERT INTO ad_cat(ad_id, cat_id)
    VALUES(1,1),
           (2,1),
           (3,2),
           (4,4),
           (5,3);