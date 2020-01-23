USE radlister_db;

INSERT INTO users(username, email, password, avatar_img_url)
VALUES ('jacob', 'sdf@sdsdf.com', 'password1', 'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg'),
    ('chris', 'wer@sdfwer.com', 'password2', 'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg'),
    ('alyssa', 'kdfk@weri.com', 'password3', 'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg'),
       ('christian', 'iieke@sdfi.com','password4', 'https://ramcotubular.com/wp-content/uploads/default-avatar.jpg');

INSERT INTO ads(user_id, title, description, img_url)
VALUES (1,'mow lawn', 'this is an ad', 'https://images.unsplash.com/flagged/photo-1573162915835-520ee6d112b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80'),
       (3,'housekeeping', 'boop', 'https://images.unsplash.com/flagged/photo-1573162915835-520ee6d112b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80'),
       (1,'new truck', 'hey', 'https://images.unsplash.com/flagged/photo-1573162915835-520ee6d112b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80'),
       (2,'laptop for sale','yes', 'https://images.unsplash.com/flagged/photo-1573162915835-520ee6d112b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80'),
       (4,'shirts','no', 'https://images.unsplash.com/flagged/photo-1573162915835-520ee6d112b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80');



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