package com.sunset.core.service;

import java.util.List;

import com.sunset.model.Cashier;

public abstract interface CashierService
{
	public void addCashier(Cashier Cashier);

	public void deleteCashierById(String userId);

	public Cashier queryCashier(String userId);

	public   List<Cashier> queryCashierList(Cashier user);

	public void updateCashier(Cashier Cashier);

	

	public Cashier queryCashierByAccount(String account);


}