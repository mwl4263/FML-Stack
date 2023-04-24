DROP DATABASE IF EXISTS Cards;
CREATE DATABASE Cards;
USE Cards;

CREATE TABLE Users(
    creditCardHolderId INT NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) Not NULL,
    zipCode VARCHAR(10) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(500) NOT NULL,
    PRIMARY KEY (id)
)
CREATE TABLE CreditCards(
    creditCardId INT NOT NULL AUTO_INCREMENT,
    creditCardNumber VARCHAR(16) NOT NULL,
    creditCardHolderId INT NOT NULL,
    creditCardName VARCHAR(255) NOT NULL,
    creditCardExpirationDate VARCHAR(5) NOT NULL,
    creditCardSecurityCode VARCHAR(4) NOT NULL,
    PRIMARY KEY (creditCardId),
    FOREIGN KEY (creditCardHolderId) REFERENCES Users(creditCardHolderId)

)