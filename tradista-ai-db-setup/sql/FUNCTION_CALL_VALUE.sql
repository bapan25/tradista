CREATE table FUNCTION_CALL_VALUE(
FUNCTION_CALL_ID BIGINT,
VALUE_ID BIGINT,
POSITION SMALLINT NOT NULL,
CONSTRAINT FK_FUNCTION_CALL_VALUE_FUNCTION_CALL_ID FOREIGN KEY (FUNCTION_CALL_ID) REFERENCES FUNCTION_CALL(ID),
CONSTRAINT FK_FUNCTION_CALL_VALUE_VALUE_ID FOREIGN KEY (VALUE_ID) REFERENCES VALUE(ID));