package com.thaiscada.demo.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.thaiscada.demo.model.Decile2012;
import com.thaiscada.demo.model.Nationality2012;

public class GenericServiceImpl implements GenericService {

	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("rawtypes")
	public List getByNativeSQL(String query) {
		return getCurrentSession().createSQLQuery(query).list();
	}
	public List<Nationality2012> getAll() {
		return getCurrentSession().createQuery(" from Nationality2012 ").list();
	}

	public List<Nationality2012> getNationalityBy(String query) {
		return getCurrentSession().createQuery(query).list();
	}

	public List<Decile2012> getAllfromDecile() {
		return getCurrentSession().createQuery(" from Decile2012 ").list();
	}

	@Override
	public List<Decile2012> getDecileBy(String query) {
		return getCurrentSession().createQuery(query).list();
	}

	

}
