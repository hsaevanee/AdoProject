package com.thaiscada.demo.service;

import java.util.List;

import com.thaiscada.demo.model.Decile2012;
import com.thaiscada.demo.model.Nationality2012;

public interface GenericService {
	public List<Object[]> getByNativeSQL(String query); 
	public List<Decile2012> getAllfromDecile();
	public List<Nationality2012> getAll();
	public List<Nationality2012> getNationalityBy(String query);
	public List<Decile2012> getDecileBy(String query);
}
