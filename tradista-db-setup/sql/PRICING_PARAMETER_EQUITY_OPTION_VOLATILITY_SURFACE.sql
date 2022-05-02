CREATE table PRICING_PARAMETER_EQUITY_OPTION_VOLATILITY_SURFACE(
PRICING_PARAMETER_ID BIGINT NOT NULL, 
EQUITY_ID BIGINT NOT NULL,
VOLATILITY_SURFACE_ID BIGINT NOT NULL,
CONSTRAINT FK_PP_EQUITY_OPTION_VOLATILITY_SURFACE_PRICING_PARAMETER_ID FOREIGN KEY (PRICING_PARAMETER_ID) REFERENCES PRICING_PARAMETER(ID),
CONSTRAINT FK_PP_EQUITY_OPTION_VOLATILITY_SURFACE_EQUITY_ID FOREIGN KEY (EQUITY_ID) REFERENCES EQUITY(PRODUCT_ID),
CONSTRAINT FK_PP_EQUITY_OPTION_VOLATILITY_SURFACE_VOLATILITY_SURFACE_ID FOREIGN KEY (VOLATILITY_SURFACE_ID) REFERENCES VOLATILITY_SURFACE(ID));