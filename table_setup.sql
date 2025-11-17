#Create Fiori Flower Shop Database
#CREATE DATABASE FioriDB;
USE FioriDB;

#Customer Table: customer_id, password, address, phone, name, email
CREATE TABLE Customer(
  customer_id VARCHAR(50) PRIMARY KEY, #unique identifier per customer; default unique and not null via primary key
  password VARCHAR(100) NOT NULL,
  address VARCHAR(250),
  phone VARCHAR(15),
  name VARCHAR(100) NOT NULL,
  email VARCHAR(250) NOT NULL UNIQUE #no repeat customer accounts using same email allowed
);

##Shopping_Cart Table:
##customer to shopping cart (1:1) --------------------
CREATE TABLE Shopping_Cart(
  cart_id VARCHAR(50) PRIMARY KEY, #unique identifier per cart; default unique and not null via primary key
  customer_id VARCHAR(50) NOT NULL UNIQUE,
  total_price DECIMAL(10, 2) DEFAULT 0.00, #set to 0 when no items in cart
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) #link between customer and shopping cart (1:1)
);

##Products Table: product_id, description, image, stock, price, name
CREATE TABLE Products(
  product_id VARCHAR(50) PRIMARY KEY, #unique identifier per product; default unique and not null via primary key
  name VARCHAR(150) NOT NULL UNIQUE,
  description TEXT NOT NULL,
  image VARCHAR(250) NOT NULL UNIQUE, #will hold URL
  stock INT DEFAULT 0,
  price DECIMAL(10, 2) NOT NULL
);

#cart-product (M:M) --- represents items in shopping cart
CREATE TABLE Cart_Product(
  cart_id VARCHAR(50) NOT NULL,
  product_id VARCHAR(50) NOT NULL,
  PRIMARY KEY (cart_id, product_id),
  FOREIGN KEY (cart_id) REFERENCES Shopping_Cart(cart_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

##Flower Table: color, price, type, stock
CREATE TABLE Flower(
  flower_id VARCHAR(50) PRIMARY KEY, #unique identifier per flower; default unique and not null via primary key
  type VARCHAR(100),
  color VARCHAR(50) NOT NULL,
  price DECIMAL(10, 2),
  stock INT DEFAULT 0
);

#Product_Flower (M:M -- link product(bouquets to flowers) --------
CREATE TABLE Product_Flower(
  product_id VARCHAR(50) NOT NULL,
  flower_id VARCHAR(50) NOT NULL,
  PRIMARY KEY (product_id, flower_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (flower_id) REFERENCES Flower(flower_id)
);

##Predesigned_Bouquet Table: is_predesigned, image, description
CREATE TABLE Predesigned_Bouquet(
  bouquet_id VARCHAR(50) PRIMARY KEY,
  product_id VARCHAR(50) NOT NULL UNIQUE, #begin to link product to bouquets
  is_predesigned BOOL NOT NULL DEFAULT TRUE,
  image VARCHAR(250) NOT NULL UNIQUE,
  description TEXT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

#Orders Table: total_amount, status, order_date, order_id
#Customer to Order (1:M) -------------------------
CREATE TABLE Orders(
  order_id VARCHAR(50) PRIMARY KEY,
  customer_id VARCHAR(50) NOT NULL,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  status VARCHAR(50) DEFAULT 'pending',
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

#Order_Product (links order to product (M:M)) -----------
CREATE TABLE Order_Product(
  order_id VARCHAR(50) NOT NULL,
  product_id VARCHAR(50) NOT NULL,
  PRIMARY KEY(order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

##Payment Table: status, payment_id, method, amount
#Payment to Orders(1:1) ---------
CREATE TABLE Payment(
  payment_id VARCHAR(50) PRIMARY KEY,
  order_id VARCHAR(50) UNIQUE NOT NULL,
  status VARCHAR(150),
  method VARCHAR(50),
  amount DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);