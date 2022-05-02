CREATE table TRADE(
ID          BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY  (START WITH 1, INCREMENT BY 1),
BUY_SELL    BOOLEAN,
CREATION_DATE DATE,
TRADE_DATE  DATE,
SETTLEMENT_DATE  DATE,
PRODUCT_ID BIGINT, 
AMOUNT  DECIMAL(30,15),
COUNTERPARTY_ID BIGINT,
CURRENCY_ID BIGINT,
BOOK_ID BIGINT,
CONSTRAINT FK_TRADE_PRODUCT_ID FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID),
CONSTRAINT FK_TRADE_CURRENCY_ID FOREIGN KEY (CURRENCY_ID) REFERENCES CURRENCY(ID),
CONSTRAINT FK_TRADE_BOOK_ID FOREIGN KEY (BOOK_ID) REFERENCES BOOK(ID),
CONSTRAINT FK_TRADE_COUNTERPARTY_ID FOREIGN KEY (COUNTERPARTY_ID) REFERENCES LEGAL_ENTITY(ID));