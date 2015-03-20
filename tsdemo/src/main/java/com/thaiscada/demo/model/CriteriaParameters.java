package com.thaiscada.demo.model;

import java.util.ArrayList;

public class CriteriaParameters {

	private ArrayList<String> listConditionYear;
	public ArrayList<String> getListConditionYear() {
		return listConditionYear;
	}
	public void setListConditionYear(ArrayList<String> listConditionYear) {
		this.listConditionYear = listConditionYear;
	}
	public ArrayList<String> getListConditionGender() {
		return listConditionGender;
	}
	public void setListConditionGender(ArrayList<String> listConditionGender) {
		this.listConditionGender = listConditionGender;
	}
	public ArrayList<String> getListConditionNationality() {
		return listConditionNationality;
	}
	public void setListConditionNationality(
			ArrayList<String> listConditionNationality) {
		this.listConditionNationality = listConditionNationality;
	}
	public ArrayList<String> getListConditionDecile() {
		return listConditionDecile;
	}
	public void setListConditionDecile(
			ArrayList<String> listConditionDecile) {
		this.listConditionDecile = listConditionDecile;
	}

	private ArrayList<String> listConditionGender;
	private ArrayList<String> listConditionNationality;
	private ArrayList<String> listConditionDecile;
	
}
