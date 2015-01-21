package com.thaiscada.demo.model;

import java.util.ArrayList;

public class NationalityData {
	private String Nationality;
	private ArrayList<SexDatabyYear> listSexData;
	
	public void setNationality(String nationality){
		this.Nationality = nationality;	
	}
	
	public void setListSexData(ArrayList<SexDatabyYear> listSexData){
		this.listSexData = listSexData;		
	}
	
	public String getNationality(){
		return 	Nationality;	
	}
	
	public ArrayList<SexDatabyYear> getListSexData(){
		return listSexData;
	}
}
