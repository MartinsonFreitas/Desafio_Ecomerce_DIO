-- Criacao de banco de dados para cenario de e-comerce

CREATE DATABASE repairShop;
USE repairShop;

CREATE TABLE clients(
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10) NOT NULL,
    Lname VARCHAR(20) NOT NULL,
    FedId CHAR(11) NOT NULL COMMENT '1 CPF por pessoa',
);

CREATE TABLE vehicles(
    idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT REFERENCES clients(idClient),
    CarModel VARCHAR(15) NOT NULL,
    CarBrand VARCHAR(10),
    CarColor VARCHAR(10),
    LicensePlate CHAR(8) NOT NULL UNIQUE,
);


CREATE TABLE mechanics(
    idMechanic INT AUTO_INCREMENT PRIMARY KEY,
    Mresponsable VARCHAR(30) NOT NULL,
    MFedId CHAR(11) NOT NULL UNIQUE,
    HourCost FLOAT,
);

CREATE TABLE autoParts(
    idParts INT PRIMARY KEY,
    Pname VARCHAR(25) NOT NULL UNIQUE,
    Pcost FLOAT,
    Pstatus ENUM('Disponivel', 'Fora de Estoque', 'Solicitado') DEFAULT 'Disponivel',
);

CREATE TABLE serviceRequests(
    idRequest INT AUTO_INCREMENT PRIMARY KEY,
    idVehicle INT FOREIGN KEY(idVehicle) REFERENCES vehicles(idVehicle),
    RequestType ENUM('Reparo', 'Revisao') DEFAULT 'Revisao',
    Description VARCHAR(255) NOT NULL,
    Status ENUM('Aprovado', 'Em andamento', 'Cancelado', 'Finalizado') DEFAULT 'Aprovado',
);

CREATE TABLE mechanicService(
    idMService INT AUTO_INCREMENT,
    idRequest INT FOREIGN KEY(idRequest) REFERENCES serviceRequests(idRequest),
    idMechanic INT PRIMARY KEY FOREIGN KEY(idMechanic) REFERENCES mechanics(idMechanic),
    workHours FLOAT,
);

CREATE TABLE partService(
    idPService INT AUTO_INCREMENT PRIMARY KEY,
    idRequest INT FOREIGN KEY(idRequest) REFERENCES serviceRequests(idRequest),
    idPart INT FOREIGN KEY(idPart) REFERENCES autoParts(idParts,
    Pquantity INT,
);