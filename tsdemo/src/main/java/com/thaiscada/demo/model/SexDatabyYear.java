package com.thaiscada.demo.model;

public class SexDatabyYear {
	private int year;
	private int totalFemale;
	private int totalMale;
	
	public void setYear(int year){
		this.year = year;		
	}

	public void setTotalFemale(int totalfemale){
		this.totalFemale = totalfemale;				
	}
	
	public void setTotalMale(int totalmale){
		this.totalMale = totalmale;		
	}
	
	public int getYear(){
		return year;		
	}
	
	public int getTotalFemale(){
		return totalFemale;		
	}

	public int getTotalMale(){
		return totalMale;		
	}

}
