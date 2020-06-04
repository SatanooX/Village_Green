CREATE TABLE Supplier
(
    Supp_ID int auto_increment,
    Supp_name varchar(25) NOT NULL,
    Supp_adresse varchar(50) NOT NULL,
    Supp_city varchar(35) NOT NULL,
    Supp_phone int(20) NOT NULL,
    Supp_mail varchar(35) NOT NULL,
    PRIMARY KEY(Supp_ID)
);

CREATE TABLE Produit
(
    Pro_ID int auto_increment,
    Supp_ID int,
    Pro_name varchar(35),
    Pro_prix varchar(35),
    /*Pro_supp varchar(80),*/
    Pro_desc varchar(35),
    Pro_photo varchar(45),
    Pro_stock varchar(25),
    Pro_stock_alert varchar(35),
    Pro_code_ean varchar(25),
    PRIMARY KEY(Pro_ID),
    CONSTRAINT FK_Produit FOREIGN KEY(Supp_ID) REFERENCES Supplier(Supp_ID)
);

CREATE TABLE Client
(
    Client_ID int auto_increment,
    First_name varchar(30) NOT NULL,
    Last_name varchar(45) NOT NULL,
    Gender varchar(1) NOT NULL,
    Date_birth date NOT NULL,
    Email varchar(50) NOT NULL,
    Phone_number int(30),
    Reference varchar(50),
    PRIMARY KEY(Client_ID)
);

CREATE TABLE Delivery_adresse
(
    ID_Delivery int auto_increment,
    Del_adr_number varchar(30) NOT NULL,
    Del_adr_name VARCHAR(45) NOT NULL,
    Del_adr_city varchar(45) NOT NULL,
    Del_adr_zipcode varchar(10) NOT NULL,
    Del_adr_country varchar(45) NOT NULL,
    Client_ID int NOT NULL,
    PRIMARY KEY(ID_Delivery),
    CONSTRAINT FK_Client_Delivery_adresse FOREIGN KEY(Client_ID) REFERENCES Client(Client_ID)
);

CREATE TABLE Adresse
(
    ID_Adresse int auto_increment,
    adr_number varchar(30) NOT NULL,
    adr_name varchar(45) NOT NULL,
    adr_ville varchar(1) NOT NULL,
    adr_zipcode date NOT NULL,
    adr_country varchar(50) NOT NULL,
    Client_ID int NOT NULL,
    PRIMARY KEY(ID_Adresse),
    CONSTRAINT FK_Client_Adresse FOREIGN KEY(Client_ID) REFERENCES Client(Client_ID)
);

CREATE TABLE Orders
(
    Ord_ID int auto_increment,
    Ord_reference varchar(30) NOT NULL,
    Ord_date varchar(45) NOT NULL,
    Ord_status varchar(1) NOT NULL,
    Client_ID int NOT NULL,
    PRIMARY KEY(Ord_ID),
    CONSTRAINT FK_Client_Orders FOREIGN KEY(Client_ID) REFERENCES Client(Client_ID)
);

CREATE TABLE Order_details
(
    Ode_ID int auto_increment,
    Ode_quantity varchar(30) NOT NULL,
    Ode_color varchar(45) NOT NULL,
    Ode_marque varchar(1) NOT NULL,
    Ord_ID int NOT NULL,
    PRIMARY KEY(Ode_ID),
    CONSTRAINT FK_Order_details FOREIGN KEY(Ord_ID) REFERENCES Orders(Ord_ID)
);

CREATE TABLE Countries
(
    Cou_ID int auto_increment,
    Supp_ID int NOT NULL,
    Cou_name varchar(45) NOT NULL,
    Cou_code varchar(5) NOT NULL,
    Cou_iso_code int NOT NULL,
    PRIMARY KEY(Cou_ID),
    CONSTRAINT FK_Supplier_Country FOREIGN KEY(Supp_ID) REFERENCES Supplier(Supp_ID)
);

CREATE TABLE Catalogue
(
    Cat_ID int auto_increment,
    Cat_name varchar(30) NOT NULL,
    Cat_details varchar(45) NOT NULL,
    Pro_ID int NOT NULL,
    PRIMARY KEY(Cat_ID),
    CONSTRAINT FK_Product_Catalogue FOREIGN KEY(Pro_ID) REFERENCES Produit(Pro_ID)
);

CREATE TABLE Sub_Catalogue
(
    Sub_Cat_ID int auto_increment,
    Sub_type VARCHAR(35) NOT NULL,
    Brand VARCHAR(35) NOT NULL,
    Sub_Cat_name varchar(30) NOT NULL,
    Color varchar(25) NOT NULL,
    Cat_ID int NOT NULL,
    PRIMARY KEY(Sub_Cat_ID),
    CONSTRAINT FK_Sub_Catalogue FOREIGN KEY(Cat_ID) REFERENCES Catalogue(Cat_ID)
);

CREATE TABLE Photo
(
    Pho_ID int auto_increment,
    Pho_name varchar(30) NOT NULL,
    Pho_extension VARCHAR(3) NOT NULL,
    Pho_details varchar(45) NOT NULL,
    Pro_ID int NOT NULL,
    PRIMARY KEY(Pho_ID),
    CONSTRAINT FK_Product_Photo FOREIGN KEY(Pro_ID) REFERENCES Produit(Pro_ID)
);

/* Alter Tables */


/* DELETE TABLES */
DROP TABLE IF EXISTS Sub_Catalogue;
DROP TABLE IF EXISTS Catalogue;
DROP TABLE IF EXISTS Photo;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Countries;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Adresse;
DROP TABLE IF EXISTS Order_details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Delivery_adresse;
DROP TABLE IF EXISTS Client;
