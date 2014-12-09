package com.thaiscada.demo.model;

import java.util.List;

public class ChartData {
	public ChartData(String name, List<Double> data) {
		this.name = name;
		this.data = data;
	}

	private String name;

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

	private List<Double> data;
}
