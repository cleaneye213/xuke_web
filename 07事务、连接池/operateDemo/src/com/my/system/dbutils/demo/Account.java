package com.my.system.dbutils.demo;

public class Account {
	private int id;
	private String user_name;
	private String money;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", user_name=" + user_name + ", money=" + money + "]";
	}

}
