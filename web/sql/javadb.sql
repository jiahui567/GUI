CREATE TABLE "USER_TYPE" (
  type_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  type_name varchar(50) NOT NULL,
  description varchar(300) DEFAULT NULL
);

CREATE TABLE "ORDER_STATUS" (
  status_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  status_type varchar(20) NOT NULL,
  description varchar(300) DEFAULT NULL
);
    
CREATE TABLE "USERS" (
  user_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  type_ID int NOT NULL references "USER_TYPE"(type_ID),
  fullname varchar(50) NOT NULL,
  age int ,
  gender varchar(50) ,
  address varchar(50) ,
  email varchar(50) NOT NULL,
  contact_number varchar(50) NOT NULL,
  username varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  profile_pic blob 
);

CREATE TABLE "TRANSACTIONS" (
  transaction_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  transaction_type varchar(50) NOT NULL,
  description varchar(300) DEFAULT NULL,
  user_ID int NOT NULL references "USERS"(user_ID),
  trans_date date NOT NULL
);

CREATE TABLE "CATEGORY" (
  category_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  cat_name varchar(50) NOT NULL,
  description varchar(300) DEFAULT NULL
);

CREATE TABLE "PRODUCTS" (
  product_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  category_ID int NOT NULL  references "CATEGORY"(category_ID),
  product_name varchar(50) NOT NULL,
  price double NOT NULL,
  stock_count int NOT NULL,
  description varchar(300) DEFAULT NULL,
  image blob
);

CREATE TABLE "DELIVERY" (
  delivery_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  user_ID int NOT NULL references "USERS"(user_ID),
  delivery_date date NOT NULL
);

CREATE TABLE "CART" (
  cart_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  user_ID int NOT NULL references "USERS"(user_ID),
  product_ID int NOT NULL references "PRODUCTS"(product_ID),
  cart_count int NOT NULL
);

CREATE TABLE "ORDERS" (
  order_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  user_ID int NOT NULL references "USERS"(user_ID),
  cart_ID int NOT NULL references "CART"(cart_ID),
  item_count int NOT NULL,
  status int NOT NULL references "ORDER_STATUS"(status_ID)
);

CREATE TABLE "PAYMENT" (
  payment_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  product_ID int NOT NULL references "PRODUCTS"(product_ID),
  quantity int NOT NULL,
  amount double NOT NULL,
  payment_date date NOT NULL,
  user_ID int NOT NULL references "USERS"(user_ID)
);

CREATE TABLE "FEEDBACKLOG" (
  log_ID int NOT NULL primary key GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
  rating varchar(50) NOT NULL,
  comment varchar(300) NOT NULL,
  time timestamp DEFAULT CURRENT_TIMESTAMP,
  user_ID int NOT NULL references "USERS"(user_ID)
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

