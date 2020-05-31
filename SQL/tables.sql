DROP TABLE IF EXISTS Suppliers;
CREATE TABLE Suppliers
(
    Supp_ID int auto_increment,
    Supp_name varchar(25) NOT NULL,
    Supp_adresse varchar(50) NOT NULL,
    Supp_city varchar(35) NOT NULL,
    Supp_phone int(20) NOT NULL,
    Supp_mail varchar(35) NOT NULL,
    PRIMARY KEY(Supp_ID)
);

DROP TABLE IF EXISTS Produits;
CREATE TABLE Produits
(
    Pro_ID int auto_increment,
    Supp_ID int,
    Pro_name varchar(35),
    Pro_prix varchar(35),
    Pro_supp varchar(80),
    Pro_desc varchar(35),
    Pro_photo varchar(45),
    Pro_stock varchar(25),
    Pro_stock_alert varchar(35),
    Pro_code_ean varchar(25),
    PRIMARY KEY(Pro_ID),
    CONSTRAINT FK_Produits FOREIGN KEY(Supp_ID) REFERENCES Suppliers(Suppliers)
);

DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients
(
    Client_ID int auto_increment,
    PRIMARY KEY(Client_ID)
);