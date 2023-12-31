CREATE TABLE BRANDS (
    BRAND_ID INT NOT NULL,
    NAME VARCHAR(255),
    PRIMARY KEY (BRAND_ID)
	);

CREATE TABLE PRICES (
  ID INT NOT NULL,
  BRAND_ID INT NOT NULL,
  START_DATE TIMESTAMP NOT NULL,
  END_DATE TIMESTAMP NOT NULL,
  PRICE_LIST INT NOT NULL,
  PRODUCT_ID INT NOT NULL,
  PRIORITY INT NOT NULL,
  PRICE DECIMAL(19,2) NOT NULL,
  CURR VARCHAR(3) NOT NULL,
  
  PRIMARY KEY (ID),
  CONSTRAINT FK_BRAND_ID FOREIGN KEY (BRAND_ID) REFERENCES BRANDS (BRAND_ID)
);


INSERT INTO BRANDS (BRAND_ID, NAME)
	VALUES 	(1, 'Zara'),
		 	(2, 'Bershka'),
		 	(3, 'Zara Home');

INSERT INTO PRICES (ID, BRAND_ID, START_DATE, END_DATE, PRICE_LIST, PRODUCT_ID, PRIORITY, PRICE, CURR)
	VALUES	(1, 1, '2020-06-14 00:00:00', '2020-12-31 23:59:59', 1, 35455, 0, 35.50, 'EUR'),
			(2, 1, '2020-06-14 15:00:00', '2020-06-14 18:30:00', 2, 35455, 1, 25.45, 'EUR'),
			(3, 1, '2020-06-15 00:00:00', '2020-06-15 11:00:00', 3, 35455, 1, 30.50, 'EUR'),
			(4, 1, '2020-06-15 16:00:00', '2020-12-31 23:59:59', 4, 35455, 1, 38.95, 'EUR');