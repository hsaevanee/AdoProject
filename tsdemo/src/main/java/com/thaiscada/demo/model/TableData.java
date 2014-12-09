package com.thaiscada.demo.model;

import java.util.List;

public class TableData {
	private List<Double> data;
	private String name;

	public TableData(String name, List<Double> data) {
		this.name = name;
		this.data = data;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Double> getData() {
		return data;
	}

	public void setData(List<Double> data) {
		this.data = data;
	}

	
}
