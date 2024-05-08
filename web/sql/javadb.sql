CREATE TABLE USER_TYPE (
    TYPE_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1), 
    TYPE_NAME VARCHAR(50) NOT NULL,
    DESCRIPTION VARCHAR(300) DEFAULT NULL
);

CREATE TABLE USERS (
    USER_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1), 
    TYPE_ID INTEGER NOT NULL references USER_TYPE(TYPE_ID),
    FULLNAME VARCHAR(50) NOT NULL, 
    AGE INTEGER, 
    GENDER VARCHAR(50), 
    ADDRESS VARCHAR(50),
    EMAIL VARCHAR(50) NOT NULL,
    CONTACT_NUMBER VARCHAR(50) NOT NULL, 
    USERNAME VARCHAR(50) NOT NULL,
    PASSWORD VARCHAR(50) NOT NULL, 
    PROFILE_PIC BLOB
);

CREATE TABLE CART (
    CART_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    USER_ID INTEGER references USERS(USER_ID)
);

CREATE TABLE CATEGORY (
    CATEGORY_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1), 
    CAT_NAME VARCHAR(50) NOT NULL, 
    DESCRIPTION VARCHAR(300) DEFAULT NULL
);

CREATE TABLE PRODUCTS (
    PRODUCT_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1), 
    CATEGORY_ID INTEGER NOT NULL references CATEGORY(CATEGORY_ID), 
    PRODUCT_NAME VARCHAR(50) NOT NULL, 
    PRICE DOUBLE NOT NULL, 
    STOCK_COUNT INTEGER NOT NULL, 
    DESCRIPTION VARCHAR(300) DEFAULT NULL ,
    IMAGE BLOB
);

CREATE TABLE CART_ITEM (
    CART_ITEMID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    PRODUCTID INTEGER NOT NULL references PRODUCTS(PRODUCT_ID), 
    QUANTITY INTEGER NOT NULL,
    CART_ID INT REFERENCES CART(CART_ID)
);

CREATE TABLE DELIVERY (
    DELIVERY_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1), 
    USER_ID INTEGER NOT NULL references USERS(USER_ID), 
    DELIVERY_DATE DATE NOT NULL
);

CREATE TABLE FEEDBACKLOG (
    LOG_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1), 
    RATING VARCHAR(50) NOT NULL,
    COMMENT VARCHAR(300) NOT NULL, 
    "TIME" TIMESTAMP DEFAULT CURRENT_TIMESTAMP , 
    USER_ID INTEGER NOT NULL references USERS(USER_ID)
);

CREATE TABLE IMAGE_TABLE (
    IMAGE_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    IMAGE BLOB, 
    PRODUCT_ID INTEGER references PRODUCTS(PRODUCT_ID)
);

CREATE TABLE ORDER_STATUS (
    STATUS_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    STATUS_TYPE VARCHAR(20) NOT NULL,
    DESCRIPTION VARCHAR(300) DEFAULT NULL
);

CREATE TABLE ORDERS (
    ORDER_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1), 
    ADDRESS VARCHAR(200),
    USER_ID INTEGER NOT NULL references USERS(USER_ID), 
    STATUS INTEGER NOT NULL references ORDER_STATUS(STATUS_ID)
);

CREATE TABLE ORDER_ITEM (
    ORDER_ITEMID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    PRODUCT_ID INTEGER NOT NULL references PRODUCTS(PRODUCT_ID), 
    QUANTITY INTEGER NOT NULL, 
    PRICE DOUBLE NOT NULL, 
    ORDER_ID INTEGER references ORDERS(ORDER_ID)
);

CREATE TABLE PAYMENT_METHOD (
    PAYMENT_METHODID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    METHOD_NAME VARCHAR(20)
);

CREATE TABLE PAYMENT (
    PAYMENT_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1), 
    PAYMENT_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP , 
    ORDER_ID INTEGER references ORDERS(ORDER_ID), 
    PAYMENTMETHOD INTEGER references PAYMENT_METHOD(PAYMENT_METHODID),
    AMOUNT DOUBLE not null,
    PROMOTION DOUBLE
);

CREATE TABLE REPLY (
    REPLY_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    LOG_ID int REFERENCES FEEDBACKLOG(LOG_ID), 
    USER_ID int REFERENCES USERS(USER_ID), 
    COMMENT VARCHAR(300) NOT NULL, 
    "TIME" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PROMOTION (
    PROMOTION_ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    PROMO_CODE VARCHAR(10) UNIQUE NOT NULL,
    AMOUNT DOUBLE,
    STATUS VARCHAR(20),
    minAmount double,
    USER_ID INT REFERENCES USERS(USER_ID)
);

CREATE TABLE USERGROUP (
    USERNAME VARCHAR(50) NOT NULL primary key,
    USERTYPE VARCHAR(20) NOT NULL
);

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