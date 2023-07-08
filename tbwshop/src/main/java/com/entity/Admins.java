package com.entity;

public class Admins {
    private Integer id; 

    private String username;

    private String password;
    
    private String type;// 账号类型
    private String sex;// 性别
    private int age;// 年龄
    private String phone;// 电话
    
    private String passwordNew;

    public String getPasswordNew() {
		return passwordNew;
	}

	public void setPasswordNew(String passwordNew) {
		this.passwordNew = passwordNew;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Admins [id=" + id + ", username=" + username + ", password=" + password + ", type=" + type + ", sex="
				+ sex + ", age=" + age + ", phone=" + phone + ", passwordNew=" + passwordNew + "]";
	}

	
    
}