CREATE TABLE USER_TYPE (TYPE_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, TYPE_NAME VARCHAR(50) NOT NULL, DESCRIPTION VARCHAR(300) DEFAULT NULL , PRIMARY KEY (TYPE_ID));

CREATE TABLE USERS (USER_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, TYPE_ID INTEGER NOT NULL references USER_TYPE(TYPE_ID), FULLNAME VARCHAR(50) NOT NULL, AGE INTEGER, GENDER VARCHAR(50), ADDRESS VARCHAR(50), EMAIL VARCHAR(50) NOT NULL, CONTACT_NUMBER VARCHAR(50) NOT NULL, USERNAME VARCHAR(50) NOT NULL, PASSWORD VARCHAR(50) NOT NULL, PROFILE_PIC BLOB, PRIMARY KEY (USER_ID));

CREATE TABLE CART_ITEM (CART_ITEMID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, PRODUCTID INTEGER NOT NULL, QUANTITY INTEGER NOT NULL, PRIMARY KEY (CART_ITEMID));

CREATE TABLE CART (CART_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, CART_ITEMID INTEGER references CART_ITEM(CART_ITEMID), USER_ID INTEGER references USERS(USER_ID), PRIMARY KEY (CART_ID));

CREATE TABLE CATEGORY (CATEGORY_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, CAT_NAME VARCHAR(50) NOT NULL, DESCRIPTION VARCHAR(300) DEFAULT NULL , PRIMARY KEY (CATEGORY_ID));

CREATE TABLE DELIVERY (DELIVERY_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, USER_ID INTEGER NOT NULL references USERS(USER_ID), DELIVERY_DATE DATE NOT NULL, PRIMARY KEY (DELIVERY_ID));

CREATE TABLE FEEDBACKLOG (LOG_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, RATING VARCHAR(50) NOT NULL, COMMENT VARCHAR(300) NOT NULL, "TIME" TIMESTAMP DEFAULT CURRENT_TIMESTAMP , USER_ID INTEGER NOT NULL references USERS(USER_ID), PRIMARY KEY (LOG_ID));

CREATE TABLE IMAGE_TABLE (IMAGE_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, IMAGE BLOB, PRODUCT_ID INTEGER references USERS(USER_ID), PRIMARY KEY (IMAGE_ID));

CREATE TABLE ORDER_ITEM (ORDER_ITEMID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, PRODUCTID INTEGER NOT NULL references PRODUCTS(PRODUCT_ID), QUANTITY INTEGER NOT NULL, PRICE DOUBLE NOT NULL, ORDER_ID INTEGER, PRIMARY KEY (ORDER_ITEMID));

CREATE TABLE ORDER_STATUS (STATUS_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, STATUS_TYPE VARCHAR(20) NOT NULL, DESCRIPTION VARCHAR(300) DEFAULT NULL , PRIMARY KEY (STATUS_ID));

CREATE TABLE ORDERS (ORDER_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, USER_ID INTEGER NOT NULL references USERS(USER_ID), STATUS INTEGER NOT NULL references ORDER_STATUS(STATUS_ID), PRIMARY KEY (ORDER_ID));

CREATE TABLE PAYMENT_METHOD (PAYMENT_METHODID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, METHOD_NAME VARCHAR(20), PRIMARY KEY (PAYMENT_METHODID));

CREATE TABLE PAYMENT (PAYMENT_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, PAYMENT_DATE DATE NOT NULL, ORDER_ID INTEGER references ORDERS(ORDER_ID), PAYMENTMETHOD INTEGER references PAYMENT_METHOD(PAYMENT_METHODID), PRIMARY KEY (PAYMENT_ID));

CREATE TABLE PRODUCTS (PRODUCT_ID INTEGER DEFAULT AUTOINCREMENT: start 1 increment 1  NOT NULL GENERATED ALWAYS AS IDENTITY, CATEGORY_ID INTEGER NOT NULL references CATEGORY(CATEGORY_ID), PRODUCT_NAME VARCHAR(50) NOT NULL, PRICE DOUBLE NOT NULL, STOCK_COUNT INTEGER NOT NULL, DESCRIPTION VARCHAR(300) DEFAULT NULL , IMAGE BLOB, PRIMARY KEY (PRODUCT_ID));


insert into USER_TYPE (type_name,description) values ('Manager','Can edit all permission for staff,product and customer');
insert into USER_TYPE (type_name,description) values ('Staff','Help manage customer and product detail');
insert into USER_TYPE (type_name,description) values ('Customer','Account to view website and buy product');

insert into CATEGORY (cat_name,description) values ('Furniture','Furnish your space with style and comfort. Our collection of furniture offers timeless designs, premium materials, and exceptional craftsmanship. From cozy sofas to elegant dining sets, each piece is carefully curated to elevate your home aesthetic while providing functionality and durability.');
insert into CATEGORY (cat_name,description) values ('Kitchen','Upgrade your kitchen with our premium selection of appliances, cookware, and accessories. From sleek stainless steel appliances to artisanal cookware, we offer everything you need to create culinary masterpieces with ease.');
insert into CATEGORY (cat_name,description) values ('Bathroom','Transform your bathroom into a luxurious retreat with our exquisite collection of products. From elegant fixtures and modern vanities to plush towels and spa-worthy accessories, we offer everything you need to create a serene oasis in your home.');
insert into CATEGORY (cat_name,description) values ('Bed','Discover the epitome of comfort and style with our curated selection of beds. Crafted with the finest materials and impeccable craftsmanship, our beds offer the perfect blend of luxury and functionality');

-- admin info username = hanjie password = 321
INSERT INTO USERS (TYPE_ID, FULLNAME, AGE, GENDER, ADDRESS, EMAIL, CONTACT_NUMBER, USERNAME, PASSWORD, PROFILE_PIC) 
	VALUES (3, 'hanjie', 99, 'male', '2a 2a', 'handashjie@mail.com', '123456789', 'hanjie', 'jSPPbIboNKeqbt7VTCbOK7LnSQNTjGG91dIZeZerL3I=', NULL);
INSERT INTO USERS (TYPE_ID, FULLNAME, AGE, GENDER, ADDRESS, EMAIL, CONTACT_NUMBER, USERNAME, PASSWORD, PROFILE_PIC) 
	VALUES (1, 'admin', 99, 'male', '2a 2a', 'handashjie@mail.com', '123456789', 'admin', 'jSPPbIboNKeqbt7VTCbOK7LnSQNTjGG91dIZeZerL3I=', NULL);

insert into ORDER_STATUS (STATUS_TYPE,DESCRIPTION) values ('Pending','Processing for order and waiting for packaging.');
insert into ORDER_STATUS (STATUS_TYPE,DESCRIPTION) values ('Shipping','The order processsed and prepared for shipping.');
insert into ORDER_STATUS (STATUS_TYPE,DESCRIPTION) values ('Delivery','The order is currently in transit and on its way to the customer specified delivery address.');

