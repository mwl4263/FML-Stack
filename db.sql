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
    PRIMARY KEY (creditCardHolderId)
);

CREATE TABLE CreditCards(
    creditCardId INT NOT NULL AUTO_INCREMENT,
    creditCardNumber VARCHAR(16) NOT NULL,
    creditCardHolderId INT NOT NULL,
    creditCardName VARCHAR(255) NOT NULL,
    creditCardExpirationDate VARCHAR(5) NOT NULL,
    creditCardSecurityCode VARCHAR(4) NOT NULL,
    PRIMARY KEY (creditCardId),
    FOREIGN KEY (creditCardHolderId) REFERENCES Users(creditCardHolderId)

);

-- Users table
INSERT INTO USERS(
    FIRSTNAME,
    LASTNAME,
    ZIPCODE,
    USERNAME,
    PASSWORD
) VALUES (
    'John',
    'Doe',
    '10001',
    'johndoe',
    'password123'
),
(
    'Jane',
    'Smith',
    '10002',
    'janesmith',
    'password456'
),
(
    'Michael',
    'Johnson',
    '10003',
    'michaelj',
    'password789'
),
(
    'Emily',
    'Davis',
    '10004',
    'emilyd',
    'password012'
),
(
    'William',
    'Brown',
    '10005',
    'williamb',
    'password345'
),
(
    'Sophia',
    'Wilson',
    '10006',
    'sophiaw',
    'password678'
),
(
    'David',
    'Garcia',
    '10007',
    'davidg',
    'password901'
),
(
    'Olivia',
    'Rodriguez',
    '10008',
    'oliviar',
    'password234'
),
(
    'Ethan',
    'Martinez',
    '10009',
    'ethanm',
    'password567'
),
(
    'Ava',
    'Lee',
    '10010',
    'avalee',
    'password890'
);

INSERT INTO CREDITCARDS(
    CREDITCARDNUMBER,
    CREDITCARDHOLDERID,
    CREDITCARDNAME,
    CREDITCARDEXPIRATIONDATE,
    CREDITCARDSECURITYCODE
) VALUES (
    '1234567890123456',
    1,
    'John Doe',
    '12/25',
    '123'
),
(
    '9876543210987654',
    2,
    'Jane Smith',
    '05/24',
    '456'
),
(
    '4444333322221111',
    3,
    'Michael Johnson',
    '06/27',
    '789'
),
(
    '2222111133334444',
    4,
    'Emily Davis',
    '03/26',
    '012'
),
(
    '5555444433332222',
    5,
    'William Brown',
    '02/24',
    '345'
),
(
    '6666555577778888',
    6,
    'Sophia Wilson',
    '07/25',
    '678'
),
(
    '8888999977776666',
    7,
    'David Garcia',
    '11/26',
    '901'
),
(
    '7777666644441111',
    8,
    'Olivia Rodriguez',
    '09/24',
    '234'
),
(
    '9999888877775555',
    9,
    'Ethan Martinez',
    '10/25',
    '567'
),
(
    '3333222211114444',
    10,
    'Ava Lee',
    '08/26',
    '890'
),
(
    '1111222233334444',
    1,
    'John Doe',
    '01/23',
    '321'
),
(
    '9999888877775555',
    2,
    'Jane Smith',
    '02/24',
    '654'
),
(
    '4444333322221111',
    3,
    'Michael Johnson',
    '03/25',
    '987'
),
(
    '5555666677778888',
    4,
    'Emily Davis',
    '04/26',
    '210'
),
(
    '6666777788889999',
    5,
    'William Brown',
    '05/27',
    '543'
),
(
    '7777888899990000',
    6,
    'Sophia Wilson',
    '06/28',
    '876'
),
(
    '8888999977776666',
    7,
    'David Garcia',
    '07/29',
    '109'
),
(
    '1111222233334444',
    8,
    'Olivia Rodriguez',
    '08/30',
    '432'
),
(
    '3333222211114444',
    9,
    'Ethan Martinez',
    '09/31',
    '765'
);