CREATE table ASSET_MANAGER_AGENT(
AGENT_ID BIGINT,
MANDATE_ID BIGINT,
PRICING_PARAMETER_ID BIGINT,
CONSTRAINT FK_ASSET_MANAGER_AGENT_AGENT_ID FOREIGN KEY (AGENT_ID) REFERENCES AGENT(ID),
CONSTRAINT FK_ASSET_MANAGER_AGENT_MANDATE_ID FOREIGN KEY (MANDATE_ID) REFERENCES MANDATE(ID),
CONSTRAINT FK_ASSET_MANAGER_AGENT_PRICING_PARAMETER_ID FOREIGN KEY (PRICING_PARAMETER_ID) REFERENCES PRICING_PARAMETER(ID));