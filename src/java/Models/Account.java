package Models;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author bachl
 */
public class Account {
    private String username;
    private String password;
    private int role;
    private String email;
    private String name;
    private String phone;
    private boolean status;

    public Account() {
    }

    public Account(String username, String password, int role, String email, String name, String phone, boolean status) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.status = status;
    }

    public Account(String username, String email) {
        this.username = username;
        this.email = email;
        this.name = ".";
        this.phone = ".";
        this.status = false;
        this.role = 99;
        this.name = ".";
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
