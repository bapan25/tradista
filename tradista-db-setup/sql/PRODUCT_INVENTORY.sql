CREATE table PRODUCT_INVENTORY(
ID BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY  (START WITH 1, INCREMENT BY 1),
PRODUCT_ID BIGINT NOT NULL,
BOOK_ID BIGINT NOT NULL,
FROM_DATE DATE NOT NULL,
TO_DATE DATE,
QUANTITY DECIMAL(30,15) NOT NULL,
AVERAGE_PRICE DECIMAL(30,15) NOT NULL,
CONSTRAINT FK_PRODUCT_INVENTORY_PRODUCT_ID FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID),
CONSTRAINT FK_PRODUCT_INVENTORY_BOOK_ID FOREIGN KEY (BOOK_ID) REFERENCES BOOK(ID));