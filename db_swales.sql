-- Author : Camille Déglise
-- Date : 2023-11-17
-- Modifications : none
-- Description : Base file for building the db in the language mySQL. 
-- Contains the tables with their initial entries, according to the LDM built with the Looping software

DROP DATABASE IF EXISTS db_swales;
CREATE DATABASE db_swales;
USE db_swales;

CREATE TABLE t_client(
   idClient INT AUTO_INCREMENT,
   firstName VARCHAR(150) NOT NULL,
   lastName VARCHAR(150) NOT NULL,
   birthDate DATE NOT NULL,
   `address` VARCHAR(100) NOT NULL,
   addressNumber INT,
   phoneNumber VARCHAR(50) NOT NULL,
   registred BOOLEAN NOT NULL,
   newsLetter BOOLEAN NOT NULL,
   NPA INT NOT NULL,
   country VARCHAR(50),
   city VARCHAR(190) NOT NULL,
   PRIMARY KEY(idClient)
);

CREATE TABLE t_flat(
   idFlat INT AUTO_INCREMENT,
   room INT NOT NULL,
   `address` VARCHAR(50) NOT NULL,
   addressNumber INT NOT NULL,
   priceLocation DECIMAL(15,2),
   sleepEmplacement INT NOT NULL,
   availabld BOOLEAN NOT NULL,
   fridgd BOOLEAN NOT NULL,
   oved BOOLEAN NOT NULL,
   microwavd BOOLEAN NOT NULL,
   coffeeMaked BOOLEAN NOT NULL,
   dishWashed BOOLEAN NOT NULL,
   cleaningProducd BOOLEAN NOT NULL,
   hod BOOLEAN NOT NULL,
   fittedKitched BOOLEAN NOT NULL,
   bathtud BOOLEAN NOT NULL,
   showed BOOLEAN NOT NULL,
   toiletPaped BOOLEAN NOT NULL,
   towed BOOLEAN NOT NULL,
   babyBed BOOLEAN NOT NULL,
   hairDryed BOOLEAN NOT NULL,
   showerProductd BOOLEAN NOT NULL,
   bedSheetd BOOLEAN NOT NULL,
   hanged BOOLEAN NOT NULL,
   pillowSupd BOOLEAN NOT NULL,
   blanketSupd BOOLEAN NOT NULL,
   parkingPlacd BOOLEAN NOT NULL,
   paidParkind BOOLEAN NOT NULL,
   wifd BOOLEAN NOT NULL,
   td BOOLEAN NOT NULL,
   allowedAnimald BOOLEAN NOT NULL,
   smokingAllowed BOOLEAN NOT NULL,
   panoramicVied BOOLEAN NOT NULL,
   outdood BOOLEAN NOT NULL,
   idClient INT,
   PRIMARY KEY(idFlat),
   UNIQUE(idClient),
   FOREIGN KEY(idClient) REFERENCES t_client(idClient)
);

CREATE TABLE t_service(
   idService INT,
   `name` VARCHAR(50) NOT NULL,
   date_hour DATETIME NOT NULL,
   takeawad BOOLEAN NOT NULL,
   onSitd BOOLEAN NOT NULL,
   PRIMARY KEY(idService)
);

CREATE TABLE t_booking(
   idBooking VARCHAR(50),
   bookingDate DATETIME NOT NULL,
   arrivalDate DATETIME NOT NULL,
   departureDate DATETIME NOT NULL,
   idFlat INT NOT NULL,
   idClient INT NOT NULL,
   PRIMARY KEY(idBooking),
   FOREIGN KEY(idFlat) REFERENCES t_flat(idFlat),
   FOREIGN KEY(idClient) REFERENCES t_client(idClient)
);

CREATE TABLE t_purchaseService(
   idClient INT,
   idService INT,
   jjmmaaahhmm DATETIME NOT NULL,
   PRIMARY KEY(idClient, idService),
   FOREIGN KEY(idClient) REFERENCES t_client(idClient),
   FOREIGN KEY(idService) REFERENCES t_service(idService)
);

CREATE TABLE t_relatedService(
   idFlat INT,
   idService INT,
   PRIMARY KEY(idFlat, idService),
   FOREIGN KEY(idFlat) REFERENCES t_flat(idFlat),
   FOREIGN KEY(idService) REFERENCES t_service(idService)
);
