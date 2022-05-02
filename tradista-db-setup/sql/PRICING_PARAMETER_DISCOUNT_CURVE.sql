CREATE table PRICING_PARAMETER_DISCOUNT_CURVE(
PRICING_PARAMETER_ID BIGINT NOT NULL, 
CURRENCY_ID BIGINT NOT NULL,
INTEREST_RATE_CURVE_ID BIGINT NOT NULL,
CONSTRAINT FK_PP_DISCOUNT_CURVE_PRICING_PARAMETER_ID FOREIGN KEY (PRICING_PARAMETER_ID) REFERENCES PRICING_PARAMETER(ID),
CONSTRAINT FK_PP_DISCOUNT_CURVE_CURRENCY_ID FOREIGN KEY (CURRENCY_ID) REFERENCES CURRENCY(ID),
CONSTRAINT FK_PP_DISCOUNT_CURVE_INTEREST_RATE_CURVE_ID FOREIGN KEY (INTEREST_RATE_CURVE_ID) REFERENCES INTEREST_RATE_CURVE(ID));