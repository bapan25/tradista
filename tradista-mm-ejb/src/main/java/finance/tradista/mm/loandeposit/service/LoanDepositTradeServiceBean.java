package finance.tradista.mm.loandeposit.service;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.security.PermitAll;
import javax.ejb.Stateless;
import javax.interceptor.Interceptors;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSContext;

import org.jboss.ejb3.annotation.SecurityDomain;

import finance.tradista.core.common.exception.TradistaBusinessException;
import finance.tradista.core.trade.service.TradeAuthorizationFilteringInterceptor;
import finance.tradista.mm.loandeposit.messaging.LoanDepositTradeEvent;
import finance.tradista.mm.loandeposit.model.LoanDepositTrade;
import finance.tradista.mm.loandeposit.persistence.LoanDepositTradeSQL;

/*
 * Copyright 2015 Olivier Asuncion
 * 
 * Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.    */

@SecurityDomain(value = "other")
@PermitAll
@Stateless
public class LoanDepositTradeServiceBean implements LoanDepositTradeService {

	private ConnectionFactory factory;

	private JMSContext context;

	private Destination destination;

	@PostConstruct
	private void initialize() {
		context = factory.createContext();
	}

	@Interceptors({ LoanDepositTradeProductScopeFilteringInterceptor.class,
			TradeAuthorizationFilteringInterceptor.class })
	@Override
	public long saveLoanDepositTrade(LoanDepositTrade trade) throws TradistaBusinessException {

		LoanDepositTradeEvent event = new LoanDepositTradeEvent();
		if (trade.getId() != 0) {
			LoanDepositTrade oldTrade = LoanDepositTradeSQL.getTradeById(trade.getId());
			event.setOldTrade(oldTrade);
		}

		event.setTrade(trade);
		long result = LoanDepositTradeSQL.saveLoanDepositTrade(trade);

		context.createProducer().send(destination, event);

		return result;
	}

	@Interceptors(TradeAuthorizationFilteringInterceptor.class)
	@Override
	public LoanDepositTrade getLoanDepositTradeById(long id) {
		return LoanDepositTradeSQL.getTradeById(id);
	}

	@PreDestroy
	private void clean() {
		context.close();
	}

}